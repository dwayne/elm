#!/usr/bin/env bash

set -euo pipefail

subcommand="${1:-help}"

if [ "$#" -ne 0 ]; then
  shift
fi

case "$subcommand" in
  docs)
    elm-doc-preview "$@"
    ;;

  format)
    elm-format "$@"
    ;;

  json)
    elm-json "$@"
    ;;

  optimize)
    elm-optimize-level-2 "$@"
    ;;

  review)
    elm-review "$@"
    ;;

  test)
    elm-test "$@"
    ;;

  help)
    elm
    ;;

  *)
    elm "$subcommand" "$@"
    ;;
esac
