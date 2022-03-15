# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo unpacker

MY_USER="bitwarden"

DESCRIPTION="Unofficial Bitwarden compatible server written in Rust"
HOMEPAGE="https://github.com/dani-garcia/vaultwarden"
#SRC_URI="https://github.com/dani-garcia/${PN}/archive/${PV}.tar.gz"
SRC_URI="https://github.com/dani-garcia/vaultwarden/archive/8d06d9c1111d642d0c2d03c1d29b0170e79f0c11.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql postgres sqlite"

REQUIRED_USE="|| ( mysql postgres sqlite )"

BDEPEND="
	>=virtual/rust-1.59.0"
DEPEND="
	acct-group/${MY_USER}
	acct-user/${MY_USER}
	dev-libs/openssl:0="
RDEPEND="${DEPEND}
	>=www-apps/bitwarden-rs-web-vault-2.26.0"

src_unpack() {
	unpacker

	#mkdir -p "${S}" || die
	mv vaultwarden-8d06d9c1111d642d0c2d03c1d29b0170e79f0c11 "${S}" || die

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
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}

	# Install /etc/bitwarden_rs.env
	insinto /etc
	newins .env.template ${PN}.env
	fowners root:root /etc/${PN}.env
	fperms 600 /etc/${PN}.env

	# Keep data dir
	keepdir /var/lib/${MY_USER}/data
	fowners ${MY_USER}:${MY_USER} /var/lib/${MY_USER}/data
	fperms 700 /var/lib/${MY_USER}/data
}

src_test() {
	cargo_src_test ${myfeatures:+--features "${myfeatures[*]}"} --no-default-features
}
