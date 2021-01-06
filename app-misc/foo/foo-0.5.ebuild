# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

S=${WORKDIR}

# /usr/lib/foo is a file
src_install() {
	touch foo
	insinto /usr/lib
	doins foo

}
