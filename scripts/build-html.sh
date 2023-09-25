#!/usr/bin/env bash

# copy Sphinx files
cp -R sphinx/* _build/rst

# build HTML files
sphinx-build -M html _build/rst _build -v

# copy images
mkdir -p _build/html/wiki/wiki
find wiki -type f ! -name "*.mediawiki" -exec cp {} _build/html/wiki/wiki \;

# copy PKI files
cp -R pki _build/html
