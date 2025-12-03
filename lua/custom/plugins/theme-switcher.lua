return {
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        themes = {
          'tokyonight-moon',
          'tokyonight-night',
          'tokyonight-storm',
          'catppuccin-mocha',
          'catppuccin-macchiato',
          'cyberdream',
          'everforest',
          'nord',
          'oxocarbon',
          'rose-pine',
          'rose-pine-moon',
        },
        livePreview = true, -- Apply theme while picking. Default to true.
      }

      -- Keybinding
      vim.keymap.set('n', '<leader>ts', ':Themery<CR>', { desc = 'Theme Switcher' })
    end,
  },
}
