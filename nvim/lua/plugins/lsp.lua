--@diagnostic disable: missing-fields
-- Configure lsp for support Swift language
-- Loads the Swift LSP from inside Xcode
--
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local lspconfig = require("lspconfig")

    -- Define the servers to be set up
    local servers = {
      clangd = {},
      sourcekit = {
        root_dir = lspconfig.util.root_pattern(".git", "Package.swift", "compile_commands.json"),
      },
    }

    -- Loop through the servers and set them up
    for server, setup in pairs(servers) do
      lspconfig[server].setup(setup)
    end

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
    })

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Set up keymaps only when an LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LSPAttach", {
      desc = "LSP Actions",
      callback = function(args)
        local wk = require("which-key")
        -- Use the new wk.add() function with the correct table format
        wk.add({
          { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "LSP hover info" },
          { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "LSP go to definition" },
          { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "LSP go to declaration" },
          { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "LSP go to implementation" },
          { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "LSP list references" },
          { "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "LSP signature help" },
          { "gn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "LSP rename" },
          { "[g", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Go to previous diagnostic" },
          { "]g", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Go to next diagnostic" },
        }, {
          mode = "n",
          buffer = args.buf, -- Apply keymaps only to the current buffer
          silent = true,
        })
      end,
    })
  end,
}
