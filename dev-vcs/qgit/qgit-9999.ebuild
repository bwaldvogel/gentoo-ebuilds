# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit qt4-r2 git-2

DESCRIPTION="GUI interface for git/cogito SCM"
HOMEPAGE="http://digilander.libero.it/mcostalba/"
# FIXME TODO official URL is kernel.org/pub/scm/qgit/qgit4.git
EGIT_REPO_URI="git://github.com/dagenaisj/qgit4.git"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS=""
IUSE=""

DEPEND="x11-libs/qt-gui:4"
RDEPEND="${DEPEND}
	>=dev-vcs/git-1.5.3"

src_install() {
	newbin bin/qgit qgit4
	dodoc README
}
