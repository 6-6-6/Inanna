# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{11,12} )

inherit distutils-r1

DESCRIPTION="Index files and directories into elastic search"
SRC_URI="https://github.com/Ellerhold/${PN}/archive/refs/tags/${PV}.tar.gz"
HOMEPAGE="https://github.com/Ellerhold/fs2es-indexer"

LICENSE="Proprietary"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
SAMBA_DEPEND="net-fs/samba[spotlight]"
RDEPEND=">dev-python/pyyaml-5.0[${PYTHON_USEDEP}]
	>=dev-python/elasticsearch-8.0[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}

	dodir /etc/fs2es-indexer
	fowners nobody:nogroup /etc/fs2es-indexer
	fperms 700 /etc/fs2es-indexer
	insinto /etc/fs2es-indexer
	newins config.dist.yml config.yml
}
