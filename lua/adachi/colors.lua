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

_G.adachi_colors = {
  bg = {
    ['0_hard'] = { '#272F33', 0 },
    ['0'] = { '#2D363B', 0 },
    ['0_soft'] = { '#323E43', 0 },
    ['1'] = { '#39494D', 0 },
    ['2'] = { '#475D61', 0 },
    ['3'] = { '#648285', 0 },
    ['4'] = { '#7EA2A3', 0 },
  },
  fg = {
    ['0_hard'] = { '#C3C9CC', 0 },
    ['0'] = { '#D9CFB2', 0 },
    ['0_soft'] = { '#D1D7DA', 0 },
    ['1'] = { '#ACB4BB', 0 },
    ['2'] = { '#A9C084', 0 },
    ['3'] = { '#E3D6A8', 0 },
    ['4'] = { '#DCBFE0', 0 },
  },
  neutral = {
    ['red'] = { '#BF5C69', 0 },
    ['green'] = { '#8EAE76', 0 },
    ['yellow'] = { '#CBB776', 0 },
    ['purple'] = { '#C884AE', 0 },
    ['orange'] = { '#D49366', 0 },
    ['blue'] = { '#6A9EAC', 0 },
    ['aqua'] = { '#6BA885', 0 },
  },
  bright = {
    ['red'] = { '#DB7F85', 0 },
    ['green'] = { '#B1C297', 0 },
    ['yellow'] = { '#E6CD9C', 0 },
    ['purple'] = { '#DB9EB9', 0 },
    ['orange'] = { '#E8A282', 0 },
    ['blue'] = { '#84BBBD', 0 },
    ['aqua'] = { '#8CBD98', 0 },
  },
  dark = {
    ['red']    = { "#483e43", 167 },
    ['green']  = { "#404946", 142 },
    ['yellow'] = { "#4b4b46", 214 },
    ['blue']   = { "#48434b", 109 },
    ['purple'] = { "#4b4342", 175 },
    ['aqua']   = { "#38484c", 108 },
    ['orange'] = { "#394846", 208 },
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
