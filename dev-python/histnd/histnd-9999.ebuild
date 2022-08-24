# Copyright 2017-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

PYTHON_COMPAT=( python3_{9,10} )

inherit cargo distutils-r1 git-r3

DESCRIPTION="A python module that computes multi-dimensional histogram."
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/6-6-6/histnd"
SRC_URI=""
EGIT_REPO_URI="https://github.com/6-6-6/${PN}"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 BSD-3-Clause MIT"
RESTRICT="network-sandbox"
SLOT="0"
KEYWORDS=""
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
