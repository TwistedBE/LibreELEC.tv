################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="libretro-2048"
PKG_VERSION="6730b2b"
PKG_ARCH="any"
PKG_LICENSE="Public domain"
PKG_SITE="https://github.com/libretro/libretro-2048"
PKG_URL="https://github.com/libretro/libretro-2048/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="libretro-2048-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION="emulation"
PKG_SHORTDESC="game.libretro.2048: 2048 for Kodi"
PKG_LONGDESC="game.libretro.2048: 2048 for Kodi"
PKG_AUTORECONF="no"
PKG_IS_ADDON="no"

PKG_LIBNAME="2048_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="LIBRETRO_2048_LIB"

make_target() {
  make -f Makefile.libretro
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  cp $PKG_LIBPATH $INSTALL/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $INSTALL/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/$PKG_NAME-config.cmake
}

