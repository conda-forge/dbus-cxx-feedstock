#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

autoreconf --force --verbose --install

./configure --prefix=$PREFIX --disable-ecore --disable-tests --disable-examples || { cat config.log ; exit 1 ; }
make
make install

cd $PREFIX
find . '(' -name '*.la' -o -name '*.a' ')' -delete
