# based on
# https://github.com/mrpdaemon/gentoo-overlay/tree/master/net-print/lpdfilter-brother-hl2270dw
# and
# https://aur.archlinux.org/packages/brother-dcp7055w-lpr/

EAPI=4

inherit rpm

PRINTER=DCP7055W
DESCRIPTION="LPD filter for Brother ${PRINTER}"
HOMEPAGE="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html"
SRC_URI="http://www.brother.com/pub/bsc/linux/dlf/dcp7055wlpr-${PV}-1.i386.rpm"
S="${WORKDIR}"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
	mkdir -p usr/share
	# correct the directory structure
	mv opt/brother usr/share/brother
	sed -i 's|/opt/brother|/usr/share/brother|g' `grep -lr '/opt/brother' .`

	# copy into place
	cp -r usr ${D}
}

