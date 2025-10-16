return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     local lspconfig = require("lspconfig")
  --
  --     -- Setup SourceKit for Swift
  --     lspconfig.sourcekit.setup({
  --       capabilities = {
  --         workspace = {
  --           didChangeWatchedFiles = {
  --             dynamicRegistration = true,
  --           },
  --         },
  --       },
  --     })
  --
  --     -- Setup BasedPyright for Python
  --     lspconfig.basedpyright.setup({
  --       settings = {
  --         python = {
  --           analysis = {
  --             typeCheckingMode = "basic", -- Options: "off", "basic", "strict"
  --             autoSearchPaths = true,
  --             diagnosticMode = "workspace",
  --             useLibraryCodeForTypes = true,
  --           },
  --         },
  --       },
  --     })
  --
  --     -- Diagnostic signs
  --     local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  --     for type, icon in pairs(signs) do
  --       local hl = "DiagnosticSign" .. type
  --       vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  --     end
  --
  --     -- Diagnostic configuration
  --     vim.diagnostic.config({
  --       virtual_text = true,
  --       signs = true,
  --       update_in_insert = false,
  --     })
  --
  --     -- Setup keymaps on LSP attach
  --     vim.api.nvim_create_autocmd("LspAttach", {
  --       desc = "LSP actions keymaps",
  --       callback = function(args)
  --         vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
  --         vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
  --       end,
  --     })
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        signs = false,
        virtual_text = { prefix = "●" },
        underline = true,
        severity_sort = true,
      },
      servers = {
        jdtls = {},
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    opts = function()
      return {
        cmd = {
          "jdtls",
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            completion = {
              favoriteStaticMembers = {
                "org.junit.jupiter.api.Assertions.*",
                "org.junit.Assert.*",
                "org.mockito.Mockito.*",
              },
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      local jdtls = require("jdtls")
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          jdtls.start_or_attach(opts)
        end,
      })

      vim.keymap.set("n", "<leader>us", function()
        local cfg = vim.diagnostic.config()
        vim.diagnostic.config({ signs = not cfg.signs })
      end, { desc = "Toggle diagnostic signs" })
    end,
  },
}
