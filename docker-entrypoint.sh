#!/usr/bin/env bash
set -e

JSDOC2MD=/usr/local/jsdoc2md/node_modules/.bin/jsdoc2md

if [ -e jsdoc.json ]
then
  echo "using jsdoc.json" >&2
  exec "$JSDOC2MD" --configure jsdoc.json "$@"
else
  echo "running without jsdoc.json" >&2
  exec "$JSDOC2MD" "$@"
fi
