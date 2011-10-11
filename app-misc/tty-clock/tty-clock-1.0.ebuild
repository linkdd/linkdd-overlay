# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils git-2

DESCRIPTION="lightweight digital clock in ncurses"
HOMEPAGE="http://github.com/xorg62/tty-clock"

EGIT_REPO_URI="http://github.com/xorg62/tty-clock"
EGIT_BRANCH="master"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ~mips ppc ppc64 sparc x86"
IUSE=""

DEPEND="dev-vcs/git
	sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_compile() {
	make || die "Error: src_compile failed!"
}

src_install() {
	mkdir -p "${D}/usr/bin/"
	make INSTALLPATH="${D}/usr/bin/" install || die "Error: src_install failed!"
}
