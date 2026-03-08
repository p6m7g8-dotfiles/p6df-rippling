# P6's POSIX.2: p6df-rippling

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

p6df module for Rippling: HR and IT platform integration via MCP server
(`@imazhar101/mcp-rippling-server` via npm) with profile switching
(`RIPPLING_TOKEN`, `RIPPLING_ROLE`, `RIPPLING_COMPANY`, `RIPPLING_USER_ID`).

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Functions

#### p6df-rippling

##### p6df-rippling/init.zsh

- `p6df::modules::rippling::deps()`
- `p6df::modules::rippling::mcp()`
  - Synopsis: Installs Rippling MCP server
- `p6df::modules::rippling::mcp::env()`
  - Synopsis: Maps Rippling profile env vars to MCP-specific vars

## Hierarchy

```text
.
├── init.zsh
└── README.md

1 directory, 2 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
