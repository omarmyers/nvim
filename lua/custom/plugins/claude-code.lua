return {
  'greggh/claude-code.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('claude-code').setup {
      -- Window settings
      window = {
        -- split_ratio = 0.3,
        position = 'vsplit',
      },

      -- Command settings
      command = 'claude',

      -- Command variants
      command_variants = {
        continue = '--continue',
        verbose = '--verbose',
        resume = '--resume',
      },

      -- File refresh settings
      refresh = {
        enabled = true,
        updatetime = 100,
        timer_interval = 1000,
        show_notifications = true,
      },

      -- Keymaps
      keymaps = {
        toggle = {
          normal = '<leader>cn', -- Normal mode keymap for toggling Claude Code
          terminal = '<C-,>', -- Terminal mode keymap for toggling Claude Code
          variants = {
            continue = '<leader>cc', -- Normal mode keymap for Claude Code with continue flag
            verbose = '<leader>cV', -- Normal mode keymap for Claude Code with verbose flag
            resume = '<leader>cR', -- Normal mode keymap for Claude Code with resume flag
          },
        },
      },
    }
  end,
  -- Load the plugin when these commands are used
  cmd = {
    'ClaudeCode',
    'ClaudeCodeContinue',
    'ClaudeCodeVerbose',
    'ClaudeCodeResume',
  },
  -- Load on these key mappings
  keys = {
    { '<leader>cn', desc = 'New Claude Code Session' },
    { '<leader>cc', desc = 'Continue Claude Code Session' },
    { '<leader>cV', desc = 'Claude Code Verbose' },
    { '<leader>cR', desc = 'Resume Claude Code' },
  },
}
