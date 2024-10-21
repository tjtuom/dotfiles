return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "jonarrien/telescope-cmdline.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    local telescopeConfig = require("telescope.config")

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    telescope.setup({
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("cmdline")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local builtin = require("telescope.builtin")

    keymap.set("n", ":", "<cmd>Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })

    keymap.set("n", "<leader>fF", builtin.git_files, { desc = "Telescope find git_files" })
    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
    keymap.set(
      "n",
      "<leader>fs",
      builtin.lsp_document_symbols,
      { desc = "Lists LSP document symbols in the current buffer" }
    )

    keymap.set("n", "<leader>bf", function()
      builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
    end, { desc = "Telescope buffers" })
  end,
}
