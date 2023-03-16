local M = {}

---@alias langName 'Diff'

---@alias Languages { [langName]: HLGroups }

---@param theme AdachiTheme
---@return Languages
function M.higroups(theme)
  return {
    ['Diff'] = {
      diffAdded   = { link = 'AdachiGreen' },
      diffRemoved = { link = 'AdachiRed' },
      diffChanged = { link = 'AdachiAqua' },

      diffFile    = { link = 'AdachiOrange' },
      diffNewFile = { link = 'AdachiYellow' },

      diffLine    = { link = 'AdachiBlue' },
    },
    ['Html'] = {
      htmlTag            = { link = 'AdachiBlue' },
      htmlEndTag         = { link = 'AdachiBlue' },

      htmlTagName        = { link = 'AdachiAquaBold' },
      htmlArg            = { link = 'AdachiAqua' },

      htmlScriptTag      = { link = 'AdachiPurple' },
      htmlTagN           = { link = 'AdachiFg1' },
      htmlSpecialTagName = { link = 'AdachiAquaBold' },

      htmlLink           = { theme.fg4 },

      htmlSpecialChar    = { link = 'AdachiOrange' },

      htmlBold                = { bold      = theme.bold.general },
      htmlBoldUnderline       = { bold      = theme.bold.general,
                                  underline = theme.underline.general },
      htmlBoldItalic          = { bold      = theme.bold.general,
                                  italic    = theme.italic.general },
      htmlBoldUnderlineItalic = { bold      = theme.bold.general,
                                  underline = theme.underline.general,
                                  italic    = theme.italic.general },

      htmlUnderline       = { underline = theme.underline.general },
      htmlUnderlineItalic = { underline = theme.underline.general,
                              italic    = theme.italic.general },
      htmlItalic          = { italic    = theme.italic.general },
    },
    ['Xml'] = {
      xmlTag               = { link = 'AdachiBlue' },
      xmlEndTag            = { link = 'AdachiBlue' },
      xmlTagName           = { link = 'AdachiBlue' },
      xmlEqual             = { link = 'AdachiBlue' },
      docbkKeyword         = { link = 'AdachiAquaBold' },

      xmlDocTypeDecl       = { link = 'AdachiGray' },
      xmlDocTypeKeyword    = { link = 'AdachiPurple' },
      xmlCdataStart        = { link = 'AdachiGray' },
      xmlCdataCdata        = { link = 'AdachiPurple' },
      dtdFunction          = { link = 'AdachiGray' },
      dtdTagName           = { link = 'AdachiPurple' },

      xmlAttrib            = { link = 'AdachiAqua' },
      xmlProcessingDelim   = { link = 'AdachiGray' },
      dtdParamEntityPunct  = { link = 'AdachiGray' },
      dtdParamEntityDPunct = { link = 'AdachiGray' },
      xmlAttribPunct       = { link = 'AdachiGray' },

      xmlEntity            = { link = 'AdachiOrange' },
      xmlEntityPunct       = { link = 'AdachiOrange' },
    },
    ['Vim'] = {
      vimCommentTitle = { theme.fg4 },
      vimNotation  = { link = 'AdachiOrange' },
      vimBracket   = { link = 'Delimiter' },
      vimMapModKey = { link = 'AdachiOrange' },
      vimFuncSID   = { link = 'AdachiFg3' },
      vimSetSep    = { link = 'AdachiFg3' },
      vimSep       = { link = 'AdachiFg3' },
      vimContinue  = { link = 'AdachiFg3' },
    },
    ['Clojure'] = {
      clojureKeyword = { link = 'AdachiBlue' },
      clojureCond    = { link = 'AdachiOrange' },
      clojureSpecial = { link = 'AdachiOrange' },
      clojureDefine  = { link = 'AdachiOrange' },

      clojureFunc         = { link = 'AdachiYellow' },
      clojureRepeat       = { link = 'AdachiYellow' },
      clojureCharacter    = { link = 'AdachiAqua' },
      clojureStringEscape = { link = 'AdachiAqua' },
      clojureException    = { link = 'AdachiRed' },

      clojureRegexp           = { link = 'AdachiAqua' },
      clojureRegexpEscape     = { link = 'AdachiAqua' },
      clojureRegexpMod        = { link = 'clojureRegexpCharClass' },
      clojureRegexpQuantifier = { link = 'clojureRegexpCharClass' },
      clojureRegexpCharClass  = { theme.fg3 },

      clojureParen    = { link = 'AdachiFg3' },
      clojureAnonArg  = { link = 'AdachiYellow' },
      clojureVariable = { link = 'AdachiBlue' },
      clojureMacro    = { link = 'AdachiOrange' },

      clojureMeta    = { link = 'AdachiYellow' },
      clojureDeref   = { link = 'AdachiYellow' },
      clojureQuote   = { link = 'AdachiYellow' },
      clojureUnquote = { link = 'AdachiYellow' },
    },
    ['C'] = {
      cOperator = { link = 'Operator' },
      cStructure = { link = 'Keyword' },
    },
    ['Python'] = {
      pythonBuiltin     = { link = 'AdachiOrange' },
      pythonBuiltinObj  = { link = 'AdachiOrange' },
      pythonBuiltinFunc = { link = 'AdachiOrange' },
      pythonFunction    = { link = 'AdachiAqua' },
      pythonDecorator   = { link = 'AdachiRed' },
      pythonInclude     = { link = 'Include' },
      pythonImport      = { link = 'Keyword' },
      pythonRun         = { link = 'AdachiBlue' },
      pythonCoding      = { link = 'AdachiBlue' },
      pythonOperator    = { link = 'Operator' },
      pythonException   = { link = 'AdachiRed' },
      pythonExceptions  = { link = 'AdachiPurple' },
      pythonBoolean     = { link = 'AdachiPurple' },
      pythonDot         = { link = 'AdachiFg3' },
      pythonConditional = { link = 'AdachiRed' },
      pythonRepeat      = { link = 'AdachiRed' },
      pythonDottedName  = { link = 'AdachiGreenBold' },
    },
    ['CSS'] = {
      cssBraces       = { link = 'AdachiBlue' },
      cssFunctionName = { link = 'AdachiYellow' },
      cssIdentifier   = { link = 'AdachiOrange' },
      cssClassName    = { link = 'AdachiGreen' },
      cssColor        = { link = 'AdachiBlue' },
      cssSelectorOp   = { link = 'AdachiBlue' },
      cssSelectorOp2  = { link = 'AdachiBlue' },
      cssImportant    = { link = 'AdachiGreen' },
      cssVendor       = { link = 'AdachiFg1' },

      cssTextProp             = { link = 'AdachiAqua' },
      cssAnimationProp        = { link = 'AdachiAqua' },
      cssUIProp               = { link = 'AdachiYellow' },
      cssTransformProp        = { link = 'AdachiAqua' },
      cssTransitionProp       = { link = 'AdachiAqua' },
      cssPrintProp            = { link = 'AdachiAqua' },
      cssPositioningProp      = { link = 'AdachiYellow' },
      cssBoxProp              = { link = 'AdachiAqua' },
      cssFontDescriptorProp   = { link = 'AdachiAqua' },
      cssFlexibleBoxProp      = { link = 'AdachiAqua' },
      cssBorderOutlineProp    = { link = 'AdachiAqua' },
      cssBackgroundProp       = { link = 'AdachiAqua' },
      cssMarginProp           = { link = 'AdachiAqua' },
      cssListProp             = { link = 'AdachiAqua' },
      cssTableProp            = { link = 'AdachiAqua' },
      cssFontProp             = { link = 'AdachiAqua' },
      cssPaddingProp          = { link = 'AdachiAqua' },
      cssDimensionProp        = { link = 'AdachiAqua' },
      cssRenderProp           = { link = 'AdachiAqua' },
      cssColorProp            = { link = 'AdachiAqua' },
      cssGeneratedContentProp = { link = 'AdachiAqua' },
    },
    ['JavaScript'] = {
      javaScriptBraces     = { link = 'AdachiFg1' },
      javaScriptFunction   = { link = 'AdachiAqua' },
      javaScriptIdentifier = { link = 'AdachiRed' },
      javaScriptMember     = { link = 'AdachiBlue' },
      javaScriptNumber     = { link = 'AdachiPurple' },
      javaScriptNull       = { link = 'AdachiPurple' },
      javaScriptParens     = { link = 'AdachiFg3' },
    },
    ['Javascript'] = {
      javascriptImport       = { link = 'AdachiAqua' },
      javascriptExport       = { link = 'AdachiAqua' },
      javascriptClassKeyword = { link = 'AdachiAqua' },
      javascriptClassExtends = { link = 'AdachiAqua' },
      javascriptDefault      = { link = 'AdachiAqua' },

      javascriptClassName      = { link = 'AdachiYellow' },
      javascriptClassSuperName = { link = 'AdachiYellow' },
      javascriptGlobal         = { link = 'AdachiYellow' },

      javascriptEndColons         = { link = 'AdachiFg1' },
      javascriptFuncArg           = { link = 'AdachiFg1' },
      javascriptGlobalMethod      = { link = 'AdachiFg1' },
      javascriptNodeGlobal        = { link = 'AdachiFg1' },
      javascriptBOMWindowProp     = { link = 'AdachiFg1' },
      javascriptArrayMethod       = { link = 'AdachiFg1' },
      javascriptArrayStaticMethod = { link = 'AdachiFg1' },
      javascriptCacheMethod       = { link = 'AdachiFg1' },
      javascriptDateMethod        = { link = 'AdachiFg1' },
      javascriptMathStaticMethod  = { link = 'AdachiFg1' },

      javascriptProp              = { link = 'AdachiFg1' },
      javascriptURLUtilsProp      = { link = 'AdachiFg1' },
      javascriptBOMNavigatorProp  = { link = 'AdachiFg1' },
      javascriptDOMDocMethod      = { link = 'AdachiFg1' },
      javascriptDOMDocProp        = { link = 'AdachiFg1' },
      javascriptBOMLocationMethod = { link = 'AdachiFg1' },
      javascriptBOMWindowMethod   = { link = 'AdachiFg1' },
      javascriptStringMethod      = { link = 'AdachiFg1' },

      javascriptVariable   = { link = 'AdachiOrange' },
      javascriptIdentifier = { link = 'AdachiOrange' },
      javascriptClassSuper = { link = 'AdachiOrange' },

      javascriptFuncKeyword = { link = 'AdachiAqua' },
      javascriptAsyncFunc   = { link = 'AdachiAqua' },
      javascriptClassStatic = { link = 'AdachiOrange' },

      javascriptOperator    = { link = 'AdachiRed' },
      javascriptForOperator = { link = 'AdachiRed' },
      javascriptYield       = { link = 'AdachiRed' },
      javascriptExceptions  = { link = 'AdachiRed' },
      javascriptMessage     = { link = 'AdachiRed' },

      javascriptTemplateSB           = { link = 'AdachiAqua' },
      javascriptTemplateSubstitution = { link = 'AdachiFg1' },

      javascriptLabel        = { link = 'AdachiFg1' },
      javascriptObjectLabel  = { link = 'AdachiFg1' },
      javascriptPropertyName = { link = 'AdachiFg1' },

      javascriptLogicSymbols = { link = 'AdachiFg1' },
      javascriptArrowFunc    = { link = 'AdachiYellow' },

      javascriptDocParamName      = { link = 'AdachiFg4' },
      javascriptDocTags           = { link = 'AdachiFg4' },
      javascriptDocNotation       = { link = 'AdachiFg4' },
      javascriptDocParamType      = { link = 'AdachiFg4' },
      javascriptDocNamedParamType = { link = 'AdachiFg4' },

      javascriptBrackets         = { link = 'Delimiter' },
      javascriptDOMElemAttrs     = { link = 'AdachiFg1' },
      javascriptDOMEventMethod   = { link = 'AdachiFg1' },
      javascriptDOMNodeMethod    = { link = 'AdachiFg1' },
      javascriptDOMStorageMethod = { link = 'AdachiFg1' },
      javascriptHeadersMethod    = { link = 'AdachiFg1' },

      javascriptAsyncFuncKeyword = { link = 'AdachiPurple' },
      javascriptAwaitFuncKeyword = { link = 'AdachiPurple' },
    },
    ['js'] = {
      jsClassKeyword      = { link = 'AdachiAqua' },
      jsExtendsKeyword    = { link = 'AdachiAqua' },
      jsExportDefault     = { link = 'AdachiAqua' },
      jsTemplateBraces    = { link = 'AdachiAqua' },
      jsGlobalNodeObjects = { link = 'AdachiFg1' },
      jsGlobalObjects     = { link = 'AdachiFg1' },
      jsFunction          = { link = 'AdachiAqua' },
      jsFuncParens        = { link = 'AdachiFg3' },
      jsParens            = { link = 'AdachiFg3' },
      jsNull              = { link = 'AdachiPurple' },
      jsUndefined         = { link = 'AdachiPurple' },
      jsClassDefinition   = { link = 'AdachiYellow' },
    },
    ['TypeScript'] = {
      typeScriptReserved     = { link = 'AdachiAqua' },
      typeScriptLabel        = { link = 'AdachiAqua' },
      typeScriptFuncKeyword  = { link = 'AdachiAqua' },
      typeScriptIdentifier   = { link = 'AdachiOrange' },
      typeScriptBraces       = { link = 'AdachiFg1' },
      typeScriptEndColons    = { link = 'AdachiFg1' },
      typeScriptDOMObjects   = { link = 'AdachiFg1' },
      typeScriptAjaxMethods  = { link = 'AdachiFg1' },
      typeScriptLogicSymbols = { link = 'AdachiFg1' },

      typeScriptDocSeeTag = { link = 'Comment' },
      typeScriptDocParam  = { link = 'Comment' },
      typeScriptDocTags   = { link = 'vimCommentTitle' },

      typeScriptParens = { link = 'AdachiFg3' },
      typeScriptNull   = { link = 'AdachiPurple' },

      typeScriptOpSymbols              = { link = 'AdachiFg3' },
      typeScriptGlobalObjects          = { link = 'AdachiFg1' },
      typeScriptHtmlElemProperties     = { link = 'AdachiFg1' },
      typeScriptInterpolationDelimiter = { link = 'AdachiAqua' },
    },
    ['PureScript'] = {
      purescriptWhere     = { link = 'AdachiAqua' },
      purescriptDelimiter = { link = 'AdachiFg4' },
      purescriptType      = { link = 'AdachiFg1' },
      purescriptTypeVar   = { link = 'AdachiFg1' },
      purescriptStructure = { link = 'AdachiAqua' },
      purescriptOperator  = { link = 'AdachiBlue' },

      purescriptImportKeyword = { link = 'AdachiAqua' },
      purescriptHidingKeyword = { link = 'AdachiAqua' },
      purescriptModuleKeyword = { link = 'AdachiAqua' },
      purescriptModuleName    = { link = 'AdachiFg1' },
      purescriptAsKeyword     = { link = 'AdachiAqua' },

      purescriptConstructor = { link = 'AdachiFg1' },
      purescriptFunction    = { link = 'AdachiFg1' },
      purescriptConditional = { link = 'AdachiOrange' },
      purescriptBacktick    = { link = 'AdachiOrange' },
    },
    ['Go'] = {
      goDirective   = { link = 'AdachiAqua' },
      goConstants   = { link = 'AdachiPurple' },
      goDeclaration = { link = 'AdachiRed' },
      goDeclType    = { link = 'AdachiBlue' },
      goBuiltins    = { link = 'AdachiOrange' },
    },
    ['Lua'] = {
      luaIn       = { link = 'AdachiRed' },
      luaFunction = { link = 'AdachiAqua' },
      luaTable    = { link = 'AdachiOrange' },
    },
    ['Java'] = {
      javaAnnotation   = { link = "AdachiBlue" },
      javaDocTags      = { link = "AdachiAqua" },
      javaCommentTitle = { link = "vimCommentTitle" },

      javaParen    = { link = "AdachiFg3" },
      javaParen1   = { link = "AdachiFg3" },
      javaParen2   = { link = "AdachiFg3" },
      javaParen3   = { link = "AdachiFg3" },
      javaParen4   = { link = "AdachiFg3" },
      javaParen5   = { link = "AdachiFg3" },
      javaOperator = { link = "AdachiOrange" },
      javaVarArg   = { link = "AdachiGreen" },
    },
    ['Scala'] = {
      scalaNameDefinition = { link = "AdachiFg1" },
      scalaCaseFollowing  = { link = "AdachiFg1" },
      scalaCapitalWord    = { link = "AdachiFg1" },
      scalaTypeExtension  = { link = "AdachiFg1" },

      scalaKeyword         = { link = "AdachiRed" },
      scalaKeywordModifier = { link = "AdachiRed" },

      scalaSpecial  = { link = "AdachiAqua" },
      scalaOperator = { link = "AdachiFg1" },

      scalaTypeDeclaration         = { link = "AdachiYellow" },
      scalaTypeTypePostDeclaration = { link = "AdachiYellow" },

      scalaInstanceDeclaration = { link = "AdachiFg1" },
      scalaInterpolation       = { link = "AdachiAqua" },
    },
    ['Markdown'] = {
      markdownItalic = { theme.fg3, italic = theme.italic.general },

      markdownH1 = { link = "AdachiGreenBold" },
      markdownH2 = { link = "AdachiGreenBold" },
      markdownH3 = { link = "AdachiYellowBold" },
      markdownH4 = { link = "AdachiYellowBold" },
      markdownH5 = { link = "AdachiYellow" },
      markdownH6 = { link = "AdachiYellow" },

      markdownCode          = { link = "AdachiAqua" },
      markdownCodeBlock     = { link = "AdachiAqua" },
      markdownCodeDelimiter = { link = "AdachiAqua" },

      markdownBlockquote        = { link = "AdachiGray" },
      markdownListMarker        = { link = "AdachiGray" },
      markdownOrderedListMarker = { link = "AdachiGray" },
      markdownRule              = { link = "AdachiGray" },
      markdownHeadingRule       = { link = "AdachiGray" },

      markdownUrlDelimiter      = { link = "AdachiFg3" },
      markdownLinkDelimiter     = { link = "AdachiFg3" },
      markdownLinkTextDelimiter = { link = "AdachiFg3" },

      markdownHeadingDelimiter  = { link = "AdachiOrange" },
      markdownUrl               = { link = "AdachiPurple" },
      markdownUrlTitleDelimiter = { link = "AdachiGreen" },

      markdownLinkText      = { theme.purple, underline = theme.underline.general },
      markdownIdDeclaration = { link = "markdownLinkText" },
    },
    ['Haskell'] = {
      haskellType       = { link = "AdachiFg1" },
      haskellIdentifier = { link = "AdachiFg1" },
      haskellSeparator  = { link = "AdachiFg1" },
      haskellDelimiter  = { link = "AdachiFg4" },
      haskellOperators  = { link = "AdachiBlue" },

      haskellBacktick    = { link = "AdachiOrange" },
      haskellStatement   = { link = "AdachiOrange" },
      haskellConditional = { link = "AdachiOrange" },

      haskellLet            = { link = "AdachiAqua" },
      haskellDefault        = { link = "AdachiAqua" },
      haskellWhere          = { link = "AdachiAqua" },
      haskellBottom         = { link = "AdachiAqua" },
      haskellBlockKeywords  = { link = "AdachiAqua" },
      haskellImportKeywords = { link = "AdachiAqua" },
      haskellDeclKeyword    = { link = "AdachiAqua" },
      haskellDeriving       = { link = "AdachiAqua" },
      haskellAssocType      = { link = "AdachiAqua" },

      haskellNumber = { link = "AdachiPurple" },
      haskellPragma = { link = "AdachiPurple" },

      haskellString = { link = "AdachiGreen" },
      haskellChar   = { link = "AdachiGreen" },
    },
    ['Json'] = {
      jsonKeyword = { link = "AdachiGreen" },
      jsonQuote   = { link = "AdachiGreen" },
      jsonBraces  = { link = "AdachiFg1" },
      jsonString  = { link = "AdachiFg1" },
    },
  }
end

-- s/\w*\!\s*link\s*\(\w*\)\s*\(\w*\)/\1 = { link = "\2" },

return M
