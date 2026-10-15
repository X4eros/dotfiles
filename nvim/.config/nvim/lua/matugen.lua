 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#15121a',
    base01 = '#211e26',
    base02 = '#2c2931',
    base03 = '#958e9e',
    base04 = '#cbc3d5',
    base05 = '#e7e0eb',
    base06 = '#e7e0eb',
    base07 = '#e7e0eb',
    base08 = '#ffb4ab',
    base09 = '#ffade3',
    base0A = '#d0bdf6',
    base0B = '#d1bcff',
    base0C = '#ffade3',
    base0D = '#d1bcff',
    base0E = '#d0bdf6',
    base0F = '#eaddff',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e7e0eb',          bg = '#15121a' })
  hi('TelescopeBorder',         { fg = '#958e9e',             bg = '#15121a' })
  hi('TelescopePromptNormal',   { fg = '#e7e0eb',          bg = '#15121a' })
  hi('TelescopePromptBorder',   { fg = '#958e9e',             bg = '#15121a' })
  hi('TelescopePromptPrefix',   { fg = '#d1bcff',             bg = '#15121a' })
  hi('TelescopePromptCounter',  { fg = '#cbc3d5',  bg = '#15121a' })
  hi('TelescopePromptTitle',    { fg = '#15121a',             bg = '#d1bcff' })
  hi('TelescopePreviewTitle',   { fg = '#15121a',             bg = '#d0bdf6' })
  hi('TelescopeResultsTitle',   { fg = '#15121a',             bg = '#ffade3' })
  hi('TelescopeSelection',      { fg = '#e7e0eb',          bg = '#2c2931' })
  hi('TelescopeSelectionCaret', { fg = '#d1bcff',             bg = '#2c2931' })
  hi('TelescopeMatching',       { fg = '#d1bcff',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e7e0eb',          bg = '#15121a' })
  hi('MiniPickBorder',         { fg = '#958e9e',             bg = '#15121a' })
  hi('MiniPickPrompt',   { fg = '#e7e0eb',          bg = '#15121a' })
  hi('MiniPickPromptPrefix',   { fg = '#d1bcff',             bg = '#15121a' })
  hi('MiniPickBorderText',    { fg = '#15121a',             bg = '#d1bcff' })
  hi('MiniPickMatchCurrent',      { fg = '#e7e0eb',          bg = '#2c2931' })
  hi('MiniPickPromptCaret', { fg = '#d1bcff',             bg = '#2c2931' })
  hi('MiniPickMatchRanges',       { fg = '#d1bcff',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
