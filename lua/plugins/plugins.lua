return
{
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {}
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "clangd",
                "lua_ls",
                -- "pyright",
                -- "yamlls"
            }
        }
    },

    {
        "neovim/nvim-lspconfig",
        config = function(_, servers)
            servers = {
                clangd = {},
                lua_ls = {},
            }
            for server, opts in pairs(servers) do
                require("lspconfig")[server].setup(opts)
            end
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = false,
        opts = {}

    }
}