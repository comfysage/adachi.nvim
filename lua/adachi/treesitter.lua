local M = {}

---@alias Captures { [string]: HLGroups }

---@param theme AdachiTheme
---@return Captures
function M.captures(theme)
  return {
    ['lua'] = {
      ['@constructor'] = { theme.bg4 },
    },
    ['c'] = {
      ['@include'] = { theme.aqua },
    },
    ['cpp'] = {
      ['@include'] = { theme.aqua },
    },
  }
end

return M
