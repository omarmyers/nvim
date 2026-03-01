return {
  'tamton-aquib/duck.nvim',
  config = function()
    local duck = require 'duck'
    vim.keymap.set('n', '<leader>dd', function()
      duck.hatch()
    end, { desc = 'Hatch a Duck' })
    vim.keymap.set('n', '<leader>dc', function()
      for _ = 1, 10 do
        duck.hatch('🦀', 10)
      end
    end, { desc = 'Hatch 10 🦀' })
    vim.keymap.set('n', '<leader>ds', function()
      for _ = 1, 25 do
        duck.hatch '🕷️'
      end
    end, { desc = 'Hatch 25 🕷️' })
    vim.keymap.set('n', '<leader>dk', function()
      duck.cook()
    end, { desc = 'Cook a Duck' })
    vim.keymap.set('n', '<leader>da', function()
      duck.cook_all()
    end, { desc = 'Cook All Ducks' })
  end,
}
