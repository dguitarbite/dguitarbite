#!/usr/bin/env bash
# Sample file taken from https://github.com/sontek/dotfiles
# Warning Not yet ready.
function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"
    if [ -L "${target}" ]; then
        unlink $target
    fi

    if [ -e "${target}" ] && [ ! -L "${target}" ]; then
        mv $target $target.df.bak
    fi

    ln -sf ${source} ${target}
}

function unlink_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}.df.bak" ] && [ -L "${target}" ]; then
        unlink ${target}
        mv $target.df.bak $target
    fi
}

if [ "$1" = "restore" ]; then
    for i in _*
    do
        echo "Lazy Bastard do it yourselves!"
        #unlink_file $i
    done
    exit
else
    for i in _*
    do
        echo "Lazy Bastard do it yourselves!"
        #link_file $i
    done
fi
