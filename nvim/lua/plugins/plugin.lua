return
{
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup{
                highlight = { enable = true }, -- 启用语法高亮
                indent = { enable = true },    -- 可选：智能缩进
                ensure_installed = {'lua', 'vim', 'python', 'cpp', 'c'},
                auto_install = true,
            }
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup {
                ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } }
            }
        end
    },
    {
        "neovim/nvim-lspconfig"
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls",
                    "pylsp",
                    "clangd",
                },
                -- automatic_enable = true,
            })
        end,
        dependencies = { "neovim/nvim-lspconfig" },
    },
    {
        'moonbit-community/moonbit.nvim',
        ft = { 'moonbit' },
        opts = {
            -- optionally disable the treesitter integration
            treesitter = {
                enabled = true,
                -- Set false to disable automatic installation and updating of parsers.
                auto_install = true
            },
            -- configure the language server integration
            -- set `lsp = false` to disable the language server integration
            lsp = {
                -- provide an `on_attach` function to run when the language server starts
                on_attach = function(client, bufnr) end,
                -- provide client capabilities to pass to the language server
                capabilities = vim.lsp.protocol.make_client_capabilities(),
            }
        },
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 
            'nvim-lua/plenary.nvim',
        }
    },
}
