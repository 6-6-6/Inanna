# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cargo unpacker

MY_USER="bitwarden"
MY_PN="bitwarden_rs"

EGIT_REPO_URI="https://github.com/dani-garcia/bitwarden_rs.git"
EGIT_BRANCH='async'

DESCRIPTION="Unofficial Bitwarden compatible server written in Rust"
HOMEPAGE="https://github.com/dani-garcia/bitwarden_rs"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-*"
IUSE="mysql postgres sqlite"

REQUIRED_USE="|| ( mysql postgres sqlite )"

DEPEND="
	>=www-apps/bitwarden-rs-web-vault-2.14.0
	acct-group/${MY_USER}
	acct-user/${MY_USER}
	virtual/rust
	dev-libs/openssl:0="
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack

	mkdir -p "${S}" || die

	pushd "${S}" > /dev/null || die
	CARGO_HOME="${ECARGO_HOME}" cargo fetch || die
	CARGO_HOME="${ECARGO_HOME}" cargo vendor "${ECARGO_VENDOR}" || die
	popd > /dev/null || die

	cargo_gen_config
}

src_configure() {
	myfeatures=(
		$(usev mysql)
		$(usex postgres postgresql '')
		$(usev sqlite)
	)
}

src_compile() {
	cargo_src_compile ${myfeatures:+--features "${myfeatures[*]}"} --no-default-features
}

src_install() {
	cargo_src_install ${myfeatures:+--features "${myfeatures[*]}"} --no-default-features

	einstalldocs

	# Install init.d and conf.d scripts
	newinitd "${FILESDIR}"/${MY_PN}.initd ${MY_PN}
	newconfd "${FILESDIR}"/${MY_PN}.confd ${MY_PN}

	# Install /etc/bitwarden_rs.env
	insinto /etc
	newins .env.template ${MY_PN}.env
	fowners root:root /etc/${MY_PN}.env
	fperms 640 /etc/${MY_PN}.env

	# Keep data dir
	keepdir /var/lib/${MY_USER}/data
	fowners ${MY_USER}:${MY_USER} /var/lib/${MY_USER}/data
	fperms 700 /var/lib/${MY_USER}/data
}

src_test() {
	cargo_src_test ${myfeatures:+--features "${myfeatures[*]}"} --no-default-features
}
