return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "jfpedroza/neotest-elixir",
    "mfussenegger/nvim-dap",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-elixir"),
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = function(file)
            return "assets/jest.config.ts"
          end,
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd() .. "/assets"
          end,
        }),
      },
      output = { open_on_run = true },
    })
  end,
  keys = {
    {
      "<localleader>t",
      group = "Testing",
    },
    {
      "<localleader>to",
      function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end,
      desc = "Show neotest output",
    },
    {
      "<localleader>tO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Show neotest output panel",
    },
    {
      "<localleader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Show neotest summary",
    },
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
      "<localleader>td",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug Nearest",
    },
    {
      "<localleader>tm",
      function()
        require("neotest").summary.run_marked()
      end,
      desc = "Run marked tests",
    },
    {
      "<localleader>tS",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop tests",
    },
    {
      "<localleader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run file test",
    },
    {
      "<localleader>tF",
      function()
        require("neotest").run.run(vim.uv.cwd())
      end,
      desc = "Run all tests",
    },
    {
      "<localleader>tw",
      "<cmd>OpenLatestWallabyScreenshot<CR>",
      desc = "Open latest screenshot",
    },
  },
}
