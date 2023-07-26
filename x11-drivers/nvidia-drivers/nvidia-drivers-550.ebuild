# Copyright 2019-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
SLOT=0
KEYWORDS="*"

src_unpack() {
	mkdir "${S}"
}


src_install() {
	insinto /etc/ld.so.conf.d/
	doins "${FILESDIR}"/99-host-nvidia-drivers.conf
}

pkg_postinst() {
	ldconfig
	elog "Please run \`ldconfig\` for the prefix to recognize host's nvidia-driver"
}
