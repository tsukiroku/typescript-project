#!/bin/bash

RAW="npm-package"

case $1 in
"node") RAW="node" ;;
esac

ROOT_DIR="./"

function make {
    rm -rf $ROOT_DIR/*
    rm -rf .gitignore
    curl -sS "https://raw.githubusercontent.com/recalculated/typescript-project/main/$RAW/.gitignore" >> $ROOT_DIR/.gitignore
    curl -sS "https://raw.githubusercontent.com/recalculated/typescript-project/main/$RAW/LICENSE" >> $ROOT_DIR/LICENSE
    curl -sS "https://raw.githubusercontent.com/recalculated/typescript-project/main/$RAW/package.json" >> $ROOT_DIR/package.json
    curl -sS "https://raw.githubusercontent.com/recalculated/typescript-project/main/$RAW/tsconfig.json" >> $ROOT_DIR/tsconfig.json
    touch index.ts
    mkdir src
}

echo "⚠️  All files/directories will be deleted."

select yn in "Y" "N"; do
    case $yn in
    Y)
        make
        break
        ;;
    N) break ;;
    esac
done
