# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7} )

inherit distutils-r1

DESCRIPTION="Exploratory analysis of Bayesian models with Python"
HOMEPAGE="https://github.com/arviz-devs/arviz"
SRC_URI="https://github.com/arviz-devs/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
"
DEPEND="${RDEPEND}
"

