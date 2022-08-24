# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9,10} )

inherit distutils-r1

DESCRIPTION="Transport classes and utilities shared among Python Elastic client libraries"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/elastic/elastic-transport-python"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="develop"
RDEPEND="<dev-python/urllib3-2[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	develop? ( dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}] )"
distutils_enable_tests pytest
