return {
  "akinsho/bufferline.nvim",
  config = function()

    vim.opt.termguicolors = true
    
    vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", {silent = true})
    vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", {silent = true})
    vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", {silent = true})
    vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", {silent = true})
    vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", {silent = true})
    vim.keymap.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", {silent = true})
    vim.keymap.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", {silent = true})
    vim.keymap.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", {silent = true})
    vim.keymap.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", {silent = true})
    vim.keymap.set("n", "<leader>0", ":bd<CR>", {silent = true})

    require("bufferline").setup({
      options = {
        always_show_bufferline = false,
        diagnostics = "coc",
        separator_style = "slant",
        indicator = {
          style = "underline"
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
      },
    })
  end
}
