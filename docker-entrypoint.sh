#!/usr/bin/env bash
set -e

/opt/jsdoc2md/node_modules/.bin/jsdoc2md --configure jsdoc.json "$@"
