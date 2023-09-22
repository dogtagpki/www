#!/usr/bin/env bash

MEDIAWIKI_FOLDER="wiki"
RST_FOLDER="_build/rst"

echo "Converting README.mediawiki"

mkdir -p $RST_FOLDER
pandoc -f mediawiki -t html README.mediawiki | pandoc -f html-native_divs-native_spans -t rst -o $RST_FOLDER/index.rst

for MEDIAWIKI_PATH in $(find $MEDIAWIKI_FOLDER -name "*.mediawiki");
do
    echo "Converting $MEDIAWIKI_PATH"

    MEDIAWIKI_DIR=$(dirname $MEDIAWIKI_PATH)
    MEDIAWIKI_FILE=$(basename $MEDIAWIKI_PATH)

    RST_DIR=$RST_FOLDER/${MEDIAWIKI_DIR}
    RST_FILE=${MEDIAWIKI_FILE/.mediawiki/.rst}
    RST_PATH=$RST_DIR/$RST_FILE

    mkdir -p $RST_DIR
    pandoc -f mediawiki -t html $MEDIAWIKI_PATH | pandoc -f html-native_divs-native_spans -t rst -o $RST_PATH
done
