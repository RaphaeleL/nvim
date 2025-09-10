-- Python
vim.lsp.config.pyright = {
    name = "pyright",
    filetypes = { "python" },
    cmd = { "pyright-langserver", "--stdio" },
    settings = {
        python = {
            venvPath = vim.fn.expand("~") .. "/.virtualenvs",
        },
        pyright = {
            disableOrganizeImports = true,
            analysis = {
                autoSearchPaths = true,
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "strict",
                inlayHints = {
                    variableTypes = true,
                    callArgumentNames = true,
                    functionReturnTypes = true,
                    genericTypes = false,
                },
            },
        },
    },
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        local root = vim.fs.root(0, {
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt",
            "Pipfile",
            "pyrightconfig.json",
            ".git",
            vim.uv.cwd(),
        })
        local client =
            vim.lsp.start(vim.tbl_extend("force", vim.lsp.config.pyright, { root_dir = root }), { attach = false })
        if client then
            vim.lsp.buf_attach_client(0, client)
        end
    end,
})

