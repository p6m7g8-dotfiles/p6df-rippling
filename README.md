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

Integrates Rippling HR platform into the p6df shell framework. Provides `profile::on` /
`profile::off` for managing `RIPPLING_TOKEN`, role, company, and user ID, plus MCP server
installation.

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
- `p6df::modules::rippling::profile::off()`
- `p6df::modules::rippling::profile::on(profile, env_or_token, [role=admin], [company=], [user_id=])`
  - Args:
    - profile
    - env_or_token
    - OPTIONAL role - [admin]
    - OPTIONAL company - []
    - OPTIONAL user_id - []

## Hierarchy

```text
.
├── init.zsh
└── README.md

1 directory, 2 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
