# Copyright 2016-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="https://github.com/overleaf/overleaf.git"
else
	# overleaf does not make releases
	SRC_URI=""
	exit
fi

MY_ALIAS="sharelatex"
KEYWORDS="~amd64"

inherit prefix ${ECLASS}

DESCRIPTION="A web-based collaborative LaTeX editor"
HOMEPAGE="https://www.overleaf.com/"

LICENSE="AGPL-3"
SLOT="0"
## TODO: network-sandbox MUST be enabled
RESTRICT="network-sandbox"
IUSE="+spell qpdf"

DEPEND="net-libs/nodejs:0/12"
RDEPEND="
	acct-user/${PN}
	acct-group/${PN}
	app-text/texlive
	dev-tex/latexmk
	qpdf? ( app-text/qpdf )
	spell? ( app-text/aspell )
"
## dependency cantidates
# media-gfx/imagemagick
# app-text/qpdf
# media-gfx/optipng

src_prepare() {
	default
	mkdir build/target -p
	cp services/* ./build/target -vr || die "failed to copy source code"
	cp server-ce/*js ./build || die "failed to copy helper scripts"
	#
	pushd build || die
	node genScript.js install | grep -v rm > compile.sh
	popd || die
}

src_compile() {
	# compile targets
	pushd build/target || die
	sh ../compile.sh || die "failed to compile components of overleaf "
	pushd ../ || die
	node genScript.js compile | grep -v rm > post.sh
	popd || die
	sh ../post.sh || die
	popd || die
	### generate initd, prefixify later
	# argument is: 
	#     resources dir
	#     log dir
	#     workdir
	#     user
	python "${FILESDIR}"/generate_initd.py \
		/usr/share/${PN} \
		/var/log/${PN} \
		/var/lib/${MY_ALIAS} \
		${PN} || die "failed to generate initd"
}

src_install() {
	# resources
	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins -r build/target/*

	# initd and configuration
	for initd in build/initds/*; do
		newinitd $(prefixify_ro ${initd}) $(basename ${initd})
	done

	# configuration
	insopts --owner=${PN} --group=${PN} --mode=600
	diropts --owner=${PN} --group=${PN} --mode=700
	dodir /etc/${PN}
	insinto /etc/${PN}
	newins $(prefixify_ro "${FILESDIR}"/${PN}_commons.conf) commons.conf
	newins "${FILESDIR}"/${PN}_web.conf web.conf

	# runtime dir
	dodir /var/lib/${MY_ALIAS}
	keepdir /var/lib/${MY_ALIAS}/data/user_files
	keepdir /var/lib/${MY_ALIAS}/data/cache
	keepdir /var/lib/${MY_ALIAS}/tmp
	insinto /var/lib/${MY_ALIAS}
	doins build/settings.js

	# log dir
	keepdir /var/log/${PN}
}

pkg_postinst() {
	elog "Before starting overleaf, please update \`${EPREFIX}/etc/${PN}/*\`"
	elog "and make sure only proper user could visit it."
	elog
	elog "Finally, to start the service, simply run \`rc-service overleaf start\`."
}
