# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils cmake-utils
MY_PN="${PN}-fingerprinter"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Core component of the Acoustid audio fingerprinting project."
HOMEPAGE="http://acoustid.org/chromaprint"
SRC_URI="https://github.com/downloads/lalinsky/${PN}/${P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

IUSE="fftw examples"
DEPEND="fftw? ( sci-libs/fftw:3.0 )
	!fftw? ( virtual/ffmpeg )"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with fftw FFTW3)
		$(cmake-utils_use_build examples EXAMPLES)
	)
	cmake-utils_src_configure
}
