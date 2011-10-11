# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils git

DESCRIPTION="Window Manager From Scratch is a lightweight tiling window manager."
HOMEPAGE="http://wmfs.info/"
SRC_URI=""

EGIT_REPO_URI="http://github.com/xorg62/wmfs"
EGIT_BRANCH="wmfs2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xinerama"

DEPEND="dev-vcs/git
		dev-util/pkgconfig"

RDEPEND="${DEPEND}
		x11-libs/libX11
		xinerama? ( x11-libs/libXinerama )"

src_unpack() {
	git_src_unpack || die "src_unpack failed!"
}

src_configure() {
	if ! use xinerama; then
		./configure --without-xinerama
	else
		./configure
	fi
}
