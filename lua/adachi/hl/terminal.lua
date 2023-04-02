---@param theme AdachiTheme
return function(theme)
  vim.g.terminal_color_0  = theme.bg1[1]
  vim.g.terminal_color_8  = theme.bg0[1]
  vim.g.terminal_color_1  = theme.red[1]
  vim.g.terminal_color_9  = theme.gb.neutral['red'][1]
  vim.g.terminal_color_2 = theme.green[1]
  vim.g.terminal_color_10  = theme.gb.neutral['green'][1]
  vim.g.terminal_color_3 = theme.yellow[1]
  vim.g.terminal_color_11  = theme.gb.neutral['yellow'][1]
  vim.g.terminal_color_4 = theme.blue[1]
  vim.g.terminal_color_12  = theme.gb.neutral['blue'][1]
  vim.g.terminal_color_5 = theme.purple[1]
  vim.g.terminal_color_13  = theme.gb.neutral['purple'][1]
  vim.g.terminal_color_6 = theme.aqua[1]
  vim.g.terminal_color_14  = theme.gb.neutral['aqua'][1]
  vim.g.terminal_color_7 = theme.bg3[1]
  vim.g.terminal_color_15  = theme.bg4[1]
end
