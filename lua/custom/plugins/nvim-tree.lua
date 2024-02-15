return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      hijack_cursor = true,
      view = {
        width = 65,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        add_trailing = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          -- glyphs = {
          --   folder = {
          --     arrow_closed = "", -- arrow when folder is closed
          --     arrow_open = "", -- arrow when folder is open
          --   },
          -- },
          git_placement = "signcolumn",
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = true,
          },
        },
        special_files = {
          "Cargo.toml", "Makefile", "README.md", "readme.md", "CHANGELOG.md",
          "mix.exs", "rebar.config", "Dockerfile", "package.json"
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },

      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        git_ignored = true,
        custom = {
          ".QF_Fgber",
          "^.tvg$",
        },
      },
      git = {
        show_on_open_dirs = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap                                                                                                             -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })                         -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })                     -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })                       -- refresh file explorer
  end,
}
