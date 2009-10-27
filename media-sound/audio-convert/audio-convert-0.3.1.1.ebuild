# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Convert wav, ogg, mp3, mpc, flac, ape, aac or wma files into wav, ogg, mp3, mpc, flac, ape or aac files"
HOMEPAGE="https://savannah.nongnu.org/projects/audio-convert"
SRC_URI="http://download.savannah.gnu.org/releases/audio-convert/${P}.tar.gz"
RESTRICT="nomirror"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="lame ogg mpc mp3 flac faac faad wma"

RDEPEND="app-shells/bash
	>=sys-apps/file-4.16
	gnome-extra/zenity
	sys-apps/gawk
	lame? ( media-sound/lame )
	ogg? ( media-sound/vorbis-tools )
	mp3? ( media-libs/libid3tag )
	mpc? ( media-sound/musepack-tools )
	flac? ( media-libs/flac )
	faac? ( media-libs/faac )
	faad? ( media-libs/faad2 )
	wma? ( media-video/mplayer )"
DEPEND=""

src_install() {
    dobin audio-convert
}

