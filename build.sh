#!/bin/sh

CUR_DIR=$(cd `dirname $0`; pwd)
BUILD_DIR="$CUR_DIR/~build"
PKG_DIR="$CUR_DIR/~pkg"

[ -d "${BUILD_DIR}" ] || mkdir "${BUILD_DIR}"
[ -d "${PKG_DIR}" ] || mkdir "${PKG_DIR}"


_build(){
  sourcedir="$CUR_DIR/$1"
  [ -d "$sourcedir" ] || return
  
  workdir="$BUILD_DIR/$1"
  [ -d "$workdir" ] || mkdir "$workdir"
  cd "$workdir"
  ln -s "$sourcedir/*" ./
  
  makepkg -s
  
  mv *.pkg.tar.xz "${PKG_DIR}"
}

for pkg in $@ ; do
  _build $pkg
done
