-- return {
--   'greggh/claude-code.nvim',
--   dependencies = { 'nvim-lua/plenary.nvim' },
--   config = function()
--     require('claude-code').setup {
--       -- Window settings
--       window = {
--         -- split_ratio = 0.3,
--         position = 'vsplit',
--       },
--
--       -- Command settings
--       command = 'claude',
--
--       -- Command variants
--       command_variants = {
--         continue = '--continue',
--         verbose = '--verbose',
--         resume = '--resume',
--       },
--
--       -- File refresh settings
--       refresh = {
--         enabled = true,
--         updatetime = 100,
--         timer_interval = 1000,
--         show_notifications = true,
--       },
--
--       -- Keymaps
--       keymaps = {
--         toggle = {
--           normal = '<leader>cn', -- Normal mode keymap for toggling Claude Code
--           terminal = '<C-,>', -- Terminal mode keymap for toggling Claude Code
--           variants = {
--             continue = '<leader>cc', -- Normal mode keymap for Claude Code with continue flag
--             verbose = '<leader>cV', -- Normal mode keymap for Claude Code with verbose flag
--             resume = '<leader>cR', -- Normal mode keymap for Claude Code with resume flag
--           },
--         },
--       },
--     }
--   end,
--   -- Load the plugin when these commands are used
--   cmd = {
--     'ClaudeCode',
--     'ClaudeCodeContinue',
--     'ClaudeCodeVerbose',
--     'ClaudeCodeResume',
--   },
--   -- Load on these key mappings
--   keys = {
--     { '<leader>cn', desc = 'New Claude Code Session' },
--     { '<leader>cc', desc = 'Continue Claude Code Session' },
--     { '<leader>cV', desc = 'Claude Code Verbose' },
--     { '<leader>cR', desc = 'Resume Claude Code' },
--   },
-- }
local toggle_key = '<leader>cf'
return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {
    terminal_cmd = '~/.claude/local/claude', -- Point to local installation
    terminal = {
      -- ---@module "snacks"
      -- ---@type snacks.win.Config|{}
      -- snacks_win_opts = {
      --   position = 'float',
      --   width = 0.9,
      --   height = 0.9,
      --   keys = {
      --     claude_hide = {
      --       toggle_key,
      --       function(self)
      --         self:hide()
      --       end,
      --       mode = 't',
      --       desc = 'Hide',
      --     },
      --   },
      -- },
      split_side = 'left',
      split_width_percentage = 0.33,
    },
  },
  keys = {
    {
      toggle_key,
      '<cmd>ClaudeCodeFocus<cr>',
      desc = 'Focus Claude',
      mode = { 'n', 'x' },
    },
    { '<leader>cn', '<cmd>ClaudeCode<cr>', desc = 'New Claude' },
    { '<leader>cc', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>cr', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>cs', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    { '<leader>cb', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
  },
  -- config = true,
  -- keys = {
  --   -- Keymaps
  --   { '<leader>a', nil, desc = 'AI/Claude Code' },
  --   { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
  --   { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
  --   { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
  --   { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
  --   { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
  --   { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
  --   { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
  --   {
  --     '<leader>as',
  --     '<cmd>ClaudeCodeTreeAdd<cr>',
  --     desc = 'Add file',
  --     ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
  --   },
  --   -- Diff management
  --   { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
  --   { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  -- },
}
