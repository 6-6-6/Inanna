# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Proxies NDP messages between interfaces"
HOMEPAGE="https://github.com/DanielAdolfsson/ndppd"
SRC_URI="https://codeload.github.com/DanielAdolfsson/ndppd/zip/f2fc683bbd71ab6f7ca9031845b839ace2486684 -> ${P}.zip"

LICENSE="GPL-3"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-ruby/asciidoctor"
RDEPEND=""

S="${WORKDIR}"/${PN}-e1746bb59706adba96506ba06e30da0762638265

src_install()
{
	newbin "${BUILD_DIR}"/${PN} ${PN}-${SLOT}
	insinto /etc
	newins ${PN}.conf-dist ${PN}-${SLOT}.conf
	newinitd "${FILESDIR}"/${PN}-${SLOT}.initd ${PN}-${SLOT}
}

