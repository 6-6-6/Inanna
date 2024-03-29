# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker xdg-utils

DESCRIPTION="Client for Baidu Netdisk"
HOMEPAGE="https://pan.baidu.com/"
SRC_URI="http://wppkg.baidupcs.com/issue/netdisk/Linuxguanjia/${PV}/${PN}_${PV}_amd64.deb -> ${PF}.deb"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="doc system-mesa -system-ffmpeg -system-vulkan"
RESTRICT="strip"

DEPEND=""
RDEPEND="
	${DEPEND}
	system-mesa? ( media-libs/mesa )
	system-ffmpeg? ( media-video/ffmpeg[chromium] )
	system-vulkan? ( media-libs/vulkan-loader )
"
BDEPEND=""
S=${WORKDIR}

src_unpack() {
	:
}

src_install() {
	dodir /
	cd "${ED}" || die
	unpacker

	use doc || rm -r usr/share/doc

	if use system-mesa; then
		rm opt/baidunetdisk/libEGL.so
		rm opt/baidunetdisk/libGLESv2.so
		rm -r opt/baidunetdisk/swiftshader/
	fi

	use system-ffmpeg && rm opt/baidunetdisk/libffmpeg.so
	use system-vulkan && rm opt/baidunetdisk/libvulkan.so
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update

	if use system-ffmpeg; then
		elog "system-video/ffmpeg[chromium] installs libffmpeg.so in ${EPREFIX}/usr/lib64/chromium/"
		elog "So you need to add the location in your ld.so.conf so that baidunetdisk is able to locate it."
	fi
}
