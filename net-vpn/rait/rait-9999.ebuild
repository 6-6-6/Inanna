# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info

DESCRIPTION="R.A.I.T. - Redundant Array of Inexpensive Tunnels"
HOMEPAGE="https://gitlab.com/NickCao/RAIT"

if [[ ${PV} == 9999 ]]; then
	SRC_URI="https://gitlab.com/NickCao/RAIT/-/jobs/artifacts/bind/raw/bin/rait?job=build:binary -> ${P}"
else
	SRC_URI=""
fi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="virtual/wireguard"

CONFIG_CHECK="~VETH
	~NET_NS"

src_unpack() {
	mkdir -p ${S}
	cp ${DISTDIR}/${A} ${S}
}

src_install() {
	dodir /usr/bin
	exeinto /usr/bin
	newbin ${S}/${P} ${PN}

	newinitd ${FILESDIR}/gravity.openrc gravity
	newinitd ${FILESDIR}/rait.openrc rait
}

pkg_preinst() {
	elog 'To make use of rait, you need VETH pairs, and you have to create it on your own.'
	elog 'Here is an example for netifrc:'
	elog ''
	elog '# Append those lines to your /etc/conf.d/net'
	elinux-infolog 'type_gravity="veth"'
	elog 'veth_gravity_peer1="gravity"'
	elog 'veth_gravity_peer2="raitlocal"'
	elog 'veth_gravity_ns2="gravity"'
	elog 'config_gravity="2a0c:b641:69c:ffff::1/64"'
	elog ''
	elog 'rc_net_raitlocal_need="net.gravity"'
	elog 'type_raitlocal="veth"'
	elog 'veth_raitlocal_create="no"'
	elog 'config_raitlocal="2a0c:b641:69c:ffff::2/64"'
}
