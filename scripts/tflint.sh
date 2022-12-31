#!/bin/bash
set -eo pipefail

main() {
    local base_dir="$1"

    cd terraform
    tflint --recursive --init -c "${base_dir}/terraform/.tflint.hcl"
    tflint --recursive -f checkstyle -c "${base_dir}/terraform/.tflint.hcl" |
        reviewdog -f=checkstyle -tee -fail-on-error -reporter=github-pr-review -name="tflint"

}

main "$@"
