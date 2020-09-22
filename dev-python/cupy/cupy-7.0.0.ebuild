# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="CuPy is an implementation of NumPy-compatible multi-dimensional array on CUDA."
HOMEPAGE="https://cupy.chainer.org/"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PVR}.tar.gz -> ${PF}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cudnn cuda rocm examples test"

REQUIRED_USE="
		cudnn? ( cuda )
		^^ ( cuda rocm )"

RDEPEND="
	>=dev-python/numpy-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/fastrlock-0.3[${PYTHON_USEDEP}]
	rocm? ( dev-util/amd-rocm-meta-bin )
	cuda? ( dev-util/nvidia-cuda-toolkit )
	cudnn? ( dev-libs/cudnn )
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}"/cupy_support_cp_20.patch
)

src_prepare() {
	if use cuda; then
		export CUDA_PATH="${EPREFIX}"/opt/cuda/
	else
		export HCC_AMDGPU_TARGET=gfx701,gfx702,gfx801,gfx802,gfx803,gfx900,gfx902,gfx906
		export __HIP_PLATFORM_HCC__
		export CUPY_INSTALL_USE_HIP=1
		export ROCM_HOME="${EPREFIX}"/opt/rocm
		append-ldflags "-L '${EPREFIX}'/opt/rocm/hip/lib -L '${EPREFIX}'/opt/rocm/hiprand/lib/"
	fi
	default
}

python_install_all() {

	distutils-r1_python_install_all
	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
