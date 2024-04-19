# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="gprMax"
MY_P="${MY_PN}-v.${PV}"
S="${WORKDIR}/${MY_P}"
PYTHON_COMPAT=( python3_{11,12} )

inherit distutils-r1

DESCRIPTION="Electromagnetic Modelling Software based on the Finite-Difference Time-Domain (FDTD) method"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/archive/refs/tags/v.${PV}.tar.gz -> ${P}.tgz"
HOMEPAGE="http://www.gprmax.com"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

IUSE="jupyter cuda mpi"
RDEPEND="dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/h5py[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/terminaltables[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	cuda? ( dev-python/pycuda[${PYTHON_USEDEP}] )
	jupyter? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	mpi? ( dev-python/mpi4py[${PYTHON_USEDEP}] )
"
distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}/${PN}-3.1.6-renaming.patch"
)

src_configure() {
	distutils-r1_src_configure
	mv user_libs gprmax_userlibs || dies
}

src_prepare() {
	distutils-r1_src_prepare
	sed -i 's/^setup($/packages.remove("tests")\npackages.append("gprMax\/pml_updates")\nsetup(/g' setup.py || die
	sed -i 's/platform.linux_distribution()\[0\]/"gentoo"/g' gprMax/utilities.py || die
}

python_compile() {
	_distutils-r1_copy_egg_info
	esetup.py build_py "${@}"
	esetup.py build_ext "${@}"
}

src_install() {
	distutils-r1_src_install

	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins -r "${S}"/tools "${S}"/user_models
}

pkg_postinst() {
	ewarn "The user_models/ provided by gprMax was installed at /usr/share/${PN}."
	ewarn "The tools/ provided by gprMax was installed at /usr/share/${PN}."
	ewarn "The user_libs/ provided by gprMax was renamed to gprmax_userlibs"
}
