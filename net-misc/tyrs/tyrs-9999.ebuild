# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

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

src_configure() {
	python setup.py build
}

src_install() {
	python setup.py install
}
