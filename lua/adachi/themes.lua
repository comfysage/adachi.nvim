local M = {}

---@class AdachiTheme
---@field gb AdachiColors
---@field bg  Color
---@field bg0 Color
---@field bg1 Color
---@field bg2 Color
---@field bg3 Color
---@field bg4 Color
---@field fg0 Color
---@field fg1 Color
---@field fg2 Color
---@field fg3 Color
---@field fg4 Color
---@field red Color
---@field green Color
---@field yellow Color
---@field blue Color
---@field purple Color
---@field aqua Color
---@field orange Color
---@field red_accent Color
---@field green_accent Color
---@field yellow_accent Color
---@field blue_accent Color
---@field purple_accent Color
---@field aqua_accent Color
---@field orange_accent Color
---@field none Color
---@field comment Color
---@field selected Color
---@field number_column Color
---@field sign_column Color
---@field color_column Color
---@field vert_split Color
---@field inverse inverseField
---@field bold specialField
---@field italic specialField

---@alias specialField { ['comment']: boolean, ['keyword']: boolean }
---@alias inverseField { ['tabline']: boolean, ['signs']: boolean, ['search']: boolean }

---@param gb AdachiColors
---@param config AdachiConfig
---@return AdachiTheme
function M.setup(gb, config)

  config = vim.tbl_extend("force", require 'adachi'.default_config, config or {})

  local theme = {}

  theme.gb = gb

  local _bg = gb.bg

  if config.theme == 'light' then
    _bg = gb.fg
  end

  theme.bg0 = _bg['0']
  theme.bg = theme.bg0
  if config.contrast_dark == 'soft' then
    theme.bg0 = _bg['0_soft']
  elseif config.contrast_dark == 'hard' then
    theme.bg0 = _bg['0_hard']
  end

  theme.bg1 = _bg['1']
  theme.bg2 = _bg['2']
  theme.bg3 = _bg['3']
  theme.bg4 = _bg['4']

  local _fg = gb.fg

  if config.theme == 'light' then
    _fg = gb.bg
  end

  theme.fg0 = _fg['0']
  theme.fg1 = _fg['1']
  theme.fg2 = _fg['2']
  theme.fg3 = _fg['3']
  theme.fg4 = _fg['4']

  local _bright = gb.bright
  local _accent = gb.neutral

  if config.theme == 'light' then
    _bright = gb.dark
    _accent = gb.neutral
  end

  theme.red    = _bright['red']
  theme.green  = _bright['green']
  theme.yellow = _bright['yellow']
  theme.blue   = _bright['blue']
  theme.purple = _bright['purple']
  theme.aqua   = _bright['aqua']
  theme.orange = _bright['orange']
  theme.red_accent    = _accent['red']
  theme.green_accent  = _accent['green']
  theme.yellow_accent = _accent['yellow']
  theme.blue_accent   = _accent['blue']
  theme.purple_accent = _accent['purple']
  theme.aqua_accent   = _accent['aqua']
  theme.orange_accent = _accent['orange']

  theme.none = { 'NONE', nil }

  if config.transparent_background then
    theme.bg0 = { theme.none[1], 0 }
  end

  -- Special groups

  theme.number_column = theme.bg

  theme.sign_column = theme.bg1
  if config.transparent_background then
    theme.sign_column = { theme.none[1], 0 }
  end

  theme.color_column = theme.bg1
  theme.vert_split = theme.bg0

  theme.comment = theme.bg3
  theme.selected = theme.yellow

  -- Emphasis

  theme.inverse = { tabline = false, signs = false }

  theme.inverse = vim.tbl_extend('force', theme.inverse, config.inverse)

  theme.bold = {
    comment = false,
    keyword = false,
  }

  theme.italic = {
    comment = false,
    keyword = false,
  }

  -- override theme
  for _, m in ipairs({ 'bold', 'italic' }) do
    for name in pairs(theme[m]) do
      theme[m][name] = config[name][m] or theme[m][name]
    end
  end

  return theme
end

return M
