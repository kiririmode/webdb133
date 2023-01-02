#!/bin/bash
set -o pipefail

main() {
    local base_dir="$1"
    local error_count=0
    local relative_dir

    while read -r dir; do
        # GITHUB_WORKSPACEからの相対パスを取得
        relative_dir=$(realpath --relative-to="$base_dir" "$dir")

        terraform -chdir="$dir" init -backend=false
        terraform -chdir="$dir" validate -json |
            jq -r '.diagnostics[] | [.range.filename, .range.start.line, .range.start.column, .severity + ": " + .detail] | @tsv' |
            sed -e "s|^|${relative_dir}/|" |
            tr '\t' ':' |
            reviewdog -efm="%f:%l:%c:%m" -tee -fail-on-error -reporter=github-pr-review -name="Terraform Validate"

        ((error_count += $?))
    done < <(find "${base_dir}/terraform" -type f -name '*.tf' -printf "%h\n" | sort | uniq)
    return $error_count
}

main "$@"
