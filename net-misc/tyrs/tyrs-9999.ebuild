# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
inherit python distutils

DESCRIPTION="Tyrs is a twitter and identi.ca client based on curse."
HOMEPAGE="https://github.com/Nic0/tyrs"
SRC_URI=""
SRC_GIT="git://github.com/Nic0/tyrs.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-vcs/git"
RDEPEND="${DEPEND}
		dev-python/python-twitter
		dev-python/setuptools
		dev-python/python-distutils-extra"

src_unpack() {
	git clone ${SRC_GIT} ${WORKDIR}/${P}
}

src_prepare() {
	python_convert_shebangs -r 2 .
	distutils_src_prepare
}

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}
