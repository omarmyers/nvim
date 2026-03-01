return {
  {
    'rcasia/neotest-java',
    ft = 'java',
    dependencies = {
      'mfussenegger/nvim-jdtls',
      'mfussenegger/nvim-dap', -- for the debugger
      'rcarriga/nvim-dap-ui', -- recommended
      'theHamsta/nvim-dap-virtual-text', -- recommended
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    --@diagnostic disable-next-line: missing-fields
    config = function()
      local neotest = require 'neotest'

      neotest.setup {
        adapters = {
          require 'neotest-java' {
            junit_jar = '/home/omarmyers/.local/share/neotest/junit/junit-platform-console-standalone-1.10.2.jar',
          },
          require 'rustaceanvim.neotest',
        },
        floating = {
          border = 'rounded',
        },
      }

      -- Keybindings (Lua functions, not command strings)
      vim.keymap.set('n', '<leader>tn', function()
        neotest.run.run()
      end, { desc = 'Neotest Run (Nearest)' })

      vim.keymap.set('n', '<leader>tf', function()
        neotest.run.run(vim.fn.expand '%')
      end, { desc = 'Neotest Run (File)' })

      vim.keymap.set('n', '<leader>ts', function()
        neotest.summary.toggle()
      end, { desc = 'Neotest Summary' })

      vim.keymap.set('n', '<leader>to', function()
        neotest.output.open { enter = true }
      end, { desc = 'Neotest Output' })

      vim.keymap.set('n', '<leader>tO', function()
        neotest.output_panel.toggle()
      end, { desc = 'Neotest Output Panel' })
    end,
  },
}
