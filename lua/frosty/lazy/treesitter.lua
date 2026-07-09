return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        -- Configure cross-platform C compiler for parser compilation
        require('nvim-treesitter.install').compilers = { "zig", "gcc", "clang", "cl" }
        
        -- In nvim-treesitter's "main" branch, highlighting and indentation are enabled
        -- automatically by Neovim 0.12's native treesitter integration.
        -- We only need to tell nvim-treesitter to install the parsers.
        require('nvim-treesitter').install({
            "c", "lua", "vim", "vimdoc", "query", "gdscript", 
            "javascript", "typescript", "tsx", "java", "c_sharp"
        })
    end
}
