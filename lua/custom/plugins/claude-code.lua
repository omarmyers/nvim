return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {
    terminal_cmd = '~/.claude/local/claude', -- Point to local installation
    terminal = {
      split_side = 'left',
      split_width_percentage = 0.3,
    },
  },
  keys = {
    { '<leader>a', nil, desc = 'Claude Code' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude', mode = { 'n', 'x' } },
    { '<leader>an', '<cmd>ClaudeCode<cr>', desc = 'New Claude' },
    { '<leader>ac', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { '<leader>at', '<cmd>ClaudeCodeAdd<cr>', desc = 'Add file', ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' } },
    { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  },
}
