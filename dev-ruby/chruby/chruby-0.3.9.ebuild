# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Small script for changing current Ruby version in shell."
HOMEPAGE="https://github.com/postmodern/chruby"
SRC_URI="https://github.com/postmodern/chruby/archive/v${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| ( app-shells/bash app-shells/zsh )"
RDEPEND="${DEPEND}"

src_install() (
	emake PREFIX="${D}/usr" install
)

pkg_postinst() (
	elog "chruby aims to be project-specific Ruby version changer. "
	elog "For changing system default Ruby version use "
	elog "app-eselect/eselect-ruby."
)
