# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A free-to-win rhythm game. Rhythm is just a click away!"
HOMEPAGE="https://osu.ppy.sh/home"
SRC_URI="https://github.com/ppy/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-dotnet/dotnetcore-sdk-bin"
RDEPEND="${DEPEND}"

src_compile() {
	dotnet build osu.Desktop -c Release

	sed "s/-version-/${PV}/" "${FILESDIR}"/osu > osu
}

src_install() {
	dodir "${DOTNET_ROOT}"/shared/${PN}/${PV}/
	dotnet publish -c Release -o "${ED}/${DOTNET_ROOT}"/shared/${PN}/${PV}/

	exeinto /usr/bin
	doexe osu
}
