# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils prefix

DESCRIPTION="A volunteer-built media solution that puts you in control of your media."
HOMEPAGE="https://jellyfin.org/"
SRC_URI="https://repo.jellyfin.org/releases/server/linux/versions/stable-rc/combined/${PV}~rc4/${PN}_${PV}~rc4.tar.gz"
S="${WORKDIR}/${PN}_${PV}~rc4"

KEYWORDS="-* ~amd64"
SLOT="0"
LICENSE="GPL-2"
RESTRICT="mirror test"

RDEPEND="
	acct-user/${PN}
	acct-group/${PN}
	dev-libs/icu
	>=media-video/ffmpeg-4.0[encode,fdk,mp3,opus,theora,v4l,vorbis,vpx,webp,x264,xvid]"
DEPEND="${RDEPEND}"

PROG_DIR="/usr/lib/${PN}"

QA_PREBUILT="
	${PROG_DIR}/lib*.so
	${PROG_DIR}/jellyfin
	${PROG_DIR}/createdump"

src_unpack() {
	unpack ${A}
	mv ${PN}_${PV} ${P}
}

src_install() {
	# prepare service unit
	newconfd "$(prefixify_ro "${FILESDIR}"/${PN}.confd)" ${PN}
	newinitd "$(prefixify_ro "${FILESDIR}"/${PN}.initd)" ${PN}
	# prepare application data
	diropts -o ${PN} -g ${PN}
	insopts -o ${PN} -g ${PN} -m 644

	dodir ${PROG_DIR}
	insinto ${PROG_DIR}
	exeinto ${PROG_DIR}
	doins -r *
	doexe ${PN}
}

pkg_postinst() {
	einfo "The executable of ${PN} is installed in ${PROG_DIR}."
	einfo "You may start the service with \`rc-service ${PN} start\`"
}
