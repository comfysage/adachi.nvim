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
    ['0_hard'] = { '#111318', 0 },
    ['0'] = { '#10101A', 0 },
    ['0_soft'] = { '#191B26', 0 },
    ['1'] = { '#222430', 0 },
    ['2'] = { '#353B49', 0 },
    ['3'] = { '#474F5E', 0 },
    ['4'] = { '#6A7589', 0 },
  },
  fg = {
    ['0_hard'] = { '#C3C9CC', 0 },
    ['0'] = { '#E0E0C8', 0 },
    ['0_soft'] = { '#D1D7DA', 0 },
    ['1'] = { '#B0B3BB', 0 }, -- C5C9D1
    ['2'] = { '#A9AAD9', 0 },
    ['3'] = { '#E3D6A8', 0 },
    ['4'] = { '#DCBFE0', 0 },
  },
  neutral = {
    ['red'] = { '#E5736D', 0 },
    ['green'] = { '#A4C87D', 0 },
    ['yellow'] = { '#DBDA81', 0 },
    ['purple'] = { '#BC94DA', 0 },
    ['orange'] = { '#E28D51', 0 },
    ['blue'] = { '#6F74AE', 0 },
    ['aqua'] = { '#6CA381', 0 },
  },
  bright = {
    ['red'] = { '#D99B98', 0 },
    ['green'] = { '#B8CCA3', 0 },
    ['yellow'] = { '#EAD3A3', 0 },
    ['purple'] = { '#CBABDA', 0 },
    ['orange'] = { '#EBB492', 0 },
    ['blue'] = { '#96C6D6', 0 },
    ['aqua'] = { '#96D6AF', 0 },
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
