# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="Open Source Password Management for You and Your Business"
ACCT_USER_HOME=/var/lib/bitwarden
ACCT_USER_GROUPS=( bitwarden )

acct-user_add_deps
