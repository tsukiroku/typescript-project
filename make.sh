#!/bin/bash

RAW="npm-package"

case $1 in
"node") RAW="node" ;;
esac

ROOT_DIR="./"

function make {
    rm -rf $ROOT_DIR/*
    rm -rf .gitignore
    rm -rf .github
    touch index.ts
    mkdir src
    mkdir .github && mkdir .github/workflows
    curl -sS "https://recalculated.github.io/typescript-project/$RAW/package.json" >>$ROOT_DIR/package.json
    curl -sS "https://recalculated.github.io/typescript-project/default/LICENSE" >>$ROOT_DIR/LICENSE
    curl -sS "https://recalculated.github.io/typescript-project/default/tsconfig.json" >>$ROOT_DIR/tsconfig.json
    curl -sS "https://recalculated.github.io/typescript-project/default/.json" >>$ROOT_DIR/tsconfig.json
    curl -sS "https://recalculated.github.io/typescript-project/default/npm_publish.yml" >>$ROOT_DIR/.github/workflows/npm_publish.yml
    curl -sS "https://raw.githubusercontent.com/recalculated/typescript-project/main/default/.gitignore" >>$ROOT_DIR/.gitignore
    echo "template has been created. ($RAW)"
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

    *) echo "Unknown option '$REPLY'" ;;
    esac
done
