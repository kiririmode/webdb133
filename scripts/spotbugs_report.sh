#!/bin/bash
set -eo pipefail

main() {
    jq -r '.runs[].results[] | [ "`" + .ruleId + "`: " + .message.text, "java/webdb/src/main/java/" + .locations[].physicalLocation.artifactLocation.uri, .locations[].physicalLocation.region.startLine ] | @csv' java/webdb/target/spotbugsSarif.json |
        reviewdog -efm '"%m","%f",%l' -name="spotbugs" -tee -fail-on-error -reporter=github-pr-review
}

main
