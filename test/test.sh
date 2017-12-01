#!/usr/bin/env bash

TEST_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cleanup() {
  D="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  rm -rf "${D}/output.md"
}

check_output() {
if [ ! -f "${TEST_DIR}/output.md" ]; then
    echo ""
    echo "==> Test: No output found!";
    exit 1;
else
  echo "foo, bar baz"
fi
}


cleanup;
node_modules/.bin/jsdoc2md --configure ./jsdoc.json "${TEST_DIR}/fixtures/index.js" > "${TEST_DIR}/output.md"
check_output;
comm -2 -3 "${TEST_DIR}/output.md" "${TEST_DIR}/expected/index.md"

cleanup;
node_modules/.bin/jsdoc2md --configure ./jsdoc.json "${TEST_DIR}/fixtures/async.js" > "${TEST_DIR}/output.md"
check_output;
comm -2 -3 "${TEST_DIR}/output.md" "${TEST_DIR}/expected/async.md"
