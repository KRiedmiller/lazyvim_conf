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
    "kontura/trails.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {},
    keys = { { "<leader>ct", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", desc = "Calltree" } },
  },
  {
    "snacks.nvim",
    opts = {
      image = { enabled = true },
    },
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-macchiato",
      -- colorscheme = "catppuccin-frappe",
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "catppuccin-latte",
    },
  },
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
    opts = {
      lsp = {
        -- open manually with <C-k>
        signature = { auto_open = { trigger = false } },
      },
    },
  },
  {
    "nvim-mini/mini.surround",
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
      vim.g.slime_menu_config = true
      vim.g.slime_neovim_ignore_unlisted = false
      -- options not set here are g:slime_neovim_menu_order, g:slime_neovim_menu_delimiter, and g:slime_get_jobid
      -- see the documentation above to learn about those options
      vim.g.slime_python_ipython = 0
      vim.g.slime_bracketed_paste = 1
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
    -- branch = "regexp", -- This is the regexp branch, use this for the new version
    keys = {
      { "<leader>v", "<cmd>VenvSelect<cr>" },
    },
    config = function()
      require("venv-selector").setup({
        options = {
          debug = true,
          enable_default_searches = true,
        },
        search = {
          anaconda_base = {
            command = "$FD '/bin/python$' ~/software/miniforge3/bin/ --full-path --color never",
            type = "anaconda",
          },
          anaconda_env = {
            command = "$FD '/bin/python$' ~/software/miniforge3/envs/ --full-path --color never",
            type = "anaconda",
          },
          my_venvs = {
            command = "$FD -p '/bin/python$' ~/.venv",
          },
          -- cwd = {
          --   command = "fd '/bin/python$' $CWD --full-path",
          -- },
        },
      })
    end,
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "U", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      set({ "n", "x" }, "<A-up>", function()
        mc.lineAddCursor(-1)
      end, { desc = "Add cursor above" })
      set({ "n", "x" }, "<A-down>", function()
        mc.lineAddCursor(1)
      end, { desc = "Add cursor below" })
      set({ "n", "x" }, "<leader><up>", function()
        mc.lineSkipCursor(-1)
      end, { desc = "Don't add cursor above" })
      set({ "n", "x" }, "<leader><down>", function()
        mc.lineSkipCursor(1)
      end, { desc = "Don't add cursor below" })

      -- Add or skip adding a new cursor by matching word/selection
      set({ "n", "x" }, "<leader>mn", function()
        mc.matchAddCursor(1)
      end, { desc = "Add cursor at match" })
      set({ "n", "x" }, "<leader>ms", function()
        mc.matchSkipCursor(1)
      end, { desc = "Add cursor at selection" })
      set({ "n", "x" }, "<leader>mN", function()
        mc.matchAddCursor(-1)
      end, { desc = "Add cursor at match" })
      set({ "n", "x" }, "<leader>mS", function()
        mc.matchSkipCursor(-1)
      end, { desc = "Add cursor at selection" })

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse)
      set("n", "<c-leftdrag>", mc.handleMouseDrag)
      set("n", "<c-leftrelease>", mc.handleMouseRelease)

      -- Disable and enable cursors.
      set({ "n", "x" }, "<c-q>", mc.toggleCursor)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        -- Delete the main cursor.
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("quarto").setup()
    end,
  },
}
