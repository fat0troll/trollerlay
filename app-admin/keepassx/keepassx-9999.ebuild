# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils git-r3

DESCRIPTION="Qt password manager compatible with its Win32 and Pocket PC versions. Fork by linux.org.ru user surefire with additional features."
HOMEPAGE="http://keepassx.sourceforge.net/"
EGIT_REPO_URI=(
	"https://github.com/repsac-by/keepassx.git"
)

LICENSE="LGPL-2.1 GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug test"

RDEPEND="dev-libs/libgcrypt:=
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	sys-libs/zlib
	sys-auth/oath-toolkit
	dev-libs/qjson
"

DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
	dev-qt/qtconcurrent:5
	test? ( dev-qt/qttest:5 )
"

src_prepare() {
	 use test || \
		sed -e "/^find_package(Qt5Test/d" -i CMakeLists.txt || die

	 cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with test TESTS)
		-DWITH_GUI_TESTS=OFF
	)
	cmake-utils_src_configure
}

pkg_postinst() {
	elog "This package is a forked version of KeePassX, "
	elog "mainteined by surefire (https://github.com/repsac-by)."
	elog "If you see any errors, first contact him."
}
