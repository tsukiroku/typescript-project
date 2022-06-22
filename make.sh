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
    curl -sS "https://tsukiroku.github.io/typescript-project/$RAW/package.json" >>$ROOT_DIR/package.json
    curl -sS "https://tsukiroku.github.io/typescript-project/default/LICENSE" >>$ROOT_DIR/LICENSE
    curl -sS "https://tsukiroku.github.io/typescript-project/default/tsconfig.json" >>$ROOT_DIR/tsconfig.json
    curl -sS "https://raw.githubusercontent.com/tsukiroku/typescript-project/main/default/.gitignore" >>$ROOT_DIR/.gitignore
    
    if [ "$RAW" = "npm-package" ]; then
        mkdir .github && mkdir .github/workflows
        curl -sS "https://tsukiroku.github.io/typescript-project/npm-package/npm_publish.yml" >>$ROOT_DIR/.github/workflows/npm_publish.yml
        echo "template has been created. ($RAW)"
    fi
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
