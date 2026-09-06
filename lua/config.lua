-- Central user settings.
-- Reads vim.g.config (set at the top of init.lua), fills in defaults and
-- validates every value, so a typo warns instead of failing silently.
-- Usage:  local config = require("config")  ->  config.theme, config.git, ...

local defaults = {
    theme = "rose-pine",     -- rose-pine || kanagawa || catppuccin || default
    statusline = "disabled", -- full || minimal || disabled
    git = false,             -- gitsigns.nvim
    format = false,          -- conform.nvim + format keymaps
    extras = false,          -- visual-surround, grug-far, visual-whitespace
}

local choices = {
    theme = { "rose-pine", "kanagawa", "catppuccin", "default" },
    statusline = { "full", "minimal", "disabled" },
}

local function warn(msg, ...)
    local text = "config: " .. msg:format(...)
    vim.schedule(function()
        vim.notify(text, vim.log.levels.WARN)
    end)
end

local user = vim.g.config or {}
local config = vim.tbl_extend("force", defaults, user)

for key in pairs(user) do
    if defaults[key] == nil then
        warn("unknown setting %q (check init.lua)", key)
        config[key] = nil
    end
end

for key, valid in pairs(choices) do
    if not vim.tbl_contains(valid, config[key]) then
        warn("%s = %q is invalid, using %q (valid: %s)",
            key, tostring(config[key]), defaults[key], table.concat(valid, ", "))
        config[key] = defaults[key]
    end
end

for key, value in pairs(defaults) do
    if type(value) == "boolean" and type(config[key]) ~= "boolean" then
        warn("%s = %q is invalid, using %s (must be true or false)",
            key, tostring(config[key]), tostring(value))
        config[key] = value
    end
end

return config
