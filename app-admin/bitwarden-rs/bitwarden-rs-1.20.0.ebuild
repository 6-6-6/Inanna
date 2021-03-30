# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo unpacker

MY_USER="bitwarden"
MY_PN="bitwarden_rs"

DESCRIPTION="Unofficial Bitwarden compatible server written in Rust"
HOMEPAGE="https://github.com/dani-garcia/bitwarden_rs"
SRC_URI="https://github.com/dani-garcia/${MY_PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql postgres sqlite"

REQUIRED_USE="|| ( mysql postgres sqlite )"

# TODO: rocket depends on rust-nightly
#       upstream will switch to stable rust in 0.5.0 release
#       update this ebuild when it happens
DEPEND="
	acct-group/${MY_USER}
	acct-user/${MY_USER}
	dev-lang/rust[nightly]
	dev-libs/openssl:0="
RDEPEND="${DEPEND}
	>=www-apps/bitwarden-rs-web-vault-2.19.0"

S="${WORKDIR}"/${MY_PN}-${PV}
src_unpack() {
	unpacker

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
