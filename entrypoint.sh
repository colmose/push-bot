#!/bin/sh -l

token=$1
branch_name=$2
bot_name=$3

REPO_REF="https://${bot_name}:${token}@github.com/${GITHUB_REPOSITORY}.git"
git config http.sslVerify false
git config user.name "${bot_name}"
git config user.email "${bot_name}@users.noreply.github.com"
git remote add upstream "${REPO_REF}"
git branch --verbose

git checkout ${branch_name}
git add -A
timestamp=$(date -u)
git commit -m "Bot published ${GITHUB_SHA} at ${timestamp}" || exit 0
git pull --rebase upstream ${branch_name}
git push upstream ${branch_name}
