Adachi is a colorscheme based on the [gruvboxed colorscheme](https://github.com/crispybaccoon/gruvboxed) and the [Nord colorscheme](https://www.nordtheme.com).

Adachi was designed as a cozy theme with pastel colors. Adachi was inspired by the colorfull images of [Adachi](https://en.wikipedia.org/wiki/Adachi,_Tokyo). The main focus developing adachi is to keep colors easily distinguishable, contrast low and pleasant for the eyes.

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
    theme = "default",
    override_terminal = true,
    contrast_dark = 'medium',
    contrast_light = 'medium',
    comment = { italic = false, bold = false }, -- use { italic = true } for italic comments
    keyword = { italic = false, bold = false },
    transparent_background = false,
    inverse = { ['tabline'] = false, ['search'] = false, ['signs'] = false },
    overrides = { }, -- add custom overrides
    plugins = { 'Telescope' }, -- add highlighting for supported plugins
}
```

### Overrides

Overrides can take all options passed to `vim.api.nvim_set_hl()`.

```lua
require 'adachi'.setup {
    'Normal' = { '#fddce3', '#1d2021' } -- { 'fg', 'bg', bold = bool, italic = bool, ... }
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
