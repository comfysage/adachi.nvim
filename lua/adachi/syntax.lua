
---@class AdachiSyntax
---@field context Color
---@field constant Color
---@field keyword Color
---@field type Color
---@field object Color

---@param theme AdachiTheme
---@return AdachiSyntax
return function(theme)
  local syntax = {}

  -- functions
  syntax.context = theme.blue
  -- constants, builtins, namespaces
  syntax.constant = theme.purple
  -- keywords, attributes
  syntax.keyword = theme.red
  -- types
  syntax.type = theme.yellow
  -- properties
  syntax.object = theme.orange

  return syntax
end
