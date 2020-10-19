# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="phonon-backend-mpv"
inherit ecm kde.org

DESCRIPTION="MPV backend for the Phonon multimedia library"
HOMEPAGE="https://github.com/OpenProgger/phonon-mpv"

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="https://github.com/OpenProgger/${PN}/archive/v${PV}.tar.gz"
	KEYWORDS="amd64 ~arm arm64 ~ppc ~ppc64 x86"
fi

LICENSE="LGPL-2.1+ || ( LGPL-2.1 LGPL-3 )"
SLOT="0"
IUSE="debug"

BDEPEND="
	dev-qt/linguist-tools:5
	virtual/pkgconfig
"
DEPEND="
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	>=media-libs/phonon-4.10.60
	media-video/mpv[libmpv]
"
RDEPEND="${DEPEND}"

