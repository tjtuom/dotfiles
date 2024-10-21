return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "jfpedroza/neotest-elixir",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-elixir"),
      },
    })
  end,
  keys = {
    {
      "<localleader>tt",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run last test",
    },
    {
      "<localleader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run nearest test",
    },
    {
      "<localleader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run file test",
    },
    {
      "<localleader>ts",
      "<cmd>OpenLatestWallabyScreenshot<CR>",
      desc = "Open latest screenshot",
    },
  },
}
