return {
  "mg979/vim-visual-multi",
  branch = "master",
  config = function()
    vim.g.VM_theme = "ocean"
    vim.g.VM_highlight_matches = "underline"
    vim.g.VM_maps = {
      ['Select h'] = '<C-Left>',
      ['Select l'] = '<C-Right>',
      ['Add Cursor Down'] = "<C-Down>",
      ['Add Cursor Up'] = "<C-Up>",
    }
  end
}
