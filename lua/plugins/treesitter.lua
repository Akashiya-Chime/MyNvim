require("nvim-treesitter.configs").setup({
  ensure_installed = { "vim", "help", "c", "json", "lua", "python", "go", "rust", "toml", "yaml", "javascript" },

  highlight = { enable = true },
  indent = { enable = true },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
})
