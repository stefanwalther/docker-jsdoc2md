#!/usr/bin/env bash

TEST_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=""

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
  echo ""
  echo "==> Test: output.md found ..."
  echo ""
fi
}


cleanup;
/opt/jsdoc2md/jsdoc2md --configure /opt/jsdoc2md/jsdoc.json "${TEST_DIR}/fixtures/index.js" > "${TEST_DIR}/output.md"
check_output;
comm -2 -3 "${TEST_DIR}/output.md" "${TEST_DIR}/expected/index.md"

cleanup;
/opt/jsdoc2md//jsdoc2md --configure /opt/jsdoc2md/jsdoc.json "${TEST_DIR}/fixtures/async.js" > "${TEST_DIR}/output.md"
check_output;
comm -2 -3 "${TEST_DIR}/output.md" "${TEST_DIR}/expected/async.md"
