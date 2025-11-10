#
# Setup taskwarrior
#
# This script will setup taskwarrior to use a remote taskwarrior-sync-server.
#
# It will assume the pass credential provided via `$1` has the following format:
# ```
# ENCRYPTION_SECRET_KEY
# url: https://some-domain.example.com
# client_id: AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE
# ```
#

error() {
  echo "ERROR: $1"
  exit 1
}

get_tss_url() {
  pass show "$1" | grep 'url:' | cut -d ' ' -f 2
}

get_tss_client_id() {
  pass show "$1" | grep 'client_id:' | cut -d ' ' -f 2
}

get_tss_encryption_secret() {
  pass show "$1" | head -n 1
}

PASS_TSS_CRED_NAME="$1"

test -z "$PASS_TSS_CRED_NAME" \
  && error "No credential name provided"
type pass >/dev/null 2>&1 \
  || error "The command 'pass' is not installed"

mkdir -p $TASKDATA
touch $TASKRC

task config confirmation off

sync_server_url="$(get_tss_url $PASS_TSS_CRED_NAME)"
sync_client_id="$(get_tss_client_id $PASS_TSS_CRED_NAME)"
sync_encryption_secret="$(get_tss_encryption_secret $PASS_TSS_CRED_NAME)"

task config sync.server.url "$sync_server_url"
task config sync.server.client_id "$sync_client_id"
task config sync.encryption_secret "$sync_encryption_secret"
