return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Setup SourceKit for Swift
      lspconfig.sourcekit.setup({
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      })

      -- Setup BasedPyright for Python
      lspconfig.basedpyright.setup({
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic", -- Options: "off", "basic", "strict"
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      -- Diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
      })

      -- Setup keymaps on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions keymaps",
        callback = function(args)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
        end,
      })
    end,
  },
}
