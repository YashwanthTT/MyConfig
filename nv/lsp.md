# LSP Configuration Guide

## Overview

The LSP (Language Server Protocol) configuration is located in `lua/lsp.lua`. This file contains all the setup for language servers, diagnostics, and LSP-related keymaps.

## Adding a New Language Server

To add a new language server:

1. Open `lua/lsp.lua`
2. Find the `servers` table (around line 106)
3. Add your server configuration:

```lua
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  -- Add your server here
  pyright = {},  -- Python
  ts_ls = {},    -- TypeScript
  gopls = {},    -- Go
  rust_analyzer = {}, -- Rust
  clangd = {},   -- C/C++
}
```

## Available LSP Servers

You can see all available LSP servers by running:
```vim
:help lspconfig-all
```

## Server Configuration Options

Each server can have the following options:

- `cmd`: Override the default command to start the server
- `filetypes`: Override default filetypes
- `capabilities`: Override LSP capabilities
- `settings`: Server-specific settings

Example with custom settings:

```lua
rust_analyzer = {
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = 'clippy',
      },
    },
  },
},
```

## Installing Language Servers

Language servers are automatically installed via Mason when you:

1. Add them to the `servers` table in `lua/lsp.lua`
2. Restart Neovim

You can also manually install servers:
```vim
:Mason
```

Then navigate and press `i` to install.

## LSP Keymaps

The following keymaps are automatically set when an LSP attaches to a buffer:

- `grn` - Rename symbol
- `gra` - Code action
- `grr` - Find references
- `gri` - Go to implementation
- `grd` - Go to definition
- `grD` - Go to declaration
- `gO` - Document symbols
- `gW` - Workspace symbols
- `grt` - Type definition
- `<leader>th` - Toggle inlay hints

## Diagnostics Configuration

Diagnostic settings are in `lua/lsp.lua` around line 74. You can customize:

- Severity levels
- Virtual text format
- Signs in the gutter
- Floating window appearance

## Adding Tools (Formatters/Linters)

To add additional tools like formatters or linters:

1. Add them to the `ensure_installed` list:

```lua
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua',    -- Lua formatter
  'prettier',  -- JS/TS/JSON formatter
  'black',     -- Python formatter
  'gofmt',     -- Go formatter
})
```

2. Configure formatters in `lua/custom/plugins/conform.lua`
3. Configure linters in `lua/custom/plugins/lint.lua`

## Troubleshooting

Check LSP status:
```vim
:LspInfo
```

Check Mason installations:
```vim
:Mason
```

Check plugin status:
```vim
:Lazy
```

View LSP logs:
```vim
:lua vim.cmd('edit ' .. vim.lsp.get_log_path())
```

## Disabling LSP for Specific Filetypes

Add to `lua/lsp.lua` in the LspAttach autocmd:

```lua
if vim.bo.filetype == 'markdown' then
  vim.lsp.stop_client(vim.lsp.get_active_clients())
end
```

## Custom On-Attach Logic

The `LspAttach` autocmd in `lua/lsp.lua` runs when an LSP attaches. You can add custom logic there for specific servers:

```lua
callback = function(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  
  if client.name == 'rust_analyzer' then
    -- Rust-specific configuration
  end
  
  -- Rest of the configuration...
end,
```
