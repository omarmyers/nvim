return {
  {
    'Exafunction/windsurf.vim',
    event = 'BufEnter',
    keys = {
      {
        '<leader>tw',
        function()
          vim.cmd 'Codeium Toggle'
          vim.defer_fn(function()
            local status = vim.g.codeium_enabled == 0 and 'disabled' or 'enabled'
            vim.notify('Windsurf ' .. status, vim.log.levels.INFO, { title = 'Windsurf' })
          end, 100)
        end,
        desc = 'Toggle Windsurf',
      },
    },
  },
}
