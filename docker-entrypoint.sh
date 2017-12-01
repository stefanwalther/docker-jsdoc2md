#!/usr/bin/env bash
set -e

node_modules/.bin/jsdoc2md --configure jsdoc.json "$@"
