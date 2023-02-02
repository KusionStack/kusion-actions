#!/bin/sh -l
set -e

APP_PATH="/usr/local/bin/kusion"

echo "kusion version:"
$APP_PATH version

subcommand=$1
workDir=$2
settings=$3
arguments=$4
filenames=$5
yes=$6
detail=$7
noStyle=$8
dryRun=$9
diffs=${10}

params=$subcommand

if [ "$subcommand" = "apply" ] || [ "$subcommand" = "compile" ]; then
    echo "input diffs: '$diffs'"
    stacks=$(kclvm /diffs_to_stacks.py "${diffs}")
    echo "all stacks: '$stacks'"

    if [ ! -n "$stacks" ]; then
        echo "no stacks to $subcommand"
        exit 0
    fi 

    if [ -n "$settings" ]; then
        params="$params -Y $settings"
    fi
    if [ -n "$arguments" ]; then
        params="$params $arguments"
    fi
    if [ -n "$filenames" ]; then
        params="$params $filenames"
    fi
    if [ "$subcommand" = "apply" ]; then
        if [ "$yes" = "true" ]; then
            params="$params --yes"
        fi
        if [ "$detail" = "true" ]; then
            params="$params --detail"
        fi
        if [ "$noStyle" = "true" ]; then
            params="$params --no-style"
        fi
        if [ "$dryRun" = "true" ]; then
            params="$params --dry-run"
        fi
    fi

    if [ -n "$workDir" ]; then
        params="$params -w $workDir"
    else
        echo "common params: $params"
        echo "foreach stacks:"
        for stack in $stacks; do
            echo "---------------- Start -----------------"
            echo "current stack is $stack"
            echo "$APP_PATH $params -w $stack"
            $APP_PATH $params -w $stack
            echo "----------------- End ------------------"
        done
    fi

fi

