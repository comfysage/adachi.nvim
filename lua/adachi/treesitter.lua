local M = {}

---@alias Captures { [string]: HLGroups }

---@param theme AdachiTheme
---@return Captures
function M.captures(theme)
  return {
    ['lua'] = {
      ['@keyword.function'] = { link = 'Structure' },
      ['@constructor'] = { theme.bg4 },
    },
  }
end

return M