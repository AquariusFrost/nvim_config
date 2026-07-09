### Testing (neotest)

The `neotest` plugin provides a unified, cross-platform interface for running tests across different languages (Python, JavaScript/TypeScript, .NET).

#### Leader + t Prefix (Test Operations)

- [normal] <leader>tt : Run nearest test
- [normal] <leader>tf : Run tests in current file
- [normal] <leader>ta : Run all tests in project
- [normal] <leader>td : Debug nearest test (requires `nvim-dap` and relevant debuggers like `netcoredbg`)
- [normal] <leader>ts : Toggle test summary panel
- [normal] <leader>to : Toggle test output panel
- [normal] <leader>tp : Show test output in floating window
- [normal] [t : Jump to previous failed test
- [normal] ]t : Jump to next failed test

*Note: For these keybindings to work, the respective test adapters must be correctly configured, and any necessary external tools (like test frameworks) must be installed.*