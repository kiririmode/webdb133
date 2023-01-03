#!/bin/bash
set -eo pipefail

main() {
    reviewdog -f checkstyle -name="checkstyle" -tee -fail-on-error -reporter=github-pr-review <java/webdb/target/checkstyle-result.xml
}

main
