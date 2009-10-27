# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

DESCRIPTION="Collect system informations for the hardware4linux.info site"
HOMEPAGE="http://hardware4linux.info"
SRC_URI="http://hardware4linux.info/res/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=sys-apps/dmidecode-2.8 >=sys-apps/pciutils-2.2.0"
RDEPEND=""

src_compile() {
	cc -o scan-printers scan-printers.c
}


src_install() {
	dobin hwreport
	dobin scan-printers
	einfo "You can now generate your reports and post them on $HOMEPAGE"
}
