# based on
# https://github.com/mrpdaemon/gentoo-overlay/tree/master/net-print/cupswrapper-brother-hl2270dw
# and
# https://aur.archlinux.org/packages/brother-dcp7055w-cupswrapper/

EAPI=4

inherit rpm

PRINTER=DCP7055W
DESCRIPTION="CUPS driver for Brother ${PRINTER}"
HOMEPAGE="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html"
SRC_URI="http://www.brother.com/pub/bsc/linux/dlf/dcp7055wcupswrapper-${PV}-1.i386.rpm"
S="${WORKDIR}"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
         app-text/a2ps
         >=net-print/lpdfilter-brother-dcp7055w-3.0.1"

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
	mkdir -p usr/libexec/cups/filter
	mkdir -p usr/share
	mv opt/brother usr/share/brother

	sed -i 's|/opt/brother|/usr/share/brother|g' `grep -lr '/opt/brother' .`

	cp usr/share/brother/Printers/${PRINTER}/cupswrapper/brother_lpdwrapper_${PRINTER} usr/libexec/cups/filter
	mkdir -p usr/share/cups/model
	cp usr/share/brother/Printers/${PRINTER}/cupswrapper/brother-DCP-7055W-cups-en.ppd  usr/share/cups/model

	cp -r usr ${D}
}
