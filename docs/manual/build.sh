#!/bin/sh
mkdir -p _shake
command -v stack >/dev/null 2>&1
if [ $? -eq 0 ]; then
    stack ghc -- --make Build.hs -rtsopts -with-rtsopts=-I0 -outputdir=_shake -o _shake/build && _shake/build "$@"
else
    ghc --make Build.hs -rtsopts -with-rtsopts=-I0 -outputdir=_shake -o _shake/build && _shake/build "$@"
fi
