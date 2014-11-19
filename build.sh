#!/bin/sh

# just for simplifying the jobs

curdir=$(cd `dirname $0`; pwd)
cachedir="$curdir/~build"
export PKGDEST="$curdir/~pkg"

[ -d "${BUILDDIR}" ] || mkdir "${BUILDDIR}"
[ -d "${PKGDEST}" ] || mkdir "${PKGDEST}"


_build(){
  sourcedir="$curdir/$1"
  [ -d "$sourcedir" ] || return
  
  workdir="$cachedir/$1"
  [ -d "$workdir" ] || mkdir "$workdir"
  cd "$workdir"
  ln -s $sourcedir/* ./ 2> /dev/null
  
  makepkg -s
  
  #mv *.pkg.tar.xz "${PKGDEST}"
}

for pkg in $@ ; do
  _build $pkg
done
