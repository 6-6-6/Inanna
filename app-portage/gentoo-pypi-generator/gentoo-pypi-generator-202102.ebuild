# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_8,3_9} )

inherit distutils-r1

DESCRIPTION="Generate ebuild from PyPI packages with ease."
HOMEPAGE="https://isrc.iscas.ac.cn/gitlab/summer2020/students/proj-2027131"
SRC_URI="https://isrc.iscas.ac.cn/gitlab/summer2020/students/proj-2027131/-/archive/7d6c2ac5d03ba881a30edeaa6d6fcdd9aea4182c/proj-2027131-7d6c2ac5d03ba881a30edeaa6d6fcdd9aea4182c.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/requests"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/proj-2027131-7d6c2ac5d03ba881a30edeaa6d6fcdd9aea4182c"

src_prepare() {
	echo "#!/usr/bin/python" > "${S}"/${PN}
	cat "${S}"/generator.py >> "${S}"/${PN}
	ln -s "${FILESDIR}"/setup.py "${S}"/
	distutils-r1_src_prepare
}
