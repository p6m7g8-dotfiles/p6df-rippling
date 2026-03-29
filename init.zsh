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
    p6m7g8-dotfiles/p6df-claude
    p6m7g8-dotfiles/p61password
  )
}

######################################################################
#<
#
# Function: p6df::modules::rippling::mcp()
#
#>
#/ Synopsis
#/    Installs and configures Rippling MCP server
#/
######################################################################
p6df::modules::rippling::mcp() {

  p6_js_npm_global_install "@imazhar101/mcp-rippling-server"

  p6df::modules::anthropic::mcp::server::add "rippling" "npx" "-y" "@imazhar101/mcp-rippling-server"
  p6df::modules::openai::mcp::server::add "rippling" "npx" "-y" "@imazhar101/mcp-rippling-server"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::rippling::profile::on(profile, code)
#
#  Args:
#	profile -
#	code - shell code exporting RIPPLING_TOKEN RIPPLING_ROLE RIPPLING_COMPANY RIPPLING_USER_ID
#
#  Environment:	 P6_DFZ_PROFILE_RIPPLING RIPPLING_COMPANY RIPPLING_ROLE RIPPLING_TOKEN RIPPLING_USER_ID
#>
######################################################################
p6df::modules::rippling::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_RIPPLING" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::rippling::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 P6_DFZ_PROFILE_RIPPLING RIPPLING_COMPANY RIPPLING_ROLE RIPPLING_TOKEN RIPPLING_USER_ID
#>
######################################################################
p6df::modules::rippling::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_RIPPLING

  p6_return_void
}
