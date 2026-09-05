#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source upstream.lock
destination="${1:-.cache/upstream-flt}"

mkdir -p "$(dirname "$destination")"

if [[ ! -d "$destination/.git" ]]; then
  git clone --filter=blob:none --no-checkout "$repository" "$destination"
fi

git -C "$destination" fetch --depth 1 origin "$revision"
git -C "$destination" sparse-checkout init --cone
git -C "$destination" sparse-checkout set Definitions P2M Theorems verification
git -C "$destination" checkout --detach "$revision"

printf 'Anthropic FLT source is ready at %s\n' "$destination"
git -C "$destination" rev-parse HEAD
