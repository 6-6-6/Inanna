# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	ahash@0.7.6
	ahash@0.8.3
	aho-corasick@1.1.2
	alloc-no-stdlib@2.0.4
	alloc-stdlib@0.2.2
	allocator-api2@0.2.16
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	argon2@0.5.2
	async-channel@1.9.0
	async-compression@0.4.4
	async-executor@1.6.0
	async-global-executor@2.3.1
	async-io@1.13.0
	async-lock@2.8.0
	async-process@1.8.1
	async-signal@0.2.4
	async-std@1.12.0
	async-stream@0.3.5
	async-stream-impl@0.3.5
	async-task@4.5.0
	async-trait@0.1.74
	atomic@0.5.3
	atomic@0.6.0
	atomic-waker@1.1.2
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.13.1
	base64@0.21.4
	base64ct@1.6.0
	binascii@0.1.4
	bitflags@1.3.2
	bitflags@2.4.1
	blake2@0.10.6
	block-buffer@0.10.4
	blocking@1.4.1
	brotli@3.4.0
	brotli-decompressor@2.5.0
	bumpalo@3.14.0
	bytemuck@1.14.0
	byteorder@1.5.0
	bytes@1.5.0
	cached@0.46.0
	cached_proc_macro@0.18.0
	cached_proc_macro_types@0.1.0
	cc@1.0.83
	cfg-if@1.0.0
	chrono@0.4.31
	chrono-tz@0.8.3
	chrono-tz-build@0.2.0
	chumsky@0.9.2
	concurrent-queue@2.3.0
	cookie@0.16.2
	cookie@0.17.0
	cookie_store@0.16.2
	cookie_store@0.19.1
	core-foundation@0.9.3
	core-foundation-sys@0.8.4
	cpufeatures@0.2.10
	crc32fast@1.3.2
	cron@0.12.0
	crossbeam-utils@0.8.16
	crypto-common@0.1.6
	darling@0.14.4
	darling_core@0.14.4
	darling_macro@0.14.4
	dashmap@5.5.3
	data-encoding@2.4.0
	data-url@0.3.0
	deranged@0.3.9
	devise@0.4.1
	devise_codegen@0.4.1
	devise_core@0.4.1
	diesel@2.1.3
	diesel_derives@2.1.2
	diesel_logger@0.3.0
	diesel_migrations@2.1.0
	diesel_table_macro_syntax@0.1.0
	digest@0.10.7
	dotenvy@0.15.7
	either@1.9.0
	email-encoding@0.2.0
	email_address@0.2.4
	encoding_rs@0.8.33
	enum-as-inner@0.6.0
	equivalent@1.0.1
	errno@0.3.5
	error-chain@0.12.4
	event-listener@2.5.3
	event-listener@3.0.0
	fastrand@1.9.0
	fastrand@2.0.1
	fern@0.6.2
	figment@0.10.11
	flate2@1.0.28
	fnv@1.0.7
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	form_urlencoded@1.2.0
	futures@0.3.28
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-lite@1.13.0
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-timer@3.0.2
	futures-util@0.3.28
	generator@0.7.5
	generic-array@0.14.7
	getrandom@0.2.10
	gimli@0.28.0
	glob@0.3.1
	gloo-timers@0.2.6
	governor@0.6.0
	h2@0.3.21
	half@1.8.2
	handlebars@4.4.0
	hashbrown@0.12.3
	hashbrown@0.14.2
	heck@0.4.1
	hermit-abi@0.3.3
	hmac@0.12.1
	home@0.5.5
	hostname@0.3.1
	html5gum@0.5.7
	http@0.2.9
	http-body@0.4.5
	httparse@1.8.0
	httpdate@1.0.3
	hyper@0.14.27
	hyper-tls@0.5.0
	iana-time-zone@0.1.58
	iana-time-zone-haiku@0.1.2
	ident_case@1.0.1
	idna@0.2.3
	idna@0.3.0
	idna@0.4.0
	indexmap@1.9.3
	indexmap@2.0.2
	inlinable_string@0.1.15
	instant@0.1.12
	io-lifetimes@1.0.11
	ipconfig@0.3.2
	ipnet@2.8.0
	is-terminal@0.4.9
	itoa@1.0.9
	jetscii@0.5.3
	job_scheduler_ng@2.0.4
	js-sys@0.3.64
	jsonwebtoken@9.0.0
	kv-log-macro@1.0.7
	lazy_static@1.4.0
	lettre@0.11.0
	libc@0.2.149
	libmimalloc-sys@0.1.35
	libsqlite3-sys@0.26.0
	linked-hash-map@0.5.6
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.10
	lock_api@0.4.11
	log@0.4.20
	loom@0.5.6
	lru-cache@0.1.2
	mach2@0.4.1
	match_cfg@0.1.0
	matchers@0.1.0
	matches@0.1.10
	memchr@2.6.4
	migrations_internals@2.1.0
	migrations_macros@2.1.0
	mimalloc@0.1.39
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.8
	multer@2.1.0
	mysqlclient-sys@0.2.5
	native-tls@0.2.11
	no-std-compat@0.4.1
	nom@7.1.3
	nonzero_ext@0.3.0
	nu-ansi-term@0.46.0
	num-bigint@0.4.4
	num-derive@0.4.1
	num-integer@0.1.45
	num-traits@0.2.17
	num_cpus@1.16.0
	num_threads@0.1.6
	object@0.32.1
	once_cell@1.18.0
	openssl@0.10.57
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@111.28.0+1.1.1w
	openssl-sys@0.9.92
	overload@0.1.1
	parking@2.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	parse-zoneinfo@0.3.0
	password-hash@0.5.0
	paste@1.0.14
	pear@0.2.7
	pear_codegen@0.2.7
	pem@3.0.2
	percent-encoding@2.3.0
	pest@2.7.4
	pest_derive@2.7.4
	pest_generator@2.7.4
	pest_meta@2.7.4
	phf@0.11.2
	phf_codegen@0.11.2
	phf_generator@0.11.2
	phf_shared@0.11.2
	pico-args@0.5.0
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	piper@0.2.1
	pkg-config@0.3.27
	polling@2.8.0
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	pq-sys@0.4.8
	proc-macro2@1.0.69
	proc-macro2-diagnostics@0.10.1
	psl-types@2.0.11
	psm@0.1.21
	publicsuffix@2.2.3
	quanta@0.11.1
	quick-error@1.2.3
	quote@1.0.33
	quoted_printable@0.5.0
	r2d2@0.8.10
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	raw-cpuid@10.7.0
	redox_syscall@0.3.5
	redox_syscall@0.4.1
	ref-cast@1.0.20
	ref-cast-impl@1.0.20
	regex@1.10.2
	regex-automata@0.1.10
	regex-automata@0.4.3
	regex-syntax@0.6.29
	regex-syntax@0.8.2
	reopen@1.0.3
	reqwest@0.11.22
	resolv-conf@0.7.0
	ring@0.16.20
	ring@0.17.5
	rmp@0.8.12
	rmpv@1.0.1
	rpassword@7.2.0
	rtoolbox@0.0.1
	rustc-demangle@0.1.23
	rustix@0.37.26
	rustix@0.38.20
	rustls@0.21.7
	rustls-pemfile@1.0.3
	rustls-webpki@0.101.6
	rustversion@1.0.14
	ryu@1.0.15
	same-file@1.0.6
	schannel@0.1.22
	scheduled-thread-pool@0.2.7
	scoped-tls@1.0.1
	scopeguard@1.2.0
	sct@0.7.0
	security-framework@2.9.2
	security-framework-sys@2.9.1
	semver@1.0.20
	serde@1.0.189
	serde_cbor@0.11.2
	serde_derive@1.0.189
	serde_json@1.0.107
	serde_spanned@0.6.3
	serde_urlencoded@0.7.1
	sha-1@0.10.1
	sha1@0.10.6
	sha2@0.10.8
	sharded-slab@0.1.7
	signal-hook@0.3.17
	signal-hook-registry@1.4.1
	simple_asn1@0.6.2
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.11.1
	socket2@0.4.10
	socket2@0.5.5
	spin@0.5.2
	spin@0.9.8
	stable-pattern@0.1.0
	stacker@0.1.15
	state@0.6.0
	strsim@0.10.0
	subtle@2.5.0
	syn@1.0.109
	syn@2.0.38
	syslog@6.1.0
	system-configuration@0.5.1
	system-configuration-sys@0.5.0
	tempfile@3.8.0
	thiserror@1.0.50
	thiserror-impl@1.0.50
	thread_local@1.1.7
	threadpool@1.8.1
	time@0.3.30
	time-core@0.1.2
	time-macros@0.2.15
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.33.0
	tokio-macros@2.1.0
	tokio-native-tls@0.3.1
	tokio-rustls@0.24.1
	tokio-socks@0.5.1
	tokio-stream@0.1.14
	tokio-tungstenite@0.19.0
	tokio-util@0.7.9
	toml@0.7.8
	toml@0.8.2
	toml_datetime@0.6.3
	toml_edit@0.19.15
	toml_edit@0.20.2
	totp-lite@2.0.0
	tower-service@0.3.2
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-log@0.1.3
	tracing-subscriber@0.3.17
	trust-dns-proto@0.23.1
	trust-dns-resolver@0.23.1
	try-lock@0.2.4
	tungstenite@0.19.0
	typenum@1.17.0
	ubyte@0.10.4
	ucd-trie@0.1.6
	uncased@0.9.9
	unicode-bidi@0.3.13
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-xid@0.2.4
	untrusted@0.7.1
	untrusted@0.9.0
	url@2.4.1
	utf-8@0.7.6
	uuid@1.5.0
	valuable@0.1.0
	value-bag@1.4.2
	vcpkg@0.2.15
	version_check@0.9.4
	waker-fn@1.1.1
	walkdir@2.4.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-futures@0.4.37
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	wasm-streams@0.3.0
	web-sys@0.3.64
	webauthn-rs@0.3.2
	which@5.0.0
	widestring@1.0.2
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.48.0
	windows-core@0.51.1
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
	winnow@0.5.17
	winreg@0.50.0
	yansi@0.5.1
	yansi@1.0.0-rc.1
	yubico@0.11.0
"

inherit cargo

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

MY_USER="bitwarden"

DESCRIPTION="Unofficial Bitwarden compatible server written in Rust"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/dani-garcia/vaultwarden"
SRC_URI="https://github.com/dani-garcia/vaultwarden/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		${CARGO_CRATE_URIS}"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="(Apache-2.0 0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 GPL-3 ISC MIT MIT) MPL-2.0 Unlicense ZLIB"

SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql postgres sqlite"
REQUIRED_USE="|| ( mysql postgres sqlite )"

BDEPEND="
	>=virtual/rust-1.68.2"
DEPEND="
	acct-group/${MY_USER}
	acct-user/${MY_USER}
	dev-libs/openssl:0="
RDEPEND="${DEPEND}
	>=www-apps/bitwarden-rs-web-vault-2023.10.0"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

# fuck
## rocket is a piece of shit
RESTRICT="network-sandbox"
EVCS_OFFLINE=""
ECARGO_OFFLINE=""
src_unpack() {
	cargo_src_unpack
	sed -i "s/offline = true/offline = false/" "${ECARGO_HOME}/config"
}
# end of fuck


src_configure() {
	myfeatures=(
		$(usev mysql)
		$(usex postgres postgresql '')
		$(usev sqlite)
	)
	cargo_src_configure --no-default-features
}

src_install() {
	cargo_src_install

	einstalldocs

	# Install init.d and conf.d scripts
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}

	# Install /etc/bitwarden_rs.env
	insinto /etc
	newins .env.template ${PN}.env
	fowners root:root /etc/${PN}.env
	fperms 600 /etc/${PN}.env

	# Keep data dir
	keepdir /var/lib/${MY_USER}/data
	fowners ${MY_USER}:${MY_USER} /var/lib/${MY_USER}/data
	fperms 700 /var/lib/${MY_USER}/data
}

src_test() {
	cargo_src_test
}
