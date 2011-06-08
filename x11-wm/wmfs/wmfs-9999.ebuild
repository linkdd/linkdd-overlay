# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

EAPI=3

DESCRIPTION="Window Manager From Scratch is a lightweight tiling window manager."
HOMEPAGE="http://wmfs.info/"
SRC_URI=""
SRC_GIT="git://github.com/xorg62/wmfs.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="imlib2 xrandr xinerama"

DEPEND="dev-vcs/git
		dev-util/pkgconfig
		x11-libs/libX11
		x11-libs/libXft
		media-libs/freetype"

RDEPEND="${DEPEND}
		imlib2? ( media-libs/imlib2[png] )
		xrandr? ( x11-libs/libXrandr x11-apps/xrandr )
		xinerama? ( x11-libs/libXinerama )"

src_unpack() {
	git clone -b splitlayout ${SRC_GIT} ${WORKDIR}/${P}
}

src_configure() {
	econf \
		$(use_with imlib2) \
		$(use_with xrandr) \
		$(use_with xinerama)
}

src_compile() {
	emake || die "Error: make failed!"
}

src_install() {
	emake install DESTDIR="${D}" || die "Error: make install failed!"
}
