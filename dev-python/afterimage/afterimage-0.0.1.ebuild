# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12} )
DISTUTILS_USE_PEP517="hatchling"

inherit distutils-r1

DESCRIPTION="A helper for creating and managing btrfs snapshots."
SRC_URI="https://share.kyouka.moe/nebula/${P}.tar.gz"
HOMEPAGE="https://github.com/6-6-6/afterimage"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

S="${WORKDIR}/afterimage-5a33f0902c47c806bfd9dd9c18ab5b8a4be8e360"
IUSE=""
RDEPEND="
	dev-python/tomli-w[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	sys-fs/btrfs-progs[python]
"
