# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::rippling::deps()
#
#>
######################################################################
p6df::modules::rippling::deps() {

  # shellcheck disable=2034
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::rippling::mcp()
#
#>
#/ Synopsis
#/    Installs Rippling MCP server
#/
######################################################################
p6df::modules::rippling::mcp() {

  p6_js_npm_global_install "@imazhar101/mcp-rippling-server"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::rippling::profile::on(profile, env_or_token, [role=admin], [company=], [user_id=])
#
#  Args:
#	profile -
#	env_or_token -
#	OPTIONAL role - [admin]
#	OPTIONAL company - []
#	OPTIONAL user_id - []
#
#  Environment:	 P6_DFZ_PROFILE_RIPPLING RIPPLING_COMPANY RIPPLING_ROLE RIPPLING_TOKEN RIPPLING_USER_ID
#>
######################################################################
p6df::modules::rippling::profile::on() {
  local profile="$1"
  local env_or_token="$2"
  local role="${3:-admin}"
  local company="${4:-}"
  local user_id="${5:-}"

  local token="$env_or_token"

  if p6_string_match_regex "$env_or_token" '(^|[[:space:]])export[[:space:]]+RIPPLING'; then
    p6_run_code "$env_or_token"
    token="${RIPPLING_TOKEN:-}"
    role="${RIPPLING_ROLE:-$role}"
    company="${RIPPLING_COMPANY:-$company}"
    user_id="${RIPPLING_USER_ID:-$user_id}"
  fi

  p6_env_export "P6_DFZ_PROFILE_RIPPLING" "$profile"
  p6_env_export "RIPPLING_TOKEN"          "$token"
  p6_env_export "RIPPLING_ROLE"           "$role"

  if p6_string_blank_NOT "$company"; then
    p6_env_export "RIPPLING_COMPANY" "$company"
  else
    p6_env_export_un RIPPLING_COMPANY
  fi

  if p6_string_blank_NOT "$user_id"; then
    p6_env_export "RIPPLING_USER_ID" "$user_id"
  else
    p6_env_export_un RIPPLING_USER_ID
  fi

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::rippling::profile::off()
#
#  Environment:	 P6_DFZ_PROFILE_RIPPLING RIPPLING_COMPANY RIPPLING_ROLE RIPPLING_TOKEN RIPPLING_USER_ID
#>
######################################################################
p6df::modules::rippling::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_RIPPLING
  p6_env_export_un RIPPLING_TOKEN
  p6_env_export_un RIPPLING_ROLE
  p6_env_export_un RIPPLING_COMPANY
  p6_env_export_un RIPPLING_USER_ID

  p6_return_void
}
