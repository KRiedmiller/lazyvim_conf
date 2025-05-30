return {
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       python = { "ruff" },
  --     },
  --   },
  -- },
  {
    "folke/noice.nvim",
    keys = {
      -- change hover scroll
      { "<c-b>", false, mode = { "i", "n", "s" } },
      {
        "<c-g>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-g>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll Backward",
        mode = { "i", "n", "s" },
      },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
      keys = {
        { "gz", "", desc = "+surround" },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-y>"] = { "select_and_accept" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<C-g>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
      completion = {
        list = {
          selection = { preselect = false, auto_insert = false },
        },
      },
    },
  },
  {
    "jpalardy/vim-slime",
    ft = "python",
    init = function()
      -- these two should be set before the plugin loads
      vim.g.slime_target = "neovim"
      vim.g.slime_no_mappings = true
    end,
    config = function()
      vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = false
      vim.g.slime_neovim_ignore_unlisted = false
      -- options not set here are g:slime_neovim_menu_order, g:slime_neovim_menu_delimiter, and g:slime_get_jobid
      -- see the documentation above to learn about those options
      vim.g.slime_python_ipython = 1
      vim.g.slime_cell_delimiter = "# %%"

      -- called MotionSend but works with textobjects as well
      vim.keymap.set("n", "<leader>r", "<Plug>SlimeMotionSend", { remap = true, silent = false })
      vim.keymap.set("n", "<leader>rr", "<Plug>SlimeLineSend", { remap = true, silent = false })
      vim.keymap.set("x", "<leader>rr", "<Plug>SlimeRegionSend", { remap = true, silent = false })
      vim.keymap.set("n", "<leader>rc", "<Plug>SlimeConfig", { remap = true, silent = false })
      vim.keymap.set("n", "<leader>rz", "<Plug>SlimeSendCell", { remap = true, silent = false })
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup({
        settings = {
          search = {
            anaconda_base = {
              command = "fd '/bin/python$' ~/software/miniforge3/bin/ --full-path --color never",
              type = "anaconda",
            },
            anaconda_env = {
              command = "fd '/bin/python$' ~/software/miniforge3/envs/ --full-path --color never",
              type = "anaconda",
            },
            my_venvs = {
              command = "fd -p '/bin/python$' ~/.venv",
            },
          },
        },
      })
    end,
    keys = {
      { "<leader>v", "<cmd>VenvSelect<cr>" },
    },
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "U", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
}
