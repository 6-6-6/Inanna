# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{11,12} )

inherit distutils-r1

DESCRIPTION="Python client for Elasticsearch"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/elastic/elasticsearch-py"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="async requests"
RDEPEND="<dev-python/elastic-transport-9[${PYTHON_USEDEP}]
	async? ( <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	requests? ( <dev-python/requests-3.0.0[${PYTHON_USEDEP}] )"
distutils_enable_tests pytest
