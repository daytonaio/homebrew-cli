#!/bin/bash
# Commit one formula and push it to master.
#
#   scripts/commit_formula.sh daytona.rb "Automated file update to - v2.0.0"
#
# Runs of different formulae are in different concurrency groups, so another
# formula's update can land on master between this run's checkout and its
# push. A rejected push is rebased onto the new master and pushed again; the
# runs touch different files, so the rebase never conflicts. A conflict (the
# same formula changed meanwhile) fails the run instead of overwriting it.
set -euo pipefail

formula="${1:?usage: commit_formula.sh FORMULA MESSAGE}"
message="${2:?usage: commit_formula.sh FORMULA MESSAGE}"
branch="${BRANCH:-master}"
attempts="${ATTEMPTS:-5}"

if git diff --quiet -- "$formula"; then
  echo "${formula} is unchanged; nothing to commit"
  exit 0
fi

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git add -- "$formula"
git commit -q -m "$message"

for ((attempt = 1; ; attempt++)); do
  if git push -q origin "HEAD:${branch}"; then
    echo "pushed ${formula} to ${branch}"
    exit 0
  fi
  if (( attempt >= attempts )); then
    echo "::error::could not push ${formula} to ${branch} after ${attempts} attempts" >&2
    exit 1
  fi
  echo "push rejected; rebasing onto the new ${branch} (attempt ${attempt} of ${attempts})"
  git fetch -q origin "$branch"
  if ! git rebase -q FETCH_HEAD; then
    git rebase --abort || true
    echo "::error::${formula} changed on ${branch} meanwhile; not overwriting it" >&2
    exit 1
  fi
  sleep $(( attempt * 2 ))
done
