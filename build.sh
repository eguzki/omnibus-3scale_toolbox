#!/bin/bash
set -o errexit
set -o nounset
set -o xtrace

# Since secure_path is set on our CentOS build images, we also need to ensure
# we only use absolute paths when referencing the binaries we want to run.
GEM="$(command -v gem)"
BUNDLE="$(command -v bundle)"
RUBY="$(command -v ruby)"

echo "Using GEM=${GEM}, BUNDLE=${BUNDLE}, RUBY=${RUBY}"

"$GEM" env
"sudo" "$GEM" env

"sudo" "$BUNDLE" install --without development --binstubs /binstubs
"sudo" "$RUBY" /binstubs/omnibus build 3scale_toolbox
