# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual for dotnetcore-sdk"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="|| (
		dev-dotnet/dotnetcore-sdk
		dev-dotnet/dotnetcore-sdk-bin
	)"
