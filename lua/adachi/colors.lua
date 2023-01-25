local adachi = {}

---@alias Color { [1]: string, [2]: number }

---@alias NeutralColors { ['0_hard']: Color,['0']: Color,['0_soft']: Color,['1']: Color,['2']: Color,['3']: Color,['4']: Color }
---@alias ColorMap { ['red']: Color,['green']: Color,['yellow']: Color,['purple']: Color,['orange']: Color,['blue']: Color,['aqua']: Color }

---@class AdachiColors
---@field bg NeutralColors
---@field fg NeutralColors
---@field neutral ColorMap
---@field bright ColorMap
---@field dark ColorMap
---@field koi { ['0']: Color, ['1']: Color, ['2']: Color, ['3']: Color }

_G.adachi_colors = {
  bg = {
    ['0_hard'] = { "#1A1C20", 234 },
    ['0'] = { "#1D2024", 234 },
    ['0_soft'] = { "#202629", 234 },
    ['1'] = { "#292D33", 237 },
    ['2'] = { "#343B42", 239 },
    ['3'] = { "#495057", 241 },
    ['4'] = { "#5C646B", 243 },
  },
  fg = {
    ['0_hard'] = { "#C3C9CC", 229 },
    ['0'] = { "#E2E8EA", 229 },
    ['0_soft'] = { "#D1D7DA", 229 },
    ['1'] = { "#ECE9E4", 229 },
    ['2'] = { "#DCE2C7", 229 },
    ['3'] = { "#DBC4C1", 229 },
    ['4'] = { "#C4DFD1", 229 },
  },
  neutral = {
    ['red'] = { "#e39691", 124 },
    ['green'] = { "#b2ca67", 106 },
    ['yellow'] = { "#DBDA81", 172 },
    ['purple'] = { "#EBB7C1", 132 },
    ['orange'] = { "#ffb66f", 166 },
    ['blue'] = { "#B1CA8B", 106 },
    ['aqua'] = { "#A1CEB5", 72 },
  },
  bright = {
    ['red'] = { "#F0B4B1", 124 },
    ['green'] = { "#AFDB81", 106 },
    ['yellow'] = { "#FAD994", 172 },
    ['purple'] = { "#F0BBC6", 132 },
    ['orange'] = { "#ffb66f", 166 },
    ['blue'] = { "#B1CA8B", 106 },
    ['aqua'] = { "#A1CEB5", 72 },
  },
  koi = {
    ['0'] = { "#B1CA8B", 106 },
    ['1'] = { "#A1CEB5", 72 },
    ['2'] = { "#93CD81", 107 },
    ['3'] = { "#F2CD7F", 172 },
  },
  dark = {
    ['red'] = { "#423234", 167 },
    ['green'] = { "#373e2c", 142 },
    ['yellow'] = { "#404131", 214 },
    ['blue'] = { "#373e33", 109 },
    ['purple'] = { "#44393e", 175 },
    ['aqua'] = { "#333f3b", 108 },
    ['orange'] = { "#49392d", 208 },
  }
}

function adachi.colors()
  return _G.adachi_colors
end

---@param config AdachiConfig?
---@return AdachiTheme
function adachi.setup(config)
  ---@type AdachiConfig
  config = vim.tbl_extend("force", _G.adachi_config, config or {})
  return require 'adachi.themes'.setup(adachi.colors(), config)
end

return adachi
