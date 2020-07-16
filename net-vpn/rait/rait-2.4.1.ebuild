# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module linux-info

EGO_SUM=(
	"github.com/BurntSushi/toml v0.3.1"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0/go.mod"
	"github.com/davecgh/go-spew v1.1.0"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/go-playground/assert/v2 v2.0.1"
	"github.com/go-playground/assert/v2 v2.0.1/go.mod"
	"github.com/go-playground/locales v0.13.0"
	"github.com/go-playground/locales v0.13.0/go.mod"
	"github.com/go-playground/universal-translator v0.17.0"
	"github.com/go-playground/universal-translator v0.17.0/go.mod"
	"github.com/go-playground/validator/v10 v10.3.0"
	"github.com/go-playground/validator/v10 v10.3.0/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/go-cmp v0.4.0"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/jsimonetti/rtnetlink v0.0.0-20190606172950-9527aa82566a/go.mod"
	"github.com/jsimonetti/rtnetlink v0.0.0-20200117123717-f846d4f6c1f4"
	"github.com/jsimonetti/rtnetlink v0.0.0-20200117123717-f846d4f6c1f4/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/leodido/go-urn v1.2.0"
	"github.com/leodido/go-urn v1.2.0/go.mod"
	"github.com/mdlayher/genetlink v1.0.0"
	"github.com/mdlayher/genetlink v1.0.0/go.mod"
	"github.com/mdlayher/netlink v0.0.0-20190409211403-11939a169225/go.mod"
	"github.com/mdlayher/netlink v1.0.0/go.mod"
	"github.com/mdlayher/netlink v1.1.0"
	"github.com/mdlayher/netlink v1.1.0/go.mod"
	"github.com/mikioh/ipaddr v0.0.0-20190404000644-d465c8ab6721"
	"github.com/mikioh/ipaddr v0.0.0-20190404000644-d465c8ab6721/go.mod"
	"github.com/osteele/liquid v1.2.4"
	"github.com/osteele/liquid v1.2.4/go.mod"
	"github.com/osteele/tuesday v1.0.3"
	"github.com/osteele/tuesday v1.0.3/go.mod"
	"github.com/pkg/errors v0.8.1"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.0.1"
	"github.com/russross/blackfriday/v2 v2.0.1/go.mod"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.5.1"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/urfave/cli/v2 v2.2.0"
	"github.com/urfave/cli/v2 v2.2.0/go.mod"
	"github.com/vishvananda/netlink v1.1.1-0.20200606011528-cf6600189038"
	"github.com/vishvananda/netlink v1.1.1-0.20200606011528-cf6600189038/go.mod"
	"github.com/vishvananda/netns v0.0.0-20191106174202-0a2b9b5464df"
	"github.com/vishvananda/netns v0.0.0-20191106174202-0a2b9b5464df/go.mod"
	"github.com/vishvananda/netns v0.0.0-20200520041808-52d707b772fe"
	"github.com/vishvananda/netns v0.0.0-20200520041808-52d707b772fe/go.mod"
	"go.uber.org/atomic v1.6.0"
	"go.uber.org/atomic v1.6.0/go.mod"
	"go.uber.org/multierr v1.5.0"
	"go.uber.org/multierr v1.5.0/go.mod"
	"go.uber.org/tools v0.0.0-20190618225709-2cfd321de3ee"
	"go.uber.org/tools v0.0.0-20190618225709-2cfd321de3ee/go.mod"
	"go.uber.org/zap v1.15.0"
	"go.uber.org/zap v1.15.0/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20191002192127-34f69633bfdc/go.mod"
	"golang.org/x/crypto v0.0.0-20200204104054-c9f3fb736b72"
	"golang.org/x/crypto v0.0.0-20200204104054-c9f3fb736b72/go.mod"
	"golang.org/x/crypto v0.0.0-20200604202706-70a84ac30bf9"
	"golang.org/x/crypto v0.0.0-20200604202706-70a84ac30bf9/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20200709230013-948cd5f35899"
	"golang.org/x/crypto v0.0.0-20200709230013-948cd5f35899/go.mod"
	"golang.org/x/lint v0.0.0-20190930215403-16217165b5de"
	"golang.org/x/lint v0.0.0-20190930215403-16217165b5de/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190827160401-ba9fcec4b297/go.mod"
	"golang.org/x/net v0.0.0-20191003171128-d98b1b443823/go.mod"
	"golang.org/x/net v0.0.0-20191007182048-72f939374954/go.mod"
	"golang.org/x/net v0.0.0-20200202094626-16171245cfb2"
	"golang.org/x/net v0.0.0-20200202094626-16171245cfb2/go.mod"
	"golang.org/x/net v0.0.0-20200602114024-627f9648deb9"
	"golang.org/x/net v0.0.0-20200602114024-627f9648deb9/go.mod"
	"golang.org/x/net v0.0.0-20200707034311-ab3426394381"
	"golang.org/x/net v0.0.0-20200707034311-ab3426394381/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190312061237-fead79001313/go.mod"
	"golang.org/x/sys v0.0.0-20190411185658-b44545bcd369/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190826190057-c7b8b68b1456/go.mod"
	"golang.org/x/sys v0.0.0-20191003212358-c178f38b412c/go.mod"
	"golang.org/x/sys v0.0.0-20191008105621-543471e840be/go.mod"
	"golang.org/x/sys v0.0.0-20200121082415-34d275377bf9/go.mod"
	"golang.org/x/sys v0.0.0-20200202164722-d101bd2416d5"
	"golang.org/x/sys v0.0.0-20200202164722-d101bd2416d5/go.mod"
	"golang.org/x/sys v0.0.0-20200217220822-9197077df867/go.mod"
	"golang.org/x/sys v0.0.0-20200302150141-5c8b2ff67527/go.mod"
	"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
	"golang.org/x/sys v0.0.0-20200620081246-981b61492c35"
	"golang.org/x/sys v0.0.0-20200620081246-981b61492c35/go.mod"
	"golang.org/x/sys v0.0.0-20200625212154-ddb9806d33ae"
	"golang.org/x/sys v0.0.0-20200625212154-ddb9806d33ae/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.2"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac/go.mod"
	"golang.org/x/tools v0.0.0-20191029041327-9cc4af7d6b2c/go.mod"
	"golang.org/x/tools v0.0.0-20191029190741-b9c20aec41a5"
	"golang.org/x/tools v0.0.0-20191029190741-b9c20aec41a5/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.zx2c4.com/wireguard v0.0.20200121"
	"golang.zx2c4.com/wireguard v0.0.20200121/go.mod"
	"golang.zx2c4.com/wireguard v0.0.20200320"
	"golang.zx2c4.com/wireguard v0.0.20200320/go.mod"
	"golang.zx2c4.com/wireguard/wgctrl v0.0.0-20200609130330-bd2cb7843e1b"
	"golang.zx2c4.com/wireguard/wgctrl v0.0.0-20200609130330-bd2cb7843e1b/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/yaml.v2 v2.2.2"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.3.0"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"honnef.co/go/tools v0.0.1-2019.2.3"
	"honnef.co/go/tools v0.0.1-2019.2.3/go.mod"
)

go-module_set_globals

DESCRIPTION="R.A.I.T. - Redundant Array of Inexpensive Tunnels"
HOMEPAGE="https://gitlab.com/NickCao/RAIT"
SRC_URI="https://gitlab.com/NickCao/RAIT/-/archive/v${PV}/RAIT-v${PV}.zip
	${EGO_SUM_SRC_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

RDEPEND="virtual/wireguard"

CONFIG_CHECK="~VETH ~NET_NS"

DOCS=(README.md)

S="${WORKDIR}/RAIT-v${PV}"

src_compile() {
	go build -o rait ./cmd/rait || die
}

src_install() {
	dobin rait
	einstalldocs

	newinitd ${FILESDIR}/gravity.openrc gravity
	newinitd ${FILESDIR}/rait.openrc rait
}

pkg_postinst() {
	elog 'To make use of rait, you need VETH pairs, and you have to create it on your own.'
	elog 'Here is an example for netifrc:'
	elog ''
	elog '# Append those lines to your /etc/conf.d/net'
	elog 'type_gravity="veth"'
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
