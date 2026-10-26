#!/usr/bin/env bash
set -e

TEST_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
JSDOC2MD=/usr/local/jsdoc2md/node_modules/.bin/jsdoc2md

cleanup() {
  rm -f "${TEST_DIR}/output.md"
}

check_output() {
if [ ! -f "${TEST_DIR}/output.md" ]; then
    echo ""
    echo "==> Test: No output found!";
    exit 1;
else
  echo ""
  echo "==> Test: output.md found ..."
  echo ""
fi
}

fail() {
  echo ""
  echo "==> Test FAILED: $1 differs from expected output";
  exit 1;
}

cleanup;
"$JSDOC2MD" "${TEST_DIR}/fixtures/index.js" > "${TEST_DIR}/output.md"
check_output;
diff -u "${TEST_DIR}/expected/index.md" "${TEST_DIR}/output.md" || fail "index.js"

cleanup;
"$JSDOC2MD" "${TEST_DIR}/fixtures/async.js" > "${TEST_DIR}/output.md"
check_output;
diff -u "${TEST_DIR}/expected/async.md" "${TEST_DIR}/output.md" || fail "async.js"

cleanup;
echo ""
echo "==> All tests passed."
