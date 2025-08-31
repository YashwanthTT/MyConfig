return {
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    keys = {
      { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Start Live Server" },
      { "<leader>lq", "<cmd>LiveServerStop<cr>", desc = "Stop Live Server" },
    },
    config = true,
  },
}
