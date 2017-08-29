#!/bin/bash

set -u -e

SELF_DIR="$(dirname $(readlink -f $0))"
REPO_DIR="$SELF_DIR/repo"
META_DIR="$SELF_DIR/meta-data"

DESC_FILE="$META_DIR/description"
TS_FILE="$META_DIR/timestamp"
LIST_FILE="$META_DIR/list"

echo " * Preparing files"
rm -f $LIST_FILE
rm -f $DESC_FILE
rm -f $TS_FILE

echo " * Building user script list"
for dir in `ls $REPO_DIR`; do
    if [[ -e "$REPO_DIR/$dir/info" ]]; then
        echo "    * Found $dir"
        echo "$dir" >> $LIST_FILE
    fi
done

echo " * Building meta-data"
export LC_TIME=en_US.utf-8
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
date > $TS_FILE

cat > $DESC_FILE << EOF
NeoTerm User Script repository.
Built by build-all.sh

Copyright(C) 2017 NeoTerm
EOF

