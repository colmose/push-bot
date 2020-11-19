
#!/bin/sh

# check values
if [ -z "${token}" ]; then
    echo "error: not found token"
    exit 1
fi

if [ -z "${branch_name}" ]; then
   export branch_name=master
fi

if [ -z "${bot_name}" ]; then
   export bot_name=admin-machine
fi

# initialize git
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
