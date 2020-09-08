# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual for DHCP client"
SLOT="0"
KEYWORDS="amd64 arm64 ppc64"

RDEPEND="|| (
		net-misc/dhcpcd
		net-misc/dhcp[client(+)]
	)"
