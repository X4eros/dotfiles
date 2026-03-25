-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Open explorer on startup
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open snacks explorer on startup",
  callback = function()
    -- Ensure we are in a dashboard or empty buffer before opening
    if vim.fn.argc() == 0 then
      -- If you use the default Snacks Explorer:
      require("snacks").explorer()

      -- OR if you use neo-tree, uncomment the next line:
      -- vim.cmd("Neotree toggle")
    end
  end,
})
