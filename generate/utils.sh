# Check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Read user input
prompt() {
  local prompt_string="$1"
  local default_value="$2"
  if test -n "$default_value"; then
    prompt_string="$prompt_string [$default_value]"
  fi
  read -p "${prompt_string}: " input
  if test -z "$input"; then
    local input=$default_value
  fi

  echo "$input"
}

