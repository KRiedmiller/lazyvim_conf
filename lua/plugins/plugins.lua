return {
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
}
