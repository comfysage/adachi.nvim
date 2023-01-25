local M = {}

---@alias pluginName 'Telescope'|'GitGutter'|'NERDTree'

---@alias Plugins { [pluginName]: HLGroups }

---@type Plugins
M.plugins = {
  ['Telescope'] = {
    TelescopeMatching       = { link = 'Search' },
    TelescopeMultiSelection = { link = 'TelescopeMatching' },
    TelescopeSelection      = { link = 'CursorLine' },
    TelescopePreviewLine    = { link = 'TelescopeSelection' },
  },
  ['GitGutter'] = {
    GitGutterAdd          = { link = 'AdachiGreenSign' },
    GitGutterChange       = { link = 'AdachiAquaSign' },
    GitGutterDelete       = { link = 'AdachiRedSign' },
    GitGutterChangeDelete = { link = 'AdachiAquaSign' },
  },
  ['NERDTree'] = {
    NERDTreeDir       = { link = 'AdachiAqua' },
    NERDTreeDirSlash  = { link = 'AdachiAqua' },

    NERDTreeOpenable  = { link = 'AdachiOrange' },
    NERDTreeClosable  = { link = 'AdachiOrange' },

    NERDTreeFile      = { link = 'AdachiFg1' },
    NERDTreeExecFile  = { link = 'AdachiYellow' },

    NERDTreeUp        = { link = 'AdachiGray' },
    NERDTreeCWD       = { link = 'AdachiGreen' },
    NERDTreeHelp      = { link = 'AdachiFg1' },

    NERDTreeToggleOn  = { link = 'AdachiGreen' },
    NERDTreeToggleOff = { link = 'AdachiRed' },
  },
}

return M
