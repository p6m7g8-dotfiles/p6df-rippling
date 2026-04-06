# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::rippling::deps()
#
#>
######################################################################
p6df::modules::rippling::deps() {

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
# Function: words rippling = p6df::modules::rippling::profile::mod()
#
#  Returns:
#	words - rippling
#
#  Environment:	 RIPPLING_API_KEY
#>
######################################################################
p6df::modules::rippling::profile::mod() {

  p6_return_words 'rippling' '$RIPPLING_API_KEY'
}
