# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9,10} )

inherit distutils-r1

DESCRIPTION="Index files and directories into elastic search"
SRC_URI="https://github.com/Ellerhold/${PN}/archive/refs/tags/${PV}.tar.gz"
HOMEPAGE="https://github.com/Ellerhold/fs2es-indexer"

LICENSE="Proprietary"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">dev-python/pyyaml-5.0[${PYTHON_USEDEP}]
	>=dev-python/elasticsearch-8.0[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
