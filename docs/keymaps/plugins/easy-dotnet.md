### .NET Development (easy-dotnet)

The `easy-dotnet.nvim` plugin provides a complete IDE-like experience for .NET projects.

#### Leader + n Prefix (.NET Operations)

- [normal] <leader>nr : Run .NET project (prompts for project and launch profile)
- [normal] <leader>nb : Build .NET project (shows errors in quickfix list)
- [normal] <leader>nt : Test .NET project (runs tests via dotnet test)
- [normal] <leader>ntt : Open .NET test runner UI (interactive test runner interface)
- [normal] <leader>nd : Debug .NET project (attaches debugger using netcoredbg)
- [normal] <leader>ns : Manage .NET user secrets (edit/create secrets for the project)
- [normal] <leader>no : Check outdated NuGet packages (shows updates inline as virtual text)
- [normal] <leader>nc : Clean .NET project
- [normal] <leader>nR : Restore .NET packages
- [normal] <leader>np : Create new .NET project or template (uses `dotnet new`)

*Note: For these commands to work, the `EasyDotnet` global tool is required. The configuration will attempt to install it automatically if missing.*