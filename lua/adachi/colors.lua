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
    ['0_hard'] = { '#1c1b24', 0 },
    ['0']      = { '#20202a', 0 },
    ['0_soft'] = { '#2e2f3d', 0 },
    ['1'] = { '#393b4d', 0 },
    ['2'] = { '#474c61', 0 },
    ['3'] = { '#646d85', 0 },
    ['4'] = { '#7e8ba3', 0 },
  },
  fg = {
    ['0_hard'] = { '#d1d7da', 0 },
    ['0']      = { '#7f8ba3', 0 },
    ['0_soft'] = { '#80859e', 0 },
    ['1'] = { '#acb4bb', 0 },
    ['2'] = { '#a9c084', 0 },
    ['3'] = { '#e3d6a8', 0 },
    ['4'] = { '#dcbfe0', 0 },
  },
  neutral = {
    ['red']    = { '#D18E92', 0 },
    ['green']  = { '#9CB888', 0 },
    ['yellow'] = { '#DBCB95', 0 },
    ['purple'] = { '#D19BBC', 0 },
    ['orange'] = { '#DBB295', 0 },
    ['blue']   = { '#90C5D3', 0 },
    ['aqua']   = { '#90C3A6', 0 },
  },
  bright = {
    ['red']    = { '#ebb9bc', 0 },
    ['green']  = { '#c0d1a5', 0 },
    ['yellow'] = { '#e6deb6', 0 },
    ['purple'] = { '#ebb9de', 0 },
    ['orange'] = { '#e3bfaf', 0 },
    ['blue']   = { '#b9ddeb', 0 },
    ['aqua']   = { '#b1e0c5', 0 },
  },
  dark = {
    ['red']    = { '#453a40', 167 },
    ['green']  = { '#3b3f3c', 142 },
    ['yellow'] = { '#44423f', 214 },
    ['blue']   = { '#453a47', 109 },
    ['purple'] = { '#443b3e', 175 },
    ['aqua']   = { '#3a424a', 108 },
    ['orange'] = { '#384342', 208 },
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
