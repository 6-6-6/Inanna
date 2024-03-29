# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4

EAPI=8

CRATES="
	async-stream-0.3.4
	async-stream-impl-0.3.4
	autocfg-1.1.0
	bitflags-1.3.2
	bytes-1.4.0
	cc-1.0.79
	cfg-if-1.0.0
	clap-4.1.8
	clap_derive-4.1.8
	clap_lex-0.3.2
	enum_index-0.2.0
	enum_index_derive-0.2.0
	errno-0.2.8
	errno-dragonfly-0.1.2
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	futures-core-0.3.27
	futures-macro-0.3.27
	futures-task-0.3.27
	futures-util-0.3.27
	hashbrown-0.12.3
	heck-0.4.1
	hermit-abi-0.2.6
	hermit-abi-0.3.1
	hex-0.4.3
	indexmap-1.9.2
	indoc-2.0.1
	io-lifetimes-1.0.6
	ipnet-2.7.1
	is-terminal-0.4.4
	itoa-1.0.6
	libc-0.2.140
	linux-raw-sys-0.1.4
	log-0.4.17
	memchr-2.5.0
	mio-0.8.6
	num_cpus-1.15.0
	num_enum-0.5.11
	num_enum_derive-0.5.11
	once_cell-1.17.1
	openssl-0.10.45
	openssl-macros-0.1.0
	openssl-src-111.25.1+1.1.1t
	openssl-sys-0.9.80
	os_str_bytes-6.4.1
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.26
	proc-macro-crate-1.3.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.52
	quote-0.3.15
	quote-1.0.26
	rsvici-0.1.1
	rustix-0.36.9
	ryu-1.0.13
	semver-1.0.17
	serde-1.0.156
	serde_derive-1.0.156
	serde_json-1.0.94
	serde_vici-0.1.2
	slab-0.4.8
	socket2-0.4.9
	strsim-0.10.0
	syn-0.11.11
	syn-1.0.109
	synom-0.11.3
	termcolor-1.2.0
	thiserror-1.0.39
	thiserror-impl-1.0.39
	tokio-1.26.0
	tokio-macros-1.8.2
	tokio-stream-0.1.12
	toml_datetime-0.6.1
	toml_edit-0.19.6
	unicode-ident-1.0.8
	unicode-xid-0.0.4
	vcpkg-0.2.15
	version_check-0.9.4
	wasi-0.11.0+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.45.0
	windows-targets-0.42.2
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_msvc-0.42.2
	windows_i686_gnu-0.42.2
	windows_i686_msvc-0.42.2
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_msvc-0.42.2
	winnow-0.3.5
"

inherit cargo

DESCRIPTION="redundant array of networks"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/NickCao/ranet"
SRC_URI="$(cargo_crate_uris)
	https://github.com/NickCao/ranet/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=net-misc/bird-2.9999
	net-vpn/strongswan"
BDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

src_install() {
	cargo_src_install
	newconfd "${FILESDIR}"/ranet.confd ranet
	newinitd "${FILESDIR}"/ranet.initd ranet
	keepdir /etc/ranet
}
