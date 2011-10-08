# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools git-2

DESCRIPTION="Adds PulseAudio support to the Flash browser plugin"
HOMEPAGE="http://git.0pointer.de/?p=libflashsupport.git;a=summary"
EGIT_REPO_URI="git://git.0pointer.de/libflashsupport.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE="+openssl +pulseaudio"

DEPEND="openssl? ( dev-libs/openssl )
	pulseaudio? ( media-sound/pulseaudio )"
RDEPEND="${DEPEND}"

src_prepare() {
	# remove V4L1
	sed -i 's|#define V4L1|//#define V4L1|g' flashsupport.c || die "sed
	failed"

	if ! use openssl; then
		sed -i 's|#define OPENSSL|//#define OPENSSL|g' flashsupport.c || die
		"sed failed"
	fi

	if ! use pulseaudio; then
		sed -i 's|#define PULSEAUDIO|//#define PULSEAUDIO|g' flashsupport.c ||
			die "sed failed"
	fi

	eautoreconf
}
