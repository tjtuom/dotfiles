return {
  "echasnovski/mini.files",
  version = false,
  opts = {
    permanent_delete = false,
    mappings = {
      go_in = "L",
      go_in_plus = "l",
      go_out = "H",
      go_out_plus = "h",
      reset = ",",
      show_help = "g?",
    },
  },
  keys = {
    {
      "<leader>ee",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      { desc = "Opeb Mini.Files window" },
    },
    {
      "<leader>eE",
      function()
        require("mini.files").open()
      end,
      { desc = "Opeb Mini.Files window" },
    },
  },
}
