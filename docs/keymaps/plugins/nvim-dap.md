### Debugging (nvim-dap)

The `nvim-dap` plugin provides a Debug Adapter Protocol client, allowing you to debug applications directly within Neovim.

#### Debugger Operations

- [normal] <F9> : Start/Continue debugging session
- [normal] <F8> : Step Over (step over the function call)
- [normal] <F7> : Step Into (step into the function call)
- [normal] <F6> : Step Out/Up (step out of the current function)
- [normal] <leader>db : Toggle breakpoint at current line
- [normal] <leader>dB : Set conditional breakpoint (prompts for condition)
- [normal] <leader>dC : Clear all breakpoints
- [normal] <leader>dt : Terminate debugging session (Stop)
- [normal] <leader>dr : Open debugger REPL (interactive debug console)
- [normal] <leader>dl : Run last debugging session
