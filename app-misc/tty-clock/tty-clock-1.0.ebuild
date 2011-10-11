# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils git

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
	git_src_unpack || die "Error: src_unpack failed!"
}

src_compile() {
	make || die "Error: src_compile failed!"
}

src_install() {
	make install || die "Error: src_install failed!"
}
