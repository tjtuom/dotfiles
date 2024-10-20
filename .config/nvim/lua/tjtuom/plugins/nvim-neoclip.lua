return {
  "AckslD/nvim-neoclip.lua",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  config = true,
  keys = {
    { "<leader>fy", "<cmd>Telescope neoclip<CR>", { desc = "Search clipboard history" } },
  },
}
