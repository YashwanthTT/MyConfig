return {
{
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim", "saghen/blink.cmp" },
    config = function()
        require('mason').setup({})
        local lspconfig = require('lspconfig')
        local mason_lspconfig = require('mason-lspconfig')
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        mason_lspconfig.setup({
            ensure_installed = { "lua_ls", "ts_ls", "eslint", "rust_analyzer" } -- add more as needed
        })

        -- Configure servers with capabilities
        vim.lsp.config('lua_ls', { capabilities = capabilities })
        vim.lsp.config('ts_ls', { capabilities = capabilities })
        vim.lsp.config('eslint', { capabilities = capabilities })
        vim.lsp.config('rust_analyzer', { capabilities = capabilities })
    end
}
}