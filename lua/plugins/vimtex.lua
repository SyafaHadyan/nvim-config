return {
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk" -- default compiler
            vim.g.vimtex_syntax_enabled = 1 -- VimTeX syntax highlighting
        end,
    },
}
