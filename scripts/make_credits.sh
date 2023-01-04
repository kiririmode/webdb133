#!/bin/bash
set -eo pipefail

readonly TARGET=github.com/kiririmode/webdb133/go-sample

collect_licenses_to() {
    local workdir="$1"

    rm -rf "$workdir"
    go-licenses save "$TARGET" \
        --force \
        --save_path="$workdir" \
        --ignore="github.com/kiririmode/webdb133"
}

put_license() {
    local title="$1"
    local license_path="$2"

    echo "========================="
    echo "$title"
    echo "-------------------------"
    cat "$license_path"
    echo
}

make_credit_from() {
    local workdir="$1"

    put_license "The Go Programming Language" goLICENSE
    while read -r filepath; do
        put_license \
            "$(dirname "$(realpath --relative-to="$workdir" "$filepath")")" \
            "$filepath"
    done < <(find "$workdir" -type f | sort)
}

main() {
    local credits_file="$1"
    local workdir="dist-licenses"

    collect_licenses_to "$workdir"
    make_credit_from "$workdir" >"$credits_file"
}

main "${1:-CREDITS}"
