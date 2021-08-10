# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

PYTHON_COMPAT=( python{3_8,3_9} )

CRATES="
autocfg-1.0.1
bitflags-1.2.1
cfg-if-0.1.10
cfg-if-1.0.0
crossbeam-channel-0.5.1
crossbeam-deque-0.8.0
crossbeam-epoch-0.9.4
crossbeam-utils-0.8.4
ctor-0.1.20
either-1.6.1
ghost-0.1.2
hermit-abi-0.1.18
indoc-0.3.6
indoc-impl-0.3.6
instant-0.1.9
inventory-0.1.10
inventory-impl-0.1.10
lazy_static-1.4.0
libc-0.2.94
lock_api-0.4.4
matrixmultiply-0.2.4
memoffset-0.6.3
ndarray-0.14.0
num-complex-0.3.1
num-integer-0.1.44
num-traits-0.2.14
num_cpus-1.13.0
numpy-0.13.1
parking_lot-0.11.1
parking_lot_core-0.8.3
paste-0.1.18
paste-impl-0.1.18
proc-macro-hack-0.5.19
proc-macro2-1.0.26
pyo3-0.13.2
pyo3-macros-0.13.2
pyo3-macros-backend-0.13.2
quote-1.0.9
rawpointer-0.2.1
rayon-1.5.0
rayon-core-1.9.0
redox_syscall-0.2.8
scopeguard-1.1.0
smallvec-1.6.1
syn-1.0.72
unicode-xid-0.2.2
unindent-0.1.7
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo distutils-r1 git-r3

DESCRIPTION="A python module that computes multi-dimensional histogram."
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/6-6-6/histnd"
SRC_URI="$(cargo_crate_uris ${CRATES})"
EGIT_REPO_URI="https://github.com/6-6-6/${PN}"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 BSD-3-Clause MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/setuptools-rust
	virtual/rust"
RDEPEND="
	dev-python/numpy"

src_test() {
	cargo_src_test
	distutils-r1_src_test
}