 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#141318',
    base01 = '#201f24',
    base02 = '#2a292f',
    base03 = '#928f9c',
    base04 = '#c9c4d2',
    base05 = '#e5e1e8',
    base06 = '#e5e1e8',
    base07 = '#e5e1e8',
    base08 = '#ffb4ab',
    base09 = '#ffade2',
    base0A = '#c8c2e6',
    base0B = '#c7bfff',
    base0C = '#ffade2',
    base0D = '#c7bfff',
    base0E = '#c8c2e6',
    base0F = '#e5deff',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e5e1e8',          bg = '#141318' })
  hi('TelescopeBorder',         { fg = '#928f9c',             bg = '#141318' })
  hi('TelescopePromptNormal',   { fg = '#e5e1e8',          bg = '#141318' })
  hi('TelescopePromptBorder',   { fg = '#928f9c',             bg = '#141318' })
  hi('TelescopePromptPrefix',   { fg = '#c7bfff',             bg = '#141318' })
  hi('TelescopePromptCounter',  { fg = '#c9c4d2',  bg = '#141318' })
  hi('TelescopePromptTitle',    { fg = '#141318',             bg = '#c7bfff' })
  hi('TelescopePreviewTitle',   { fg = '#141318',             bg = '#c8c2e6' })
  hi('TelescopeResultsTitle',   { fg = '#141318',             bg = '#ffade2' })
  hi('TelescopeSelection',      { fg = '#e5e1e8',          bg = '#2a292f' })
  hi('TelescopeSelectionCaret', { fg = '#c7bfff',             bg = '#2a292f' })
  hi('TelescopeMatching',       { fg = '#c7bfff',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e5e1e8',          bg = '#141318' })
  hi('MiniPickBorder',         { fg = '#928f9c',             bg = '#141318' })
  hi('MiniPickPrompt',   { fg = '#e5e1e8',          bg = '#141318' })
  hi('MiniPickPromptPrefix',   { fg = '#c7bfff',             bg = '#141318' })
  hi('MiniPickBorderText',    { fg = '#141318',             bg = '#c7bfff' })
  hi('MiniPickMatchCurrent',      { fg = '#e5e1e8',          bg = '#2a292f' })
  hi('MiniPickPromptCaret', { fg = '#c7bfff',             bg = '#2a292f' })
  hi('MiniPickMatchRanges',       { fg = '#c7bfff',             bold = true })
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
