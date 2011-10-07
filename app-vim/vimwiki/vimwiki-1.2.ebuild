# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Vimwiki is a personal wiki for vim"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2226"
LICENSE="MIT"
KEYWORDS="alpha amd64 ia64 ~mips ppc ppc64 sparc x86"
SRC_URI="http://vimwiki.googlecode.com/files/vimwiki-1-2.zip"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

src_unpack() {
	unzip ${DISTDIR}/vimwiki-1-2.zip -d ${WORKDIR}/vimwiki-1.2
}
