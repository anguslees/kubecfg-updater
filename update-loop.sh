#!/bin/sh

set -e

# Git repository and branch
: ${GIT_REPO:?}
: ${GIT_BRANCH:=origin/master}

# Subdirectory of config files within GIT_REPO
: ${UPDATE_SUBDIR:=.}

# Update loop delay in seconds
: ${UPDATE_PERIOD:=600}

mkdir -p /tmp/kubecfg-update
cd /tmp/kubecfg-update

git clone -b ${GIT_BRANCH#origin/} $GIT_REPO /tmp/kubecfg-update

while :; do
    echo -n "Starting update at "; date
    git fetch
    git reset --hard $GIT_BRANCH

    kubectl apply --recursive --overwrite --record -f $UPDATE_SUBDIR

    sleep $UPDATE_PERIOD
done
