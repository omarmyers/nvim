return {
  {
    'akinsho/bufferline.nvim',
    config = function()
      local function get_theme_highlights()
        local colorscheme = vim.g.colors_name
        if colorscheme and colorscheme:find('catppuccin') then
          local catppuccin = require('catppuccin')
          return catppuccin.bufferline and catppuccin.bufferline or {}
        else
          -- Use default highlights for other themes
          return {}
        end
      end

      require('bufferline').setup {
        highlights = get_theme_highlights(),
        options = {
          diagnostics = 'nvim_lsp',
          show_buffer_close_icons = false,
          numbers = 'ordinal',
        },
      }

      -- Auto-update bufferline highlights when colorscheme changes
      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
          require('bufferline').setup {
            highlights = get_theme_highlights(),
            options = {
              diagnostics = 'nvim_lsp',
              show_buffer_close_icons = false,
              numbers = 'ordinal',
            },
          }
        end,
      })
    end,
  },
}
