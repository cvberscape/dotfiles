return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true, -- Show hidden files in explorer
          ignored = true, -- Optionally show git-ignored files
        },
        files = {
          hidden = true, -- Show hidden files in file picker
          ignored = true, -- Optionally show git-ignored files
        },
      },
    },
  },
}
