local adachi = {}

---@class AdachiConfig
---@field theme "default"|"light"
---@field override_terminal boolean
---@field contrast_dark 'hard'|'medium'|'soft'
---@field contrast_light 'hard'|'medium'|'soft'
---@field transparent_background boolean
---@field emphasis ConfigEmphasis
---@field style ConfigStyle
---@field overrides HLGroups
---@field plugins string[]|boolean

---@class ConfigEmphasis
---@field general EmphasisGroup
---@field comment EmphasisGroup
---@field keyword EmphasisGroup
---@field type EmphasisGroup

---@class ConfigStyle
---@field cursorline { soft: boolean, contrast_currentline: boolean }
---@field tabline QuickHIStyle
---@field cursor QuickHIStyle
---@field search QuickHIStyle

---@class EmphasisGroup
---@field bold boolean
---@field italic boolean
---@field underline boolean

---@class QuickHIStyle
---@field inverse boolean
---@field color 'red'|'green'|'yellow'|'purple'|'orange'|'blue'|'aqua'

---@type AdachiConfig
adachi.default_config = {
    theme = "default",
    override_terminal = true,
    contrast_dark = 'medium',
    contrast_light = 'medium',
    emphasis = {
        general = { },
        comment = { },
        keyword = { },
        type    = { },
    },
    transparent_background = false,
    style = {
        cursorline = { soft = false, contrast_currentline = false },
        tabline = {},
        cursor = {},
        search = {},
    },
    inverse = { },
    overrides = { },
    plugins = true,
}

---@type AdachiConfig
_G.adachi_config = _G.adachi_config or adachi.default_config

--- update global configuration with user settings
---@param config AdachiConfig? user configuration
function adachi.setup(config)
    _G.adachi_config = vim.tbl_extend("force", _G.adachi_config, config or {})
end

---@param hlgroups HLGroups
local function set_highlights(hlgroups)
    vim.cmd("highlight Normal guifg=" .. hlgroups.Normal[1][1] .. " guibg=" .. hlgroups.Normal[2][1])
    hlgroups.Normal = nil
    for group, colors in pairs(hlgroups) do
        if not vim.tbl_isempty(colors) then
            colors.fg = colors[1] and colors[1][1] or 'NONE'
            colors.bg = colors[2] and colors[2][1] or 'NONE'
            colors.ctermfg = colors[1] and colors[1][2] or 'NONE'
            colors.ctermbg = colors[2] and colors[2][2] or 'NONE'
            colors[1] = nil
            colors[2] = nil
            vim.api.nvim_set_hl(0, group, colors)
        end
    end
end

--- load the colorscheme
function adachi.load()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "adachi"
    vim.o.termguicolors = true

    if vim.o.background == "light" then
        _G.adachi_config.theme = "light"
    elseif vim.o.background == "dark" then
        _G.adachi_config.theme = "default"
    end

    local theme = require 'adachi.colors'.setup()
    local hlgroups = require 'adachi.hlgroups'.setup(theme)

    set_highlights(hlgroups)
end

return adachi
