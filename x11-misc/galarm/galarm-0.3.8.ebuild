# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils cmake-utils

DESCRIPTION="a tool to popup an alarm message and play a sound after a given time"
HOMEPAGE="http://galarm.0x11.net"
SRC_URI="https://github.com/bwaldvogel/${PN}/tarball/${PV} -> ${P}.tar.gz"
LICENSE="GPL 2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+libcanberra"
DEPEND=">=dev-libs/glib-2.14:2
	>=x11-libs/gtk+-2.12:2
	>=x11-libs/libnotify-0.4.5
	libcanberra? ( >=media-libs/libcanberra-0.25[sound] )"

RDEPEND="${DEPEND}
	dev-util/pkgconfig"

src_unpack() {
	unpack ${A}
	mv *-${PN}-* "${S}"
}

src_configure() {
	cmake-utils_src_configure
}
