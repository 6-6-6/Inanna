# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="Overleaf user"
ACCT_USER_ID=-1
ACCT_USER_HOME=/var/lib/sharelatex
ACCT_USER_GROUPS=( ${PN} )

acct-user_add_deps
