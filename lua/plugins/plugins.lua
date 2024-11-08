return
{
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },

        config = function()
            local cmp = require('cmp')
            -- local cmp_lsp = require('cmp_nvim_lsp')
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "lua_ls",
                    "ansiblels",
                    "pyright",
                    "cmake",
                    "ts_ls",
                    -- "java_language_server"
                },

                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup{}
                    end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim", },
                                    }
                                }
                            }
                        }
                    end,
                    ["clangd"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.clangd.setup {
                            init_options = {
                                compilationDatabasePath = './build'
                            }
                        }
                    end,
                }
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                })
            })
        end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = false,
        opts = {}

    },

    {
        "tris203/precognition.nvim",
        opts = {},
        enabled = false,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    -- {
        --     "nvim-telescope/telescope.nvim",
        --     branch = '0.1.x',
        --     keys = {},
        --     dependencies = {
            --         "nvim-lua/plenary.nvim",
            --         -- "BurntSushi/ripgrep",
            --     },
            --     opts = {}
            -- },

            -- {
                --     "nvim-tree/nvim-tree.lua",
                --     dependencies = {
                    --         "nvim-tree/nvim-web-devicons"
                    --     },
                    --     lazy = false,
                    --     opts = {},
                    --     enable = false
                    -- },

                }
