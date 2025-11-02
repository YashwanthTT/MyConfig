return {
{
  "jiaoshijie/undotree",
  ---@module 'undotree.collector'
  ---@type UndoTreeCollector.Opts
  opts = {
    -- your options
  },
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>t", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
}
