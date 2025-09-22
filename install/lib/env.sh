#!/usr/bin/env bash
# idempotent environment helpers for Omakub
if [[ "${OMAKUB_ENV_LOADED:-}" == "1" ]]; then
  return 0
fi
export OMAKUB_ENV_LOADED=1

# Desktop/session detection
export OMAKUB_DE="${XDG_CURRENT_DESKTOP:-}"
export OMAKUB_SESSION_TYPE="${XDG_SESSION_TYPE:-}"

if command -v dnf >/dev/null 2>&1; then
    PKG_MGR=dnf
    OS_NAME="Fedora"
elif command -v apt >/dev/null 2>&1; then
    PKG_MGR=apt
    OS_NAME="Ubuntu"
else
    echo "Warning : no supported package manager found (dnf or apt)"
    return 1
fi
export PKG_MGR
# helper to run package manager safely
run_pkg_mgr() {
  if [[ -z "$PKG_MGR" ]]; then
    echo "Warning: no package manager available; skipping: $*"
    return 1
  fi
  sudo "$PKG_MGR" "$@"
}

# pick kwriteconfig binary (prefer v6)
if command -v kwriteconfig6 >/dev/null 2>&1; then
  KWRC=kwriteconfig6
elif command -v kwriteconfig5 >/dev/null 2>&1; then
  KWRC=kwriteconfig5
else
  KWRC=""
fi
export KWRC

# helper to run kwriteconfig safely
run_kwriteconfig() {
  if [[ -z "$KWRC" ]]; then
    echo "Warning: no kwriteconfig binary available; skipping: $*"
    return 1
  fi
  "$KWRC" "$@"
}

# helper to check command availability
require_cmd() {
  command -v "$1" >/dev/null 2>&1 || return 1
}

return 0
