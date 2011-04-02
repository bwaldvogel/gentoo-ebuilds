# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Identifies your CPU(s) using the CPUID instuction or kernel module"
HOMEPAGE="http://www.etallen.com/cpuid.html"
SRC_URI="http://www.etallen.com/cpuid/${P}.src.tar.gz"

KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="as-is"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake BUILDROOT="${D}" install || die "emake install failed"
}

