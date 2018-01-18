#!/usr/bin/env bash
set -e

if [ -e jsdoc.json ]
then
  echo "using jsdoc.json"
  $(npm bin)/jsdoc2md --configure jsdoc.json "$@"
else
  echo "running without jsdoc.json"
  $(npm bin)/jsdoc2md "$@"
fi

