# LSP Configuration Guide

## Overview

The LSP (Language Server Protocol) configuration is located in `lua/lsp.lua`. This file contains all the setup for language servers, diagnostics, and LSP-related keymaps. It's integrated with blink.cmp for completion capabilities.

## Currently Configured Servers

The following language servers are currently configured:

- **lua_ls** - Lua (with blink.cmp integration)
- **ts_ls** - TypeScript/JavaScript (with inlay hints enabled)

## Adding a New Language Server

To add a new language server:

1. Open `lua/lsp.lua`
2. Find the `servers` table (around line 83)
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
  ts_ls = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
        },
      },
    },
  },
  -- Add your server here
  pyright = {},  -- Python
  gopls = {},    -- Go
  rust_analyzer = {}, -- Rust
  clangd = {},   -- C/C++
}
```

**Important:** The ts_ls configuration includes inlay hints for TypeScript and JavaScript. Make sure to enable inlay hints with `<leader>th` when working with these files.

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

### TypeScript/JavaScript LSP Issues

If ts_ls isn't working with blink.cmp:
1. Ensure ts_ls is in the `servers` table (not commented out)
2. Restart Neovim to trigger Mason installation
3. Check LSP status with `:LspInfo`
4. Verify blink.cmp is providing capabilities with `:lua print(vim.inspect(require('blink.cmp').get_lsp_capabilities()))`

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

## Extracted Comments

### From lua/lsp.lua

```
-- Brief aside: **What is LSP?**
--
-- LSP is an initialism you've probably heard, but might not understand what it is.
--
-- LSP stands for Language Server Protocol. It's a protocol that helps editors
-- and language tooling communicate in a standardized fashion.
--
-- In general, you have a "server" which is some tool built to understand a particular
-- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
-- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
-- processes that communicate with some "client" - in this case, Neovim!
--
-- LSP provides Neovim with features like:
--  - Go to definition
--  - Find references
--  - Autocompletion
--  - Symbol Search
--  - and more!
--
-- Thus, Language Servers are external tools that must be installed separately from
-- Neovim. This is where `mason` and related plugins come into play.
--
-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
-- and elegantly composed help section, `:help lsp-vs-treesitter`
--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    -- Find references for the word under your cursor.
    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
    ---@param client vim.lsp.Client
    ---@param method vim.lsp.protocol.Method
    ---@param bufnr? integer some lsp support methods only in specific files
    ---@return boolean
    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
    --
    -- This may be unwanted, since they displace some of your code
-- Diagnostic Config
-- See :help vim.diagnostic.Opts
-- LSP servers and clients are able to communicate to each other what features they support.
--  By default, Neovim doesn't support everything that is in the LSP specification.
--  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
--  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  --
  -- Some languages (like typescript) have entire language plugins that can be useful:
  --    https://github.com/pmizio/typescript-tools.nvim
  --
  -- But for many setups, the LSP (`ts_ls`) will work just fine
  -- ts_ls = {},
  --
    -- cmd = { ... },
    -- filetypes = { ... },
    -- capabilities = {},
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
-- Ensure the servers and tools above are installed
--
-- To check the current status of installed tools and/or manually install
-- other tools, you can run
--    :Mason
--
-- You can press `g?` for help in this menu.
--
-- `mason` had to be setup earlier: to configure its options see the
-- `dependencies` table for `nvim-lspconfig` above.
--
-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
      -- This handles overriding only values explicitly passed
      -- by the server configuration above. Useful when disabling
      -- certain features of an LSP (for example, turning off formatting for ts_ls)
```

### From lua/plugins/lint.lua

```
  -- To allow other plugins to add linters to require('lint').linters_by_ft,
  -- instead set linters_by_ft like this:
  -- lint.linters_by_ft = lint.linters_by_ft or {}
  -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
  --
  -- However, note that this will enable a set of default linters,
  -- which will cause errors unless these tools are available:
  -- {
  --   clojure = { "clj-kondo" },
  --   dockerfile = { "hadolint" },
  --   inko = { "inko" },
  --   janet = { "janet" },
  --   json = { "jsonlint" },
  --   markdown = { "vale" },
  --   rst = { "vale" },
  --   ruby = { "ruby" },
  --   terraform = { "tflint" },
  --   text = { "vale" }
  -- }
  --
  -- You can disable the default linters by setting their filetypes to nil:
  -- lint.linters_by_ft['clojure'] = nil
  -- lint.linters_by_ft['dockerfile'] = nil
  -- lint.linters_by_ft['inko'] = nil
  -- lint.linters_by_ft['janet'] = nil
  -- lint.linters_by_ft['json'] = nil
  -- lint.linters_by_ft['markdown'] = nil
  -- lint.linters_by_ft['rst'] = nil
  -- lint.linters_by_ft['ruby'] = nil
  -- lint.linters_by_ft['terraform'] = nil
  -- lint.linters_by_ft['text'] = nil
  -- Create autocommand which carries out the actual linting
  -- on the specified events.
      -- Only run the linter in buffers that you can modify in order to
      -- avoid superfluous noise, notably within the handy LSP pop-ups that
      -- describe the hovered symbol using Markdown.
```
