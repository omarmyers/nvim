return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local function get_theme_and_colors()
        local colorscheme = vim.g.colors_name
        
        if colorscheme and colorscheme:find('catppuccin') then
          local variant = colorscheme:match('catppuccin%-(%w+)') or 'mocha'
          local cp = require('catppuccin.palettes').get_palette(variant)
          return 'catppuccin', {
            bg = cp.mantle,
            fg = cp.text,
            red = cp.red,
            yellow = cp.yellow,
            green = cp.green,
            blue = cp.blue,
            magenta = cp.mauve,
            cyan = cp.teal,
            violet = cp.lavender,
            black = cp.crust,
            grey = cp.surface0,
          }
        else
          -- Use the theme name directly for other themes, with fallback colors
          return colorscheme or 'auto', {
            bg = '#1e1e2e',
            fg = '#cdd6f4',
            red = '#f38ba8',
            yellow = '#f9e2af',
            green = '#a6e3a1',
            blue = '#89b4fa',
            magenta = '#cba6f7',
            cyan = '#94e2d5',
            violet = '#b4befe',
            black = '#11111b',
            grey = '#313244',
          }
        end
      end

      local theme_name, colors = get_theme_and_colors()

      local lualine_theme = {
        normal = {
          a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
          b = { fg = colors.fg, bg = colors.grey },
          c = { fg = colors.fg, bg = colors.bg },
        },
        insert = {
          a = { fg = colors.black, bg = colors.green, gui = 'bold' },
        },
        visual = {
          a = { fg = colors.black, bg = colors.violet, gui = 'bold' },
        },
        replace = {
          a = { fg = colors.black, bg = colors.red, gui = 'bold' },
        },
        command = {
          a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
        },
        inactive = {
          a = { fg = colors.fg, bg = colors.bg },
          b = { fg = colors.fg, bg = colors.bg },
          c = { fg = colors.fg, bg = colors.bg },
        },
      }

      local function setup_lualine()
        local theme_name, colors = get_theme_and_colors()
        
        -- Use built-in theme if available, otherwise use custom theme
        local lualine_theme_option
        if theme_name == 'catppuccin' then
          lualine_theme_option = lualine_theme
        else
          -- Try to use built-in theme, fall back to auto
          lualine_theme_option = theme_name
        end

        require('lualine').setup {
          options = {
            theme = lualine_theme_option,
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          icons_enabled = true,
        },
        sections = {
          lualine_a = { { 'mode', right_padding = 1 } },
          lualine_b = {
            { 'branch', icon = '' },
            {
              'diff',
              symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
              diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.yellow },
                removed = { fg = colors.red },
              },
            },
          },
          lualine_c = {
            {
              function()
                local msg = ' No LSP'
                local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
                local clients = vim.lsp.get_clients()
                for _, client in ipairs(clients) do
                  local ft = client.config.filetypes
                  if ft and vim.tbl_contains(ft, buf_ft) then
                    return ' ' .. client.name
                  end
                end
                return msg
              end,
              color = { fg = colors.cyan, gui = 'bold' },
            },
          },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = ' ', warn = ' ', info = ' ' },
              diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.cyan },
              },
            },
            'encoding',
            'fileformat',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { { 'location', left_padding = 1 } },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
      end

      -- Initial setup
      setup_lualine()

      -- Auto-update lualine when colorscheme changes
      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = setup_lualine,
      })
    end,
  },
}
