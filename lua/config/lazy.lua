local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
        },
        -- import/override with your plugins
        {
            import = "plugins",
        },
        {
            "vyfor/cord.nvim",
            build = ":Cord update",
            -- opts = {}
        },
        {
            "wakatime/vim-wakatime",
            lazy = false,
        },
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
        },
        {
            "amitds1997/remote-nvim.nvim",
            version = "*", -- Pin to GitHub releases
            dependencies = {
                "nvim-lua/plenary.nvim", -- For standard functions
                "MunifTanjim/nui.nvim", -- To build the plugin UI
                "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
            },
            config = true,
        },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "tokyonight", "habamax", "catpuccin-frappe" } },
    -- install = { colorscheme = {catpuccin-frappe"}}
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify = false, -- notify on update
    }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                -- "tutor",
                "zipPlugin",
            },
        },
    },
})
