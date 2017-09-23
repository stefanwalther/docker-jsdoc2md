#!/usr/bin/env bash

cleanup() {
  D="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  rm -rf "${D}/output.md"
}

TEST_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cleanup;
jsdoc2md "${TEST_DIR}/fixtures/index.js" > "${TEST_DIR}/output.md"

if [ ! -f "${TEST_DIR}/output.md" ]; then
    echo ""
    echo "==> Test: No output found!";
    exit 1;
fi

comm -2 -3 "${TEST_DIR}/output.md" "${TEST_DIR}/expected/output.md"
