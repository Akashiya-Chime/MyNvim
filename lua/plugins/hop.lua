return {
  "phaazon/hop.nvim",
  config = function()
    require("hop").setup({
      vim.keymap.set("n", "<leader>l", ":HopLine<CR>", {silent = true}),
      vim.keymap.set("n", "<leader>w", ":HopWord<CR>", {silent = true})
    })
  end
}
