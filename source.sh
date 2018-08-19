#!/bin/bash

scmd="npx sls  "

s-install () {
    npm install -g npm@">=5.2.0"
    npm install
}

s-deploy () {
    eval $scmd deploy --verbose
}

s-info () {
    eval $scmd info --verbose > INFO.md
    more INFO.md
}

s-run () {
    if [ -z "$2" ]; then
        eval $scmd invoke local -f $1 -l
    else
        eval $scmd invoke local -f $1 -l --path $2
    fi
}

s-run-remote () {
    if [ -z "$2" ]; then
        eval $scmd invoke -f $1 -l
    else
        eval $scmd invoke -f $1 -l --path $2
    fi
}


s-remove () {
    if [ -n "$ZSH_VERSION" ]; then
        read "?Are you sure you want to continue?"
    else
        read -p  "?Are you sure you want to continue?" prompt
    fi
    eval $scmd remove --verbose
}

s-logs () {
    if [ -n "$2" ]; then
        eval $scmd logs -f $1 -t --filter $2
    else
        eval $scmd logs -f $1 -t --startTime 1m
    fi
}

