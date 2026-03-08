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

#  Environment:	 RIPPLING_COMPANY RIPPLING_ROLE RIPPLING_TOKEN RIPPLING_USER_ID
######################################################################
#<
#
# Function: p6df::modules::rippling::mcp::env()
#
#  Environment:	 RIPPLING_COMPANY RIPPLING_ROLE RIPPLING_TOKEN RIPPLING_USER_ID
#>
#/ Synopsis
#/    Maps Rippling profile env vars to MCP-specific vars
#/
######################################################################
p6df::modules::rippling::mcp::env() {

  if p6_string_blank_NOT "$RIPPLING_TOKEN"; then
    p6_env_export "RIPPLING_TOKEN"    "$RIPPLING_TOKEN"
    p6_env_export "RIPPLING_ROLE"     "${RIPPLING_ROLE:-admin}"
    p6_env_export "RIPPLING_COMPANY"  "${RIPPLING_COMPANY:-}"
    p6_env_export "RIPPLING_USER_ID"  "${RIPPLING_USER_ID:-}"
  else
    p6_env_export_un RIPPLING_TOKEN
    p6_env_export_un RIPPLING_ROLE
    p6_env_export_un RIPPLING_COMPANY
    p6_env_export_un RIPPLING_USER_ID
  fi

  p6_return_void
}
