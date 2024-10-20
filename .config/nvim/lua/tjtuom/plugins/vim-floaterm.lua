return {
  "voldikss/vim-floaterm",
  keys = {
    { "<leader>t", group = "Terminal" },
    { "<C-t>", "<cmd>FloatermToggle<CR>", { desc = "Toggle Floaterm" } },
    { "<leader>tn", "<cmd>FloatermNew<CR>", { desc = "Toggle Floaterm" } },
  },
  config = function()
    vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<C-t>", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })
  end,
}
