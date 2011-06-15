# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
inherit cmake-utils

EAPI=3

DESCRIPTION="Window Manager From Scratch is a lightweight tiling window manager."
HOMEPAGE="http://wmfs.info/"
SRC_URI=""
SRC_GIT="git://github.com/xorg62/wmfs.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="imlib2 xrandr xinerama xft"

DEPEND="dev-vcs/git
		dev-util/pkgconfig"

RDEPEND="${DEPEND}
		x11-libs/libX11
		imlib2? ( media-libs/imlib2[png] )
		xrandr? ( x11-libs/libXrandr x11-apps/xrandr )
		xinerama? ( x11-libs/libXinerama )
		xft? ( x11-libs/libXft media-libs/freetype )"

src_unpack() {
	git clone -b splitlayout ${SRC_GIT} ${WORKDIR}/${P}
}

src_configure() {
	cmake-utils_src_configure \
		$(cmake-utils_use_with imlib2) \
		$(cmake-utils_use_with xrandr) \
		$(cmake-utils_use_with xinerama) \
		$(cmake-utils_use_with xft) || die "Error: cmake configure failed!"
}

src_compile() {
	cmake-utils_src_make || die "Error: make failed!"
}

src_install() {
	cmake-utils_src_install
}
