# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="Jellyfin Media Server user"
ACCT_USER_ID=5103
ACCT_USER_HOME=/var/lib/jellyfin
ACCT_USER_GROUPS=( jellyfin )

acct-user_add_deps
