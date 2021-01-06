# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
RDEPEND="app-misc/foo" # we depend on foo
DEPEND="${RDEPEND}"

S=${WORKDIR}

# /usr/lib/foo is a directory and a dependency may own files in it
src_install() {
	touch lel
	insinto /usr/lib/foo
	doins lel
}
