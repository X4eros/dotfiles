return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- shows hidden files globally in pickers
        ignored = true, -- (optional) also show gitignored files
        sources = {
          files = {
            hidden = true,
          },
        },
      },
    },
  },
}
