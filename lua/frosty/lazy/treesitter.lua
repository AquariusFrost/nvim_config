return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- Configure cross-platform C compiler for parser compilation
        -- Zig is recommended for all platforms due to:
        --   - Zero configuration required (self-contained, no environment setup)
        --   - Cross-compilation built-in
        --   - Smaller installation than MSVC/Visual Studio
        --   - Consistent behavior across Windows/Linux/macOS
        -- Fallback to system compilers (gcc, clang, cl) if Zig not available
        --
        -- Installation:
        --   Windows (recommended): scoop install zig
        --   macOS: brew install zig
        --   Linux: sudo apt install zig (or pacman -S zig, etc.)
        --   All platforms: https://ziglang.org/download/
        require('nvim-treesitter.install').compilers = { "zig", "gcc", "clang", "cl" }
        
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "gdscript", "javascript", "typescript", "tsx", "java", "c_sharp"},

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            ident = {
                enable = true
            },

            highlight = {
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
