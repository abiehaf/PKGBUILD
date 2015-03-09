#!/bin/sh

cd 0-pkg

rm abihf.db*

repo-add abihf.db.tar.gz *.pkg.tar.xz
gpg --sign abihf.db.tar.gz
