local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end


treesitter.setup({
  ensured_installed = {
    "bash",
    "comment",
    "scss",
    "css",
    "html",
    "javascript",
    "typescript",
    "lua",
    "markdown",
    "regex",
    "toml",
    "yaml",
    "c",
    "cpp",
    "haskell",
    "java",
    "python",
    "rust",
    "go",
    "php",
    "swift",
    "kotlin",
    "latex",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    colors = {
      "#68a0b0",
      "#946EaD",
      "#c7aA6D",
    },
  },
})
