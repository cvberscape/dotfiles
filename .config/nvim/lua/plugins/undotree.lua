-- ~/.config/nvim/lua/plugins/undotree.lua

return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = { { "<leader>t", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" } },
  config = function()
    -- Set focus to the undotree window automatically when toggled
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}
