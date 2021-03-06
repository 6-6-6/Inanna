# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils prefix

DESCRIPTION="A volunteer-built media solution that puts you in control of your media."
HOMEPAGE="https://jellyfin.org/"
SRC_URI="https://repo.jellyfin.org/releases/server/linux/stable/server/${PN}-server_${PV}_linux-amd64.tar.gz
		https://repo.jellyfin.org/releases/server/linux/stable/web/${PN}-web_${PV}_portable.tar.gz"


KEYWORDS="-* ~amd64"
SLOT="0"
LICENSE="GPL-2"
RESTRICT="mirror test"
IUSE="+x265 vaapi v4l"

RDEPEND="
	acct-user/${PN}
	acct-group/${PN}
	dev-libs/icu
	>=media-video/ffmpeg-4.0[encode,fdk,mp3,opus,theora,vorbis,vpx,webp,x264,xvid,x265?,vaapi?,v4l?]
	sys-libs/glibc"
DEPEND="${RDEPEND}"

PROG_DIR="/usr/lib/${PN}"

QA_PREBUILT="
	${PROG_DIR}/System.*.so
	${PROG_DIR}/jellyfin
	${PROG_DIR}/libSkiaSharp.so
	${PROG_DIR}/libhostfxr.so
	${PROG_DIR}/libhostpolicy.so"

src_unpack() {
	unpack ${A}
	mv ${PN}-server_${PV} ${P} || die
	mv ${PN}-web_${PV} ${P}/jellyfin-web || die
}

src_install() {
	# prepare service unit
	newconfd "$(prefixify_ro "${FILESDIR}"/${PN}.confd)" ${PN}
	newinitd "$(prefixify_ro "${FILESDIR}"/${PN}.initd)" ${PN}
	# prepare application data
	diropts -o ${PN} -g ${PN}
	insopts -o ${PN} -g ${PN} -m 644

	dodir ${PROG_DIR}
	insinto ${PROG_DIR}
	exeinto ${PROG_DIR}
	doins -r *
	doexe ${PN}
}

pkg_postinst() {
	einfo "The executable of ${PN} is installed in ${PROG_DIR}."
	einfo "You may start the service with \`rc-service ${PN} start\`"
}
