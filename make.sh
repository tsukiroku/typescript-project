#!/bin/bash

RAW="npm-package"

case $1 in
"node") RAW="node" ;;
esac

ROOT_DIR="./"

function make {
    rm -rf $ROOT_DIR/*
    rm -rf .gitignore
    curl -sS "https://raw.githubusercontent.com/recalculated/typescript-project/main/$RAW/package.json" >>$ROOT_DIR/package.json
    curl -sS "https://raw.githubusercontent.com/recalculated/typescript-project/main/default/.gitignore" >>$ROOT_DIR/.gitignore
    curl -sS "https://raw.githubusercontent.com/recalculated/typescript-project/main/default/LICENSE" >>$ROOT_DIR/LICENSE
    curl -sS "https://raw.githubusercontent.com/recalculated/typescript-project/main/default/tsconfig.json" >>$ROOT_DIR/tsconfig.json
    touch index.ts
    mkdir src
    echo "template has been created."
}

echo "All files/directories will be deleted."

PS3="Select [1/2]: "
select yn in "Y" "N"; do
    case $yn in
    Y)
        make
        rm -rf make.sh
        break
        ;;
    N)
        rm -rf make.sh
        break
        ;;

    *) echo "Unknown option '$REPLY'";;
    esac
done
