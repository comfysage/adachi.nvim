" -----------------------------------------------------------------------------
" File: adachi.vim
" Description: Retro groove color scheme for Vim
" Author: CrispyBaccoon
" Source: https://github.com/CrispyBaccoon/adachi
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='adachi'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:adachi_bold')
  let g:adachi_bold=1
endif
if !exists('g:adachi_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:adachi_italic=1
  else
    let g:adachi_italic=0
  endif
endif
if !exists('g:adachi_undercurl')
  let g:adachi_undercurl=1
endif
if !exists('g:adachi_underline')
  let g:adachi_underline=1
endif
if !exists('g:adachi_inverse')
  let g:adachi_inverse=1
endif

if !exists('g:adachi_guisp_fallback') || index(['fg', 'bg'], g:adachi_guisp_fallback) == -1
  let g:adachi_guisp_fallback='NONE'
endif

if !exists('g:adachi_improved_strings')
  let g:adachi_improved_strings=0
endif

if !exists('g:adachi_improved_warnings')
  let g:adachi_improved_warnings=0
endif

if !exists('g:adachi_termcolors')
  let g:adachi_termcolors=256
endif

if !exists('g:adachi_invert_indent_guides')
  let g:adachi_invert_indent_guides=0
endif

if exists('g:adachi_contrast')
  echo 'g:adachi_contrast is deprecated; use g:adachi_contrast_light and g:adachi_contrast_dark instead'
endif

if !exists('g:adachi_contrast_dark')
  let g:adachi_contrast_dark='medium'
endif

if !exists('g:adachi_contrast_light')
  let g:adachi_contrast_light='medium'
endif

if !exists('g:adachi_transparent_background')
  let g:adachi_transparent_background=0
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234]     " 29-32-33
let s:gb.dark0       = ['#282828', 235]     " 40-40-40
let s:gb.dark0_soft  = ['#32302f', 236]     " 50-48-47
let s:gb.dark1       = ['#2a2a2a', 237]     " 60-56-54
let s:gb.dark2       = ['#3c3836', 239]     " 80-73-69
let s:gb.dark3       = ['#504945', 241]     " 102-92-84
let s:gb.dark4       = ['#665c54', 243]     " 124-111-100
let s:gb.dark4_256   = ['#7c6f64', 243]     " 124-111-100

let s:gb.gray_245    = ['#928374', 245]     " 146-131-116
let s:gb.gray_244    = ['#928374', 244]     " 146-131-116

let s:gb.light0_hard = ['#f9f5d7', 230]     " 249-245-215
let s:gb.light0      = ['#ffdbb3', 229]     " 253-244-193
let s:gb.light0_soft = ['#f2e5bc', 228]     " 242-229-188
let s:gb.light1      = ['#f7cb9c', 223]     " 235-219-178
let s:gb.light2      = ['#f7e2c1', 250]     " 213-196-161
let s:gb.light3      = ['#f5cb9e', 248]     " 189-174-147
let s:gb.light4      = ['#f0d3a8', 246]     " 168-153-132
let s:gb.light4_256  = ['#a89984', 246]     " 168-153-132

let s:gb.bright_red     = ['#f2594b', 167]     " 251-73-52
let s:gb.bright_green   = ['#b0b846', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:gb.bright_blue    = ['#80aa9e', 109]     " 131-165-152
let s:gb.bright_purple  = ['#d3869b', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#8bba7f', 108]     " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208]     " 254-128-25

let s:gb.neutral_red    = ['#ea6962', 124]     " 204-36-29
let s:gb.neutral_green  = ['#a9b665', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#d8a657', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#7daea3', 66]      " 69-133-136
let s:gb.neutral_purple = ['#D6949E', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#89b482', 72]      " 104-157-106
let s:gb.neutral_orange = ['#f28534', 166]     " 214-93-14

let s:gb.faded_red      = ['#EF705E', 88]      " 157-0-6
let s:gb.faded_green    = ['#BABC5A', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#e9b143', 136]     " 181-118-20
let s:gb.faded_blue     = ['#94B1A0', 24]      " 7-102-120
let s:gb.faded_purple   = ['#AF7283', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#9CBE87', 66]      " 66-123-88
let s:gb.faded_orange   = ['#d8a657', 130]     " 175-58-3

let s:gb.dark_red       = ['#462726', 167]     " 251-73-52
let s:gb.dark_green     = ['#363a25', 142]     " 184-187-38
let s:gb.dark_yellow    = ['#483b22', 214]     " 250-189-47
let s:gb.dark_blue      = ['#2c3735', 109]     " 131-165-152
let s:gb.dark_purple    = ['#3e2f34', 175]     " 211-134-155
let s:gb.dark_aqua      = ['#2e3a2e', 108]     " 142-192-124
let s:gb.dark_orange    = ['#492e21', 208]     " 254-128-25

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:adachi_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:adachi_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:adachi_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:adachi_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:adachi_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0_hard
  let s:bg_color = s:bg0
  if g:adachi_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:adachi_contrast_dark == 'medium'
    let s:bg0  = s:gb.dark0
  endif
  if g:adachi_transparent_background
    let s:bg0 = ['NONE', 0]
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.neutral_aqua
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  if g:adachi_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:adachi_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.neutral_aqua
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:adachi_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:adachi_hls_cursor')
  let s:hls_cursor = get(s:gb, g:adachi_hls_cursor)
endif

let s:number_column = s:none
if exists('g:adachi_number_column')
  let s:number_column = get(s:gb, g:adachi_number_column)
endif

let s:sign_column = s:bg1
if g:adachi_transparent_background
  let s:sign_column = ['NONE', 0]
endif

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:adachi_sign_column')
    let s:sign_column = get(s:gb, g:adachi_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:adachi_color_column')
  let s:color_column = get(s:gb, g:adachi_color_column)
endif

let s:vert_split = s:bg0
if exists('g:adachi_vert_split')
  let s:vert_split = get(s:gb, g:adachi_vert_split)
endif

let s:invert_signs = ''
if exists('g:adachi_invert_signs')
  if g:adachi_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:adachi_invert_selection')
  if g:adachi_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:adachi_invert_tabline')
  if g:adachi_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = ''
if exists('g:adachi_italicize_comments')
  if g:adachi_italicize_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

let s:italicize_strings = ''
if exists('g:adachi_italicize_strings')
  if g:adachi_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:adachi_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:adachi_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Adachi Hi Groups: {{{

" memoize common hi groups
call s:HL('AdachiFg0', s:fg0)
call s:HL('AdachiFg1', s:fg1)
call s:HL('AdachiFg2', s:fg2)
call s:HL('AdachiFg3', s:fg3)
call s:HL('AdachiFg4', s:fg4)
call s:HL('AdachiGray', s:gray)
call s:HL('AdachiBg0', s:bg_color)
call s:HL('AdachiBg1', s:bg1)
call s:HL('AdachiBg2', s:bg2)
call s:HL('AdachiBg3', s:bg3)
call s:HL('AdachiBg4', s:bg4)

call s:HL('AdachiRed', s:red)
call s:HL('AdachiRedBold', s:red, s:none, s:bold)
call s:HL('AdachiGreen', s:green)
call s:HL('AdachiGreenBold', s:green, s:none, s:bold)
call s:HL('AdachiYellow', s:yellow)
call s:HL('AdachiYellowBold', s:yellow, s:none, s:bold)
call s:HL('AdachiBlue', s:blue)
call s:HL('AdachiBlueBold', s:blue, s:none, s:bold)
call s:HL('AdachiPurple', s:purple)
call s:HL('AdachiPurpleBold', s:purple, s:none, s:bold)
call s:HL('AdachiAqua', s:aqua)
call s:HL('AdachiAquaBold', s:aqua, s:none, s:bold)
call s:HL('AdachiOrange', s:orange)
call s:HL('AdachiOrangeBold', s:orange, s:none, s:bold)

call s:HL('AdachiRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('AdachiGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('AdachiYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('AdachiBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('AdachiPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('AdachiAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('AdachiOrangeSign', s:orange, s:sign_column, s:invert_signs)

call s:HL('AdachiRedDark', s:red, s:gb.dark_red)
call s:HL('AdachiGreenDark', s:green, s:gb.dark_green)
call s:HL('AdachiYellowDark', s:yellow, s:gb.dark_yellow)
call s:HL('AdachiBlueDark', s:blue, s:gb.dark_blue)
call s:HL('AdachiPurpleDark', s:purple, s:gb.dark_purple)
call s:HL('AdachiAquaDark', s:aqua, s:gb.dark_aqua)
call s:HL('AdachiOrangeDark', s:orange, s:gb.dark_orange)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/adachi/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg0, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:red, s:bg0, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText AdachiBg2
hi! link SpecialKey AdachiBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory AdachiGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title AdachiGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg AdachiYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg AdachiYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question AdachiOrangeBold
" Warning messages
hi! link WarningMsg AdachiRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg0, s:italicize_comments)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:adachi_improved_strings == 0
  hi! link Special AdachiOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:purple, s:bg1, s:bold)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement AdachiRed
" if, then, else, endif, swicth, etc.
hi! link Conditional AdachiRed
" for, do, while, etc.
hi! link Repeat AdachiRed
" case, default, etc.
hi! link Label AdachiRed
" try, catch, throw
hi! link Exception AdachiRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword AdachiRed

hi! link Delimiter AdachiAqua
hi! link MatchParen AdachiYellow

" Variable name
hi! link Identifier AdachiBlue
" Function name
hi! link Function AdachiGreenBold

" Generic preprocessor
hi! link PreProc AdachiAqua
" Preprocessor #include
hi! link Include AdachiAqua
" Preprocessor #define
hi! link Define AdachiAqua
" Same as Define
hi! link Macro AdachiAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit AdachiAqua

" Generic constant
hi! link Constant AdachiPurple
" Character constant: 'c', '/n'
hi! link Character AdachiPurple
" String constant: "this is a string"
if g:adachi_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean AdachiPurple
" Number constant: 234, 0xff
hi! link Number AdachiPurple
" Floating point constant: 2.3e10
hi! link Float AdachiPurple

" Generic type
hi! link Type AdachiYellow
" static, register, volatile, etc
hi! link StorageClass AdachiOrange
" struct, union, enum, etc.
hi! link Structure AdachiAqua
" typedef
hi! link Typedef AdachiYellow

" }}}
" Treesitter: {{{

call s:HL('TSStrong', s:none, s:none, s:bold)
call s:HL('TSEmphasis', s:none, s:none, s:italic)
call s:HL('TSUnderline', s:none, s:none, s:underline)
call s:HL('TSNote', s:blue, s:bg0, s:bold)
call s:HL('TSWarning', s:yellow, s:bg0, s:bold)
call s:HL('TSDanger', s:red, s:bg0, s:bold)
highlight! link TSAnnotation AdachiPurple
highlight! link TSAttribute AdachiPurple
highlight! link TSBoolean AdachiPurple
highlight! link TSCharacter AdachiAqua
highlight! link TSComment Comment
highlight! link TSConditional AdachiRed
highlight! link TSConstBuiltin AdachiBlue
highlight! link TSConstMacro AdachiBlue
highlight! link TSConstant AdachiPurple
highlight! link TSConstructor AdachiGreen
highlight! link TSException AdachiRed
highlight! link TSField AdachiAqua
highlight! link TSFloat AdachiPurple
highlight! link TSFuncBuiltin AdachiGreen
highlight! link TSFuncMacro AdachiGreen
highlight! link TSFunction AdachiGreen
highlight! link TSInclude AdachiRed
highlight! link TSKeyword AdachiRed
highlight! link TSKeywordFunction AdachiRed
highlight! link TSKeywordOperator AdachiOrange
highlight! link TSLabel AdachiRed
highlight! link TSMethod AdachiGreen
highlight! link TSNamespace AdachiAqua
highlight! link TSNone Normal
highlight! link TSNumber AdachiPurple
highlight! link TSOperator AdachiOrange
highlight! link TSParameter AdachiAqua
highlight! link TSParameterReference AdachiFg2
highlight! link TSProperty AdachiAqua
highlight! link TSPunctBracket Delimiter
highlight! link TSPunctDelimiter Delimiter
highlight! link TSPunctSpecial Special
highlight! link TSRepeat AdachiRed
highlight! link TSStorageClass AdachiOrange
highlight! link TSString AdachiGreen
highlight! link TSStringEscape AdachiGreen
highlight! link TSStringRegex AdachiGreen
highlight! link TSSymbol AdachiFg1
highlight! link TSTag AdachiOrange
highlight! link TSTagDelimiter AdachiGreen
highlight! link TSText AdachiGreen
highlight! link TSStrike AdachiGray
highlight! link TSMath AdachiBlue
highlight! link TSType AdachiYellow
highlight! link TSTypeBuiltin AdachiYellow
highlight! link TSURI markdownUrl
highlight! link TSVariable AdachiFg3
highlight! link TSVariableBuiltin AdachiBlue
if has('nvim-0.8.0')
  highlight! link @annotation TSAnnotation
  highlight! link @attribute TSAttribute
  highlight! link @boolean TSBoolean
  highlight! link @character TSCharacter
  highlight! link @comment TSComment
  highlight! link @conditional TSConditional
  highlight! link @constant TSConstant
  highlight! link @constant.builtin TSConstBuiltin
  highlight! link @constant.macro TSConstMacro
  highlight! link @constructor TSConstructor
  highlight! link @exception TSException
  highlight! link @field TSField
  highlight! link @float TSFloat
  highlight! link @function TSFunction
  highlight! link @function.call TSConstant
  highlight! link @function.builtin TSFuncBuiltin
  highlight! link @function.macro TSFuncMacro
  highlight! link @include TSInclude
  highlight! link @keyword TSKeyword
  highlight! link @keyword.function TSKeywordFunction
  highlight! link @keyword.operator TSKeywordOperator
  highlight! link @label TSLabel
  highlight! link @method TSMethod
  highlight! link @namespace TSNamespace
  highlight! link @none TSNone
  highlight! link @number TSNumber
  highlight! link @operator TSOperator
  highlight! link @parameter TSParameter
  highlight! link @parameter.reference TSParameterReference
  highlight! link @property TSProperty
  highlight! link @punctuation.bracket TSPunctBracket
  highlight! link @punctuation.delimiter TSPunctDelimiter
  highlight! link @punctuation.special TSPunctSpecial
  highlight! link @repeat TSRepeat
  highlight! link @storageclass TSStorageClass
  highlight! link @string TSString
  highlight! link @string.escape TSStringEscape
  highlight! link @string.regex TSStringRegex
  highlight! link @symbol TSSymbol
  highlight! link @tag TSTag
  highlight! link @tag.delimiter TSTagDelimiter
  highlight! link @text TSText
  highlight! link @strike TSStrike
  highlight! link @math TSMath
  highlight! link @type TSType
  highlight! link @type.builtin TSTypeBuiltin
  highlight! link @uri TSURI
  highlight! link @variable TSVariable
  highlight! link @variable.builtin TSVariableBuiltin
endif

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:adachi_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}
" Diagnostic: {{{

if has('nvim')
  hi! link DiagnosticFloatingError ErrorFloat
  hi! link DiagnosticFloatingWarn WarningFloat
  hi! link DiagnosticFloatingInfo InfoFloat
  hi! link DiagnosticFloatingHint HintFloat
  hi! link DiagnosticError AdachiRedDark
  hi! link DiagnosticWarn AdachiYellowDark
  hi! link DiagnosticInfo AdachiAquaDark
  hi! link DiagnosticHint AdachiAquaDark
  hi! link DiagnosticVirtualTextError AdachiRedDark
  hi! link DiagnosticVirtualTextWarn AdachiYellowDark
  hi! link DiagnosticVirtualTextInfo AdachiAquaDark
  hi! link DiagnosticVirtualTextHint VirtualTextHint
  hi! link DiagnosticUnderlineError ErrorText
  hi! link DiagnosticUnderlineWarn WarningText
  hi! link DiagnosticUnderlineInfo InfoText
  hi! link DiagnosticUnderlineHint HintText
  hi! link DiagnosticSignError AdachiRedSign
  hi! link DiagnosticSignWarn AdachiYellowSign
  hi! link DiagnosticSignInfo AdachiBlueSign
  hi! link DiagnosticSignHint AdachiGreenSign
  hi! link LspDiagnosticsFloatingError DiagnosticFloatingError
  hi! link LspDiagnosticsFloatingWarning DiagnosticFloatingWarn
  hi! link LspDiagnosticsFloatingInformation DiagnosticFloatingInfo
  hi! link LspDiagnosticsFloatingHint DiagnosticFloatingHint
  hi! link LspDiagnosticsDefaultError DiagnosticError
  hi! link LspDiagnosticsDefaultWarning DiagnosticWarn
  hi! link LspDiagnosticsDefaultInformation DiagnosticInfo
  hi! link LspDiagnosticsDefaultHint DiagnosticHint
  hi! link LspDiagnosticsVirtualTextError DiagnosticVirtualTextError
  hi! link LspDiagnosticsVirtualTextWarning DiagnosticVirtualTextWarn
  hi! link LspDiagnosticsVirtualTextInformation DiagnosticVirtualTextInfo
  hi! link LspDiagnosticsVirtualTextHint DiagnosticVirtualTextHint
  hi! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
  hi! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn
  hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
  hi! link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint
  hi! link LspDiagnosticsSignError DiagnosticSignError
  hi! link LspDiagnosticsSignWarning DiagnosticSignWarn
  hi! link LspDiagnosticsSignInformation DiagnosticSignInfo
  hi! link LspDiagnosticsSignHint DiagnosticSignHint
  hi! link LspReferenceText CurrentWord
  hi! link LspReferenceRead CurrentWord
  hi! link LspReferenceWrite CurrentWord
  hi! link LspCodeLens VirtualTextInfo
  hi! link LspCodeLensSeparator VirtualTextHint
  hi! link LspSignatureActiveParameter Search
  hi! link healthError AdachiRedDark
  hi! link healthSuccess AdachiGreenDark
  hi! link healthWarning AdachiYellowDark
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:adachi_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd AdachiGreenSign
hi! link GitGutterChange AdachiAquaSign
hi! link GitGutterDelete AdachiRedSign
hi! link GitGutterChangeDelete AdachiAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile AdachiGreen
hi! link gitcommitDiscardedFile AdachiRed

" }}}
" Signify: {{{

hi! link SignifySignAdd AdachiGreenSign
hi! link SignifySignChange AdachiAquaSign
hi! link SignifySignDelete AdachiRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign AdachiRedSign
hi! link SyntasticWarningSign AdachiYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   AdachiBlueSign
hi! link SignatureMarkerText AdachiPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl AdachiBlueSign
hi! link ShowMarksHLu AdachiBlueSign
hi! link ShowMarksHLo AdachiBlueSign
hi! link ShowMarksHLm AdachiBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch AdachiYellow
hi! link CtrlPNoEntries AdachiRed
hi! link CtrlPPrtBase AdachiBg2
hi! link CtrlPPrtCursor AdachiBlue
hi! link CtrlPLinePre AdachiBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket AdachiFg3
hi! link StartifyFile AdachiFg1
hi! link StartifyNumber AdachiBlue
hi! link StartifyPath AdachiGray
hi! link StartifySlash AdachiGray
hi! link StartifySection AdachiYellow
hi! link StartifySpecial AdachiBg2
hi! link StartifyHeader AdachiOrange
hi! link StartifyFooter AdachiBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign AdachiRedSign
hi! link ALEWarningSign AdachiYellowSign
hi! link ALEInfoSign AdachiBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail AdachiAqua
hi! link DirvishArg AdachiYellow

" }}}
" Netrw: {{{

hi! link netrwDir AdachiAqua
hi! link netrwClassify AdachiAqua
hi! link netrwLink AdachiGray
hi! link netrwSymLink AdachiFg1
hi! link netrwExe AdachiYellow
hi! link netrwComment AdachiGray
hi! link netrwList AdachiBlue
hi! link netrwHelpCmd AdachiAqua
hi! link netrwCmdSep AdachiFg3
hi! link netrwVersion AdachiGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir AdachiAqua
hi! link NERDTreeDirSlash AdachiAqua

hi! link NERDTreeOpenable AdachiOrange
hi! link NERDTreeClosable AdachiOrange

hi! link NERDTreeFile AdachiFg1
hi! link NERDTreeExecFile AdachiYellow

hi! link NERDTreeUp AdachiGray
hi! link NERDTreeCWD AdachiGreen
hi! link NERDTreeHelp AdachiFg1

hi! link NERDTreeToggleOn AdachiGreen
hi! link NERDTreeToggleOff AdachiRed

" }}}
" Telescope: {{{

hi! link TelescopeMatching AdachiAqua
hi! link TelescopeMultiSelection TelescopeMatching
hi! link TelescopeSelection CursorLine
hi! link TelescopePreviewLine TelescopeSelection

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign AdachiRedSign
hi! link CocWarningSign AdachiOrangeSign
hi! link CocInfoSign AdachiYellowSign
hi! link CocHintSign AdachiBlueSign
hi! link CocErrorFloat AdachiRed
hi! link CocWarningFloat AdachiOrange
hi! link CocInfoFloat AdachiYellow
hi! link CocHintFloat AdachiBlue
hi! link CocDiagnosticsError AdachiRed
hi! link CocDiagnosticsWarning AdachiOrange
hi! link CocDiagnosticsInfo AdachiYellow
hi! link CocDiagnosticsHint AdachiBlue

hi! link CocSelectedText AdachiRed
hi! link CocCodeLens AdachiGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded AdachiGreen
hi! link diffRemoved AdachiRed
hi! link diffChanged AdachiAqua

hi! link diffFile AdachiOrange
hi! link diffNewFile AdachiYellow

hi! link diffLine AdachiBlue

" }}}
" Html: {{{

hi! link htmlTag AdachiBlue
hi! link htmlEndTag AdachiBlue

hi! link htmlTagName AdachiAquaBold
hi! link htmlArg AdachiAqua

hi! link htmlScriptTag AdachiPurple
hi! link htmlTagN AdachiFg1
hi! link htmlSpecialTagName AdachiAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar AdachiOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:none, s:none, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag AdachiBlue
hi! link xmlEndTag AdachiBlue
hi! link xmlTagName AdachiBlue
hi! link xmlEqual AdachiBlue
hi! link docbkKeyword AdachiAquaBold

hi! link xmlDocTypeDecl AdachiGray
hi! link xmlDocTypeKeyword AdachiPurple
hi! link xmlCdataStart AdachiGray
hi! link xmlCdataCdata AdachiPurple
hi! link dtdFunction AdachiGray
hi! link dtdTagName AdachiPurple

hi! link xmlAttrib AdachiAqua
hi! link xmlProcessingDelim AdachiGray
hi! link dtdParamEntityPunct AdachiGray
hi! link dtdParamEntityDPunct AdachiGray
hi! link xmlAttribPunct AdachiGray

hi! link xmlEntity AdachiOrange
hi! link xmlEntityPunct AdachiOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation AdachiOrange
hi! link vimBracket AdachiOrange
hi! link vimMapModKey AdachiOrange
hi! link vimFuncSID AdachiFg3
hi! link vimSetSep AdachiFg3
hi! link vimSep AdachiFg3
hi! link vimContinue AdachiFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword AdachiBlue
hi! link clojureCond AdachiOrange
hi! link clojureSpecial AdachiOrange
hi! link clojureDefine AdachiOrange

hi! link clojureFunc AdachiYellow
hi! link clojureRepeat AdachiYellow
hi! link clojureCharacter AdachiAqua
hi! link clojureStringEscape AdachiAqua
hi! link clojureException AdachiRed

hi! link clojureRegexp AdachiAqua
hi! link clojureRegexpEscape AdachiAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen AdachiFg3
hi! link clojureAnonArg AdachiYellow
hi! link clojureVariable AdachiBlue
hi! link clojureMacro AdachiOrange

hi! link clojureMeta AdachiYellow
hi! link clojureDeref AdachiYellow
hi! link clojureQuote AdachiYellow
hi! link clojureUnquote AdachiYellow

" }}}
" C: {{{

hi! link cOperator AdachiPurple
hi! link cStructure AdachiOrange

" }}}
" Python: {{{

hi! link pythonBuiltin AdachiOrange
hi! link pythonBuiltinObj AdachiOrange
hi! link pythonBuiltinFunc AdachiOrange
hi! link pythonFunction AdachiAqua
hi! link pythonDecorator AdachiRed
hi! link pythonInclude AdachiBlue
hi! link pythonImport AdachiBlue
hi! link pythonRun AdachiBlue
hi! link pythonCoding AdachiBlue
hi! link pythonOperator AdachiRed
hi! link pythonException AdachiRed
hi! link pythonExceptions AdachiPurple
hi! link pythonBoolean AdachiPurple
hi! link pythonDot AdachiFg3
hi! link pythonConditional AdachiRed
hi! link pythonRepeat AdachiRed
hi! link pythonDottedName AdachiGreenBold

" }}}
" CSS: {{{

hi! link cssBraces AdachiBlue
hi! link cssFunctionName AdachiYellow
hi! link cssIdentifier AdachiOrange
hi! link cssClassName AdachiGreen
hi! link cssColor AdachiBlue
hi! link cssSelectorOp AdachiBlue
hi! link cssSelectorOp2 AdachiBlue
hi! link cssImportant AdachiGreen
hi! link cssVendor AdachiFg1

hi! link cssTextProp AdachiAqua
hi! link cssAnimationProp AdachiAqua
hi! link cssUIProp AdachiYellow
hi! link cssTransformProp AdachiAqua
hi! link cssTransitionProp AdachiAqua
hi! link cssPrintProp AdachiAqua
hi! link cssPositioningProp AdachiYellow
hi! link cssBoxProp AdachiAqua
hi! link cssFontDescriptorProp AdachiAqua
hi! link cssFlexibleBoxProp AdachiAqua
hi! link cssBorderOutlineProp AdachiAqua
hi! link cssBackgroundProp AdachiAqua
hi! link cssMarginProp AdachiAqua
hi! link cssListProp AdachiAqua
hi! link cssTableProp AdachiAqua
hi! link cssFontProp AdachiAqua
hi! link cssPaddingProp AdachiAqua
hi! link cssDimensionProp AdachiAqua
hi! link cssRenderProp AdachiAqua
hi! link cssColorProp AdachiAqua
hi! link cssGeneratedContentProp AdachiAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces AdachiFg1
hi! link javaScriptFunction AdachiAqua
hi! link javaScriptIdentifier AdachiRed
hi! link javaScriptMember AdachiBlue
hi! link javaScriptNumber AdachiPurple
hi! link javaScriptNull AdachiPurple
hi! link javaScriptParens AdachiFg3

" }}}
" YAJS: {{{

hi! link javascriptImport AdachiAqua
hi! link javascriptExport AdachiAqua
hi! link javascriptClassKeyword AdachiAqua
hi! link javascriptClassExtends AdachiAqua
hi! link javascriptDefault AdachiAqua

hi! link javascriptClassName AdachiYellow
hi! link javascriptClassSuperName AdachiYellow
hi! link javascriptGlobal AdachiYellow

hi! link javascriptEndColons AdachiFg1
hi! link javascriptFuncArg AdachiFg1
hi! link javascriptGlobalMethod AdachiFg1
hi! link javascriptNodeGlobal AdachiFg1
hi! link javascriptBOMWindowProp AdachiFg1
hi! link javascriptArrayMethod AdachiFg1
hi! link javascriptArrayStaticMethod AdachiFg1
hi! link javascriptCacheMethod AdachiFg1
hi! link javascriptDateMethod AdachiFg1
hi! link javascriptMathStaticMethod AdachiFg1

" hi! link javascriptProp AdachiFg1
hi! link javascriptURLUtilsProp AdachiFg1
hi! link javascriptBOMNavigatorProp AdachiFg1
hi! link javascriptDOMDocMethod AdachiFg1
hi! link javascriptDOMDocProp AdachiFg1
hi! link javascriptBOMLocationMethod AdachiFg1
hi! link javascriptBOMWindowMethod AdachiFg1
hi! link javascriptStringMethod AdachiFg1

hi! link javascriptVariable AdachiOrange
" hi! link javascriptVariable AdachiRed
" hi! link javascriptIdentifier AdachiOrange
" hi! link javascriptClassSuper AdachiOrange
hi! link javascriptIdentifier AdachiOrange
hi! link javascriptClassSuper AdachiOrange

" hi! link javascriptFuncKeyword AdachiOrange
" hi! link javascriptAsyncFunc AdachiOrange
hi! link javascriptFuncKeyword AdachiAqua
hi! link javascriptAsyncFunc AdachiAqua
hi! link javascriptClassStatic AdachiOrange

hi! link javascriptOperator AdachiRed
hi! link javascriptForOperator AdachiRed
hi! link javascriptYield AdachiRed
hi! link javascriptExceptions AdachiRed
hi! link javascriptMessage AdachiRed

hi! link javascriptTemplateSB AdachiAqua
hi! link javascriptTemplateSubstitution AdachiFg1

" hi! link javascriptLabel AdachiBlue
" hi! link javascriptObjectLabel AdachiBlue
" hi! link javascriptPropertyName AdachiBlue
hi! link javascriptLabel AdachiFg1
hi! link javascriptObjectLabel AdachiFg1
hi! link javascriptPropertyName AdachiFg1

hi! link javascriptLogicSymbols AdachiFg1
hi! link javascriptArrowFunc AdachiYellow

hi! link javascriptDocParamName AdachiFg4
hi! link javascriptDocTags AdachiFg4
hi! link javascriptDocNotation AdachiFg4
hi! link javascriptDocParamType AdachiFg4
hi! link javascriptDocNamedParamType AdachiFg4

hi! link javascriptBrackets AdachiFg1
hi! link javascriptDOMElemAttrs AdachiFg1
hi! link javascriptDOMEventMethod AdachiFg1
hi! link javascriptDOMNodeMethod AdachiFg1
hi! link javascriptDOMStorageMethod AdachiFg1
hi! link javascriptHeadersMethod AdachiFg1

hi! link javascriptAsyncFuncKeyword AdachiRed
hi! link javascriptAwaitFuncKeyword AdachiRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword AdachiAqua
hi! link jsExtendsKeyword AdachiAqua
hi! link jsExportDefault AdachiAqua
hi! link jsTemplateBraces AdachiAqua
hi! link jsGlobalNodeObjects AdachiFg1
hi! link jsGlobalObjects AdachiFg1
hi! link jsFunction AdachiAqua
hi! link jsFuncParens AdachiFg3
hi! link jsParens AdachiFg3
hi! link jsNull AdachiPurple
hi! link jsUndefined AdachiPurple
hi! link jsClassDefinition AdachiYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved AdachiAqua
hi! link typeScriptLabel AdachiAqua
hi! link typeScriptFuncKeyword AdachiAqua
hi! link typeScriptIdentifier AdachiOrange
hi! link typeScriptBraces AdachiFg1
hi! link typeScriptEndColons AdachiFg1
hi! link typeScriptDOMObjects AdachiFg1
hi! link typeScriptAjaxMethods AdachiFg1
hi! link typeScriptLogicSymbols AdachiFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects AdachiFg1
hi! link typeScriptParens AdachiFg3
hi! link typeScriptOpSymbols AdachiFg3
hi! link typeScriptHtmlElemProperties AdachiFg1
hi! link typeScriptNull AdachiPurple
hi! link typeScriptInterpolationDelimiter AdachiAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword AdachiAqua
hi! link purescriptModuleName AdachiFg1
hi! link purescriptWhere AdachiAqua
hi! link purescriptDelimiter AdachiFg4
hi! link purescriptType AdachiFg1
hi! link purescriptImportKeyword AdachiAqua
hi! link purescriptHidingKeyword AdachiAqua
hi! link purescriptAsKeyword AdachiAqua
hi! link purescriptStructure AdachiAqua
hi! link purescriptOperator AdachiBlue

hi! link purescriptTypeVar AdachiFg1
hi! link purescriptConstructor AdachiFg1
hi! link purescriptFunction AdachiFg1
hi! link purescriptConditional AdachiOrange
hi! link purescriptBacktick AdachiOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp AdachiFg3
hi! link coffeeSpecialOp AdachiFg3
hi! link coffeeCurly AdachiOrange
hi! link coffeeParen AdachiFg3
hi! link coffeeBracket AdachiOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter AdachiGreen
hi! link rubyInterpolationDelimiter AdachiAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier AdachiRed
hi! link objcDirective AdachiBlue

" }}}
" Go: {{{

hi! link goDirective AdachiAqua
hi! link goConstants AdachiPurple
hi! link goDeclaration AdachiRed
hi! link goDeclType AdachiBlue
hi! link goBuiltins AdachiOrange

" }}}
" Lua: {{{

hi! link luaIn AdachiRed
hi! link luaFunction AdachiAqua
hi! link luaTable AdachiOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp AdachiFg3
hi! link moonExtendedOp AdachiFg3
hi! link moonFunction AdachiFg3
hi! link moonObject AdachiYellow

" }}}
" Java: {{{

hi! link javaAnnotation AdachiBlue
hi! link javaDocTags AdachiAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen AdachiFg3
hi! link javaParen1 AdachiFg3
hi! link javaParen2 AdachiFg3
hi! link javaParen3 AdachiFg3
hi! link javaParen4 AdachiFg3
hi! link javaParen5 AdachiFg3
hi! link javaOperator AdachiOrange

hi! link javaVarArg AdachiGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter AdachiGreen
hi! link elixirInterpolationDelimiter AdachiAqua

hi! link elixirModuleDeclaration AdachiYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition AdachiFg1
hi! link scalaCaseFollowing AdachiFg1
hi! link scalaCapitalWord AdachiFg1
hi! link scalaTypeExtension AdachiFg1

hi! link scalaKeyword AdachiRed
hi! link scalaKeywordModifier AdachiRed

hi! link scalaSpecial AdachiAqua
hi! link scalaOperator AdachiFg1

hi! link scalaTypeDeclaration AdachiYellow
hi! link scalaTypeTypePostDeclaration AdachiYellow

hi! link scalaInstanceDeclaration AdachiFg1
hi! link scalaInterpolation AdachiAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 AdachiGreenBold
hi! link markdownH2 AdachiGreenBold
hi! link markdownH3 AdachiYellowBold
hi! link markdownH4 AdachiYellowBold
hi! link markdownH5 AdachiYellow
hi! link markdownH6 AdachiYellow

hi! link markdownCode AdachiAqua
hi! link markdownCodeBlock AdachiAqua
hi! link markdownCodeDelimiter AdachiAqua

hi! link markdownBlockquote AdachiGray
hi! link markdownListMarker AdachiGray
hi! link markdownOrderedListMarker AdachiGray
hi! link markdownRule AdachiGray
hi! link markdownHeadingRule AdachiGray

hi! link markdownUrlDelimiter AdachiFg3
hi! link markdownLinkDelimiter AdachiFg3
hi! link markdownLinkTextDelimiter AdachiFg3

hi! link markdownHeadingDelimiter AdachiOrange
hi! link markdownUrl AdachiPurple
hi! link markdownUrlTitleDelimiter AdachiGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType AdachiYellow
" hi! link haskellOperators AdachiOrange
" hi! link haskellConditional AdachiAqua
" hi! link haskellLet AdachiOrange
"
hi! link haskellType AdachiFg1
hi! link haskellIdentifier AdachiFg1
hi! link haskellSeparator AdachiFg1
hi! link haskellDelimiter AdachiFg4
hi! link haskellOperators AdachiBlue
"
hi! link haskellBacktick AdachiOrange
hi! link haskellStatement AdachiOrange
hi! link haskellConditional AdachiOrange

hi! link haskellLet AdachiAqua
hi! link haskellDefault AdachiAqua
hi! link haskellWhere AdachiAqua
hi! link haskellBottom AdachiAqua
hi! link haskellBlockKeywords AdachiAqua
hi! link haskellImportKeywords AdachiAqua
hi! link haskellDeclKeyword AdachiAqua
hi! link haskellDeriving AdachiAqua
hi! link haskellAssocType AdachiAqua

hi! link haskellNumber AdachiPurple
hi! link haskellPragma AdachiPurple

hi! link haskellString AdachiGreen
hi! link haskellChar AdachiGreen

" }}}
" Json: {{{

hi! link jsonKeyword AdachiGreen
hi! link jsonQuote AdachiGreen
hi! link jsonBraces AdachiFg1
hi! link jsonString AdachiFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! AdachiHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! AdachiHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
