local M = {}

---@param theme AdachiTheme
local function setup_terminal_colors(theme)
  vim.g.terminal_color_0  = theme.bg0[1]
  vim.g.terminal_color_8  = theme.bg1[1]
  vim.g.terminal_color_1  = theme.gb.neutral['red'][1]
  vim.g.terminal_color_9  = theme.red[1]
  vim.g.terminal_color_2  = theme.gb.neutral['green'][1]
  vim.g.terminal_color_10 = theme.green[1]
  vim.g.terminal_color_3  = theme.gb.neutral['red'][1]
  vim.g.terminal_color_11 = theme.red[1]
  vim.g.terminal_color_4  = theme.gb.neutral['blue'][1]
  vim.g.terminal_color_12 = theme.blue[1]
  vim.g.terminal_color_5  = theme.gb.neutral['purple'][1]
  vim.g.terminal_color_13 = theme.purple[1]
  vim.g.terminal_color_6  = theme.gb.neutral['aqua'][1]
  vim.g.terminal_color_14 = theme.aqua[1]
  vim.g.terminal_color_7  = theme.fg4[1]
  vim.g.terminal_color_15 = theme.fg1[1]
end

---@class HLGroup
---@field link? string
---@field ['1'] Color
---@field ['2'] Color
---@field fg? string
---@field bg? string
---@field bold? boolean

---@alias HLGroups { [string]: HLGroup }

---@param theme AdachiTheme
---@param config AdachiConfig?
---@return HLGroups
function M.setup(theme, config)

  ---@type AdachiConfig
  config = vim.tbl_extend("force", _G.adachi_config, config or {})

  local hlGroups = {
    AdachiFg0 = { theme.fg0 },
    AdachiFg1 = { theme.fg1 },
    AdachiFg2 = { theme.fg2 },
    AdachiFg3 = { theme.fg3 },
    AdachiFg4 = { theme.fg4 },
    AdachiGray = { theme.bg1 },
    AdachiBg0 = { theme.bg },
    AdachiBg1 = { theme.bg1 },
    AdachiBg2 = { theme.bg2 },
    AdachiBg3 = { theme.bg3 },
    AdachiBg4 = { theme.bg4 },

    AdachiRed = { theme.red },
    AdachiRedBold = { theme.red, theme.none, bold = true },
    AdachiGreen = { theme.green },
    AdachiGreenBold = { theme.green, theme.none, bold = true },
    AdachiYellow = { theme.yellow },
    AdachiYellowBold = { theme.yellow, theme.none, bold = true },
    AdachiBlue = { theme.blue },
    AdachiBlueBold = { theme.blue, theme.none, bold = true },
    AdachiPurple = { theme.purple },
    AdachiPurpleBold = { theme.purple, theme.none, bold = true },
    AdachiAqua = { theme.aqua },
    AdachiAquaBold = { theme.aqua, theme.none, bold = true },
    AdachiOrange = { theme.orange },
    AdachiOrangeBold = { theme.orange, theme.none, bold = true },

    AdachiRedSign = { theme.red, theme.sign_column, reverse = theme.inverse.signs },
    AdachiGreenSign = { theme.green, theme.sign_column, reverse = theme.inverse.signs },
    AdachiYellowSign = { theme.yellow, theme.sign_column, reverse = theme.inverse.signs },
    AdachiBlueSign = { theme.blue, theme.sign_column, reverse = theme.inverse.signs },
    AdachiPurpleSign = { theme.purple, theme.sign_column, reverse = theme.inverse.signs },
    AdachiAquaSign = { theme.aqua, theme.sign_column, reverse = theme.inverse.signs },
    AdachiOrangeSign = { theme.orange, theme.sign_column, reverse = theme.inverse.signs },

    AdachiRedDark = { theme.red, theme.gb.dark['red'] },
    AdachiGreenDark = { theme.green, theme.gb.dark['green'] },
    AdachiYellowDark = { theme.yellow, theme.gb.dark['yellow'] },
    AdachiBlueDark = { theme.blue, theme.gb.dark['blue'] },
    AdachiPurpleDark = { theme.purple, theme.gb.dark['purple'] },
    AdachiAquaDark = { theme.aqua, theme.gb.dark['aqua'] },
    AdachiOrangeDark = { theme.orange, theme.gb.dark['orange'] },

    Normal = { theme.fg0, theme.bg0 },
    -- Screen line that the cursor is
    CursorLine = { theme.none, theme.bg1 },
    -- Line number of CursorLine
    CursorLineNr = { theme.selected, theme.bg1 },
    -- Screen column that the cursor is
    CursorColumn = { link = "CursorLine" },

    -- Tab pages line filler
    TabLineFill = { theme.bg4, theme.bg0 },
    -- Active tab page label
    TabLineSel = { theme.inverse.tabline and theme.bg0 or theme.red, theme.inverse.tabline and theme.red or theme.bg0 },
    -- Not active tab page label
    TabLine = { link = "TabLineFill" },

    -- Match paired bracket under the cursor
    -- MatchParen = { theme.none, theme.bg3, bold = theme.bold },

    -- Highlighted screen columns
    ColorColumn = { theme.none, theme.color_column },
    -- Concealed element: \lambda → λ
    Conceal = { theme.blue, theme.none },

    NonText = { link = "AdachiBg2" },
    SpecialKey = { link = "AdachiBg2" },

    Visual = { theme.none, theme.bg3 },
    VisualNOS = { link = "Visual" },

    Search = { theme.selected, theme.bg0, reverse = theme.inverse.search },
    IncSearch = { theme.orange, theme.bg0, reverse = theme.inverse.search },

    Underlined = { theme.blue, theme.none, underline = true },
    StatusLine = { theme.bg2, theme.fg1 },
    StatuslineNC = { theme.bg1, theme.fg4 },

    -- The column separating vertically split windows
    VertSplit = { theme.bg3, theme.vert_split },

    -- Current match in wildmenu completion
    WildMenu = { theme.blue, theme.bg2 },

    -- Directory names, special names in listing
    Directory = { link = "AdachiGreenBold" },
    -- Titles for output from :set all, :autocmd, etc.
    Title = { link = "AdachiGreenBold" },
    -- Error messages on the command line
    ErrorMsg = { theme.bg0, theme.red },
    -- More prompt: -- More --
    MoreMsg = { link = "AdachiYellowBold" },
    -- Current mode message: -- INSERT --
    ModeMsg = { link = "AdachiYellowBold" },
    -- 'Press enter' prompt and yes/no questions
    Question = { link = "AdachiOrangeBold" },
    -- Warning messages
    WarningMsg = { link = "AdachiRedBold" },

    -- Line number for :number and :# commands
    LineNr = { theme.bg4, theme.number_column },

    -- Column where signs are displayed
    SignColumn = { theme.none, theme.sign_column },

    -- Line used for closed folds
    Folded = { theme.bg4, theme.bg0 },
    -- Column where folds are displayed
    FoldColumn = { theme.bg3, theme.bg1 },
    -- Character under cursor
    Cursor = { theme.none, theme.selected, reverse = not theme.inverse.search },
    -- Visual mode cursor, selection
    vCursor = { link = "Cursor" },
    -- Input moder cursor
    iCursor = { link = "Cursor" },
    -- Language mapping cursor
    lCursor = { link = "Cursor" },

    Special = { theme.orange },
    Comment = { theme.comment, bold = theme.bold.comment, italic = theme.italic.comment },
    Todo = { theme.purple, theme.bg1 },
    Error = { theme.red },


    -- Generic statement
    Statement = { link = "AdachiRed" },
    -- if, then, else, endif, swicth, etc.
    Conditional = { link = "AdachiRed" },
    -- for, do, while, etc.
    Repeat = { link = "AdachiRed" },
    -- case, default, etc.
    Label = { link = "AdachiRed" },
    -- try, catch, throw
    Exception = { link = "AdachiRed" },
    -- sizeof, "+", "*", etc.
    Operator = { link = "Normal" },
    -- Any other keyword
    Keyword = { link = "AdachiRed", bold = theme.bold.keyword, italic = theme.italic.keyword },

    Delimiter = { link = "AdachiAqua" },
    MatchParen = { link = "AdachiYellow" },

    -- Variable name
    Identifier = { link = "AdachiBlue" },
    -- Function name
    Function = { link = "AdachiGreenBold" },

    -- Generic preprocessor
    PreProc = { link = "AdachiAqua" },
    -- Preprocessor #include
    Include = { link = "AdachiAqua" },
    -- Preprocessor #define
    Define = { link = "AdachiAqua" },
    -- Same as Define
    Macro = { link = "AdachiAqua" },
    -- Preprocessor #if, #else, #endif, etc.
    PreCondit = { link = "AdachiAqua" },

    -- Generic constant
    Constant = { link = "AdachiPurple" },
    -- Character constant: 'c', '/n'
    Character = { link = "AdachiPurple" },
    -- String constant: "this is a string"
    String = { theme.green },

    -- Boolean constant: TRUE, false
    Boolean = { link = "AdachiPurple" },
    -- Number constant: 234, 0xff
    Number = { link = "AdachiPurple" },
    -- Floating point constant: 2.3e10
    Float = { link = "AdachiPurple" },

    -- Generic type
    Type = { link = "AdachiYellow" },
    -- static, register, volatile, etc
    StorageClass = { link = "AdachiOrange" },
    -- struct, union, enum, etc.
    Structure = { link = "AdachiAqua" },
    -- typedef
    Typedef = { link = "AdachiYellow" },

    -- Treesitter
    TSStrong             = { theme.none, theme.none, --[[ theme.bold ]] },
    TSEmphasis           = { theme.none, theme.none, --[[ theme.italic ]] },
    TSUnderline          = { theme.none, theme.none, --[[ theme.underline ]] },
    TSNote               = { theme.blue, theme.bg0, --[[ theme.bold ]] },
    TSWarning            = { theme.yellow, theme.bg0, --[[ theme.bold ]] },
    TSDanger             = { theme.red, theme.bg0, --[[ theme.bold ]] },

    TSAnnotation         = { link = "AdachiPurple" },
    TSAttribute          = { link = "AdachiPurple" },
    TSBoolean            = { link = "AdachiPurple" },
    TSCharacter          = { link = "AdachiAqua" },
    TSComment            = { link = "Comment" },
    TSConditional        = { link = "AdachiRed" },
    TSConstBuiltin       = { link = "AdachiBlue" },
    TSConstMacro         = { link = "AdachiBlue" },
    TSConstant           = { link = "AdachiPurple" },
    TSConstructor        = { link = "AdachiGreen" },
    TSException          = { link = "AdachiRed" },
    TSField              = { link = "AdachiAqua" },
    TSFloat              = { link = "AdachiPurple" },
    TSFuncBuiltin        = { link = "AdachiGreen" },
    TSFuncMacro          = { link = "AdachiGreen" },
    TSFunction           = { link = "AdachiGreen" },
    TSInclude            = { link = "AdachiRed" },
    TSKeyword            = { link = "AdachiRed" },
    TSKeywordFunction    = { link = "AdachiRed" },
    TSKeywordOperator    = { link = "AdachiOrange" },
    TSLabel              = { link = "AdachiRed" },
    TSMethod             = { link = "AdachiGreen" },
    TSNamespace          = { link = "AdachiFg4" },
    TSNone               = { link = "Normal" },
    TSNumber             = { link = "AdachiPurple" },
    TSOperator           = { link = "AdachiOrange" },
    TSParameter          = { link = "AdachiAqua" },
    TSParameterReference = { link = "AdachiFg2" },
    TSProperty           = { link = "AdachiAqua" },
    TSPunctBracket       = { link = "Delimiter" },
    TSPunctDelimiter     = { link = "Delimiter" },
    TSPunctSpecial       = { link = "Special" },
    TSRepeat             = { link = "AdachiRed" },
    TSStorageClass       = { link = "AdachiOrange" },
    TSString             = { link = "AdachiGreen" },
    TSStringEscape       = { link = "AdachiGreen" },
    TSStringRegex        = { link = "AdachiGreen" },
    TSSymbol             = { link = "AdachiFg1" },
    TSTag                = { link = "AdachiOrange" },
    TSTagDelimiter       = { link = "AdachiGreen" },
    TSText               = { link = "AdachiGreen" },
    TSStrike             = { link = "AdachiGray" },
    TSMath               = { link = "AdachiBlue" },
    TSType               = { link = "AdachiYellow" },
    TSTypeBuiltin        = { link = "AdachiYellow" },
    TSURI                = { link = "markdownUrl" },
    TSVariable           = { link = "AdachiFg1" },
    TSVariableBuiltin    = { link = "AdachiBlue" },

    -- Completion Menu
    Pmenu = { theme.fg1, theme.bg2 },
    PmenuSel = { theme.blue, theme.bg2, reverse = theme.inverse.search },
    PmenuSbar = { theme.none, theme.bg2 },
    PmenuThumb = { theme.none, theme.bg4 },

    -- Diffs
    DiffDelete = { theme.red, theme.bg0, reverse = theme.inverse.signs },
    DiffAdd = { theme.green, theme.bg0, reverse = theme.inverse.signs },
    DiffChange = { theme.aqua, theme.bg0, reverse = theme.inverse.signs },
    DiffText = { theme.yellow, theme.bg0, reverse = theme.inverse.signs },

    -- Spell
    SpellCap   = { theme.green },
    SpellBad   = { theme.blue },
    SpellLocal = { theme.aqua },
    SpellRare  = { theme.purple },

    -- Diagnostics
    DiagnosticFloatingError              = { link = "ErrorFloat" },
    DiagnosticFloatingWarn               = { link = "WarningFloat" },
    DiagnosticFloatingInfo               = { link = "InfoFloat" },
    DiagnosticFloatingHint               = { link = "HintFloat" },
    DiagnosticError                      = { link = "AdachiRedDark" },
    DiagnosticWarn                       = { link = "AdachiYellowDark" },
    DiagnosticInfo                       = { link = "AdachiAquaDark" },
    DiagnosticHint                       = { link = "AdachiAquaDark" },
    DiagnosticVirtualTextError           = { link = "AdachiRedDark" },
    DiagnosticVirtualTextWarn            = { link = "AdachiYellowDark" },
    DiagnosticVirtualTextInfo            = { link = "AdachiAquaDark" },
    DiagnosticVirtualTextHint            = { link = "VirtualTextHint" },
    DiagnosticUnderlineError             = { link = "ErrorText" },
    DiagnosticUnderlineWarn              = { link = "WarningText" },
    DiagnosticUnderlineInfo              = { link = "InfoText" },
    DiagnosticUnderlineHint              = { link = "HintText" },
    DiagnosticSignError                  = { link = "AdachiRedSign" },
    DiagnosticSignWarn                   = { link = "AdachiYellowSign" },
    DiagnosticSignInfo                   = { link = "AdachiBlueSign" },
    DiagnosticSignHint                   = { link = "AdachiGreenSign" },
    LspDiagnosticsFloatingError          = { link = "DiagnosticFloatingError" },
    LspDiagnosticsFloatingWarning        = { link = "DiagnosticFloatingWarn" },
    LspDiagnosticsFloatingInformation    = { link = "DiagnosticFloatingInfo" },
    LspDiagnosticsFloatingHint           = { link = "DiagnosticFloatingHint" },
    LspDiagnosticsDefaultError           = { link = "DiagnosticError" },
    LspDiagnosticsDefaultWarning         = { link = "DiagnosticWarn" },
    LspDiagnosticsDefaultInformation     = { link = "DiagnosticInfo" },
    LspDiagnosticsDefaultHint            = { link = "DiagnosticHint" },
    LspDiagnosticsVirtualTextError       = { link = "DiagnosticVirtualTextError" },
    LspDiagnosticsVirtualTextWarning     = { link = "DiagnosticVirtualTextWarn" },
    LspDiagnosticsVirtualTextInformation = { link = "DiagnosticVirtualTextInfo" },
    LspDiagnosticsVirtualTextHint        = { link = "DiagnosticVirtualTextHint" },
    LspDiagnosticsUnderlineError         = { link = "DiagnosticUnderlineError" },
    LspDiagnosticsUnderlineWarning       = { link = "DiagnosticUnderlineWarn" },
    LspDiagnosticsUnderlineInformation   = { link = "DiagnosticUnderlineInfo" },
    LspDiagnosticsUnderlineHint          = { link = "DiagnosticUnderlineHint" },
    LspDiagnosticsSignError              = { link = "DiagnosticSignError" },
    LspDiagnosticsSignWarning            = { link = "DiagnosticSignWarn" },
    LspDiagnosticsSignInformation        = { link = "DiagnosticSignInfo" },
    LspDiagnosticsSignHint               = { link = "DiagnosticSignHint" },
    LspReferenceText                     = { link = "CurrentWord" },
    LspReferenceRead                     = { link = "CurrentWord" },
    LspReferenceWrite                    = { link = "CurrentWord" },
    LspCodeLens                          = { link = "VirtualTextInfo" },
    LspCodeLensSeparator                 = { link = "VirtualTextHint" },
    LspSignatureActiveParameter          = { link = "Search" },
    healthError                          = { link = "AdachiRedDark" },
    healthSuccess                        = { link = "AdachiGreenDark" },
    healthWarning                        = { link = "AdachiYellowDark" },
  }

  if vim.fn.has('nvim-0.8.0') then
    hlGroups['@annotation'] = { link = "TSAnnotation" }
    hlGroups['@attribute'] = { link = "TSAttribute" }
    hlGroups['@boolean'] = { link = "TSBoolean" }
    hlGroups['@character'] = { link = "TSCharacter" }
    hlGroups['@comment'] = { link = "TSComment" }
    hlGroups['@conditional'] = { link = "TSConditional" }
    hlGroups['@constant'] = { link = "TSConstant" }
    hlGroups['@constant.builtin'] = { link = "TSConstBuiltin" }
    hlGroups['@constant.macro'] = { link = "TSConstMacro" }
    hlGroups['@constructor'] = { link = "TSConstructor" }
    hlGroups['@exception'] = { link = "TSException" }
    hlGroups['@field'] = { link = "TSField" }
    hlGroups['@float'] = { link = "TSFloat" }
    hlGroups['@function'] = { link = "TSFunction" }
    hlGroups['@function.call'] = { link = "TSConstant" }
    hlGroups['@function.builtin'] = { link = "TSFuncBuiltin" }
    hlGroups['@function.macro'] = { link = "TSFuncMacro" }
    hlGroups['@include'] = { link = "TSInclude" }
    hlGroups['@keyword'] = { link = "TSKeyword" }
    hlGroups['@keyword.function'] = { link = "TSKeywordFunction" }
    hlGroups['@keyword.operator'] = { link = "TSKeywordOperator" }
    hlGroups['@label'] = { link = "TSLabel" }
    hlGroups['@method'] = { link = "TSMethod" }
    hlGroups['@method.call'] = { link = "@function.call" }
    hlGroups['@namespace'] = { link = "TSNamespace" }
    hlGroups['@none'] = { link = "TSNone" }
    hlGroups['@number'] = { link = "TSNumber" }
    hlGroups['@operator'] = { link = "TSOperator" }
    hlGroups['@parameter'] = { link = "TSParameter" }
    hlGroups['@parameter.reference'] = { link = "TSParameterReference" }
    hlGroups['@property'] = { link = "TSProperty" }
    hlGroups['@punctuation.bracket'] = { link = "TSPunctBracket" }
    hlGroups['@punctuation.delimiter'] = { link = "TSPunctDelimiter" }
    hlGroups['@punctuation.special'] = { link = "TSPunctSpecial" }
    hlGroups['@repeat'] = { link = "TSRepeat" }
    hlGroups['@storageclass'] = { link = "TSStorageClass" }
    hlGroups['@string'] = { link = "TSString" }
    hlGroups['@string.escape'] = { link = "TSStringEscape" }
    hlGroups['@string.regex'] = { link = "TSStringRegex" }
    hlGroups['@symbol'] = { link = "TSSymbol" }
    hlGroups['@tag'] = { link = "TSTag" }
    hlGroups['@tag.delimiter'] = { link = "TSTagDelimiter" }
    hlGroups['@text'] = { link = "TSText" }
    hlGroups['@strike'] = { link = "TSStrike" }
    hlGroups['@math'] = { link = "TSMath" }
    hlGroups['@type'] = { link = "TSType" }
    hlGroups['@type.builtin'] = { link = "TSTypeBuiltin" }
    hlGroups['@uri'] = { link = "TSURI" }
    hlGroups['@variable'] = { link = "TSVariable" }
    hlGroups['@variable.builtin'] = { link = "TSVariableBuiltin" }
  end

  if config.plugins then
    local plugin_groups = require 'adachi.plugins'.plugins
    if type(config.plugins) == "boolean" then
      for _, plugin_hl in pairs(plugin_groups) do
        hlGroups = vim.tbl_deep_extend('force', hlGroups, plugin_hl or {})
      end
    else
      ---@diagnostic disable-next-line: param-type-mismatch
      for _, p_name in ipairs(config.plugins) do
        hlGroups = vim.tbl_deep_extend('force', hlGroups, plugin_groups[p_name] or {})
      end
    end
  end

  local lang_higroups = require 'adachi.hl'.higroups(theme)
  for l_name in pairs(lang_higroups) do
    hlGroups = vim.tbl_deep_extend('force', hlGroups, lang_higroups[l_name])
  end

  if config.override_terminal then
    setup_terminal_colors(theme)
  end

  for hl, override in pairs(config.overrides) do
    if hlGroups[hl] and not vim.tbl_isempty(override) then
      hlGroups[hl].link = nil
    end
    hlGroups[hl] = vim.tbl_deep_extend("force", hlGroups[hl] or {}, override)
  end

  return hlGroups
end

return M
