return {
    cmd = { '/home/raliccia/.local/share/nvim/mason/bin/pyright-langserver', '--stdio' },
    filetypes = { 'py', 'python' },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" },
    settings = {
        python = {
            analysis = {
                -- autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                -- useLibraryCodeForTypes = true,
            },
        },
    },
}

