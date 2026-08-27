-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
  -- Add the base46 plugin
  {
      "AvengeMedia/base46",
        lazy = true,
        opts = {},
  },

  -- Configure LazyVim to load your base46/DMS colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dms", -- or "dms" / your custom DMS theme name
    },
  },
}
