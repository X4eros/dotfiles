 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#12131a',
    base01 = '#1e1f27',
    base02 = '#282932',
    base03 = '#8e90a0',
    base04 = '#c4c5d6',
    base05 = '#e2e1ec',
    base06 = '#e2e1ec',
    base07 = '#e2e1ec',
    base08 = '#ffb4ab',
    base09 = '#f4aeff',
    base0A = '#b9c4fc',
    base0B = '#b8c3ff',
    base0C = '#f4aeff',
    base0D = '#b8c3ff',
    base0E = '#b9c4fc',
    base0F = '#dde1ff',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e2e1ec',          bg = '#12131a' })
  hi('TelescopeBorder',         { fg = '#8e90a0',             bg = '#12131a' })
  hi('TelescopePromptNormal',   { fg = '#e2e1ec',          bg = '#12131a' })
  hi('TelescopePromptBorder',   { fg = '#8e90a0',             bg = '#12131a' })
  hi('TelescopePromptPrefix',   { fg = '#b8c3ff',             bg = '#12131a' })
  hi('TelescopePromptCounter',  { fg = '#c4c5d6',  bg = '#12131a' })
  hi('TelescopePromptTitle',    { fg = '#12131a',             bg = '#b8c3ff' })
  hi('TelescopePreviewTitle',   { fg = '#12131a',             bg = '#b9c4fc' })
  hi('TelescopeResultsTitle',   { fg = '#12131a',             bg = '#f4aeff' })
  hi('TelescopeSelection',      { fg = '#e2e1ec',          bg = '#282932' })
  hi('TelescopeSelectionCaret', { fg = '#b8c3ff',             bg = '#282932' })
  hi('TelescopeMatching',       { fg = '#b8c3ff',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e2e1ec',          bg = '#12131a' })
  hi('MiniPickBorder',         { fg = '#8e90a0',             bg = '#12131a' })
  hi('MiniPickPrompt',   { fg = '#e2e1ec',          bg = '#12131a' })
  hi('MiniPickPromptPrefix',   { fg = '#b8c3ff',             bg = '#12131a' })
  hi('MiniPickBorderText',    { fg = '#12131a',             bg = '#b8c3ff' })
  hi('MiniPickMatchCurrent',      { fg = '#e2e1ec',          bg = '#282932' })
  hi('MiniPickPromptCaret', { fg = '#b8c3ff',             bg = '#282932' })
  hi('MiniPickMatchRanges',       { fg = '#b8c3ff',             bold = true })
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
