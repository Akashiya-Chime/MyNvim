return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
      config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://ghproxy.com/https://github.com/")
    end
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "vim", "help", "c", "json", "lua", "go", "rust", "toml", "yaml" },

      highlight = { enable = true },
      indent = { enable = true },

      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    })
  end
}
