# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_8,3_9} )

inherit distutils-r1

DESCRIPTION="Setuptools Rust extension plugin"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/PyO3/setuptools-rust"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/setuptools-46.1[${PYTHON_USEDEP}]
	>=dev-python/semantic_version-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/toml-0.9.0[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
