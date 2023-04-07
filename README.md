Adachi is a colorscheme based on the [everforest colorscheme](https://github.com/sainnhe/everforest) and the [aquarium colorscheme](https://github.com/FrenzyExists/aquarium-vim).
Adachi is inspired by the [gruvboxed colorscheme](https://github.com/crispybaccoon/gruvboxed) and the [Nord colorscheme](https://www.nordtheme.com).

Adachi was designed as a cozy theme with pastel colors. Adachi was inspired by the colorfull images of [Adachi](https://en.wikipedia.org/wiki/Adachi,_Tokyo).
The main focus developing adachi is to keep colors easily distinguishable and pleasant for the eyes.

## Installation

using [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use 'crispybaccoon/adachi.nvim'
```

using [vim-plug](https://github.com/junegunn/vim-plug):
```Vim
Plug 'crispybaccoon/adachi.nvim'
```

## Configuration

```lua
require 'adachi'.setup {
    theme = "default", -- 'default' | 'light'
    override_terminal = true,
    contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
    contrast_light = 'medium', -- 'hard'|'medium'|'soft'
    emphasis = {
        general = { },
        comment = { },
        keyword = { },
        type    = { },
    },
    transparent_background = false,
    style = {
        cursorline = { soft = false, contrast_currentline = false },
        tabline = {}, -- {inverse: boolean, color: 'red'}
        cursor = {},
        search = {},
        signs = { contrast = false }, -- use `true` for a contrasting sign_column
    },
    overrides = { }, -- add custom overrides
    plugins = true, -- add highlighting for supported plugins
}
```

### Overrides

Overrides can take all options passed to `vim.api.nvim_set_hl()`.

```lua
require 'adachi'.setup {
    overrides = {
        'Normal' = { '#fddce3', '#1d2021' } -- { 'fg', 'bg', bold = bool, italic = bool, ... }
    },
}
```

## Features

- Lots of style-customization options (contrast, color invertion, italics usage etc.)
- Support for Treesitter highlighting.
- Support for transparent background.
- Supported plugins: [Airline][], [GitGutter][], [NERDTree][], [Telescope][].

  [airline]: https://github.com/bling/vim-airline
  [gitgutter]: https://github.com/airblade/vim-gitgutter
  [nerdtree]: https://github.com/scrooloose/nerdtree
  [telescope]: https://github.com/nvim-telescope/telescope

## License

[MIT/X11](https://en.wikipedia.org/wiki/MIT_License)
