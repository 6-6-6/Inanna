# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A Material Design-like skin for Fcitx."
HOMEPAGE="https://github.com/hrko99/fcitx-skin-material"
SRC_URI="https://github.com/hrko99/${PN}/archive/v${PV}.tar.gz"

KEYWORDS="amd64 ~arm64 ~hppa ppc ppc64 x86"
LICENSE="Apache-2.0"
SLOT="4"

RDEPEND="app-i18n/fcitx:${SLOT}"

src_install() {
	dodir /usr/share/fcitx/skin
	insinto /usr/share/fcitx/skin
	doins -r material
}
