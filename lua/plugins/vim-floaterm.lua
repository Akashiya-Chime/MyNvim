-- 用于快速设定floatterm的相关map
function setFTToggleMap(key, name, cmd)
  vim.keymap.set('n', key, string.format(":lua require('func/vim-floaterm-func').toggleFT('%s', '%s')<cr>", name, cmd), { silent = true, noremap = true })
  vim.keymap.set('t', key, "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('" .. name .. "') == bufnr('%') ? '' : '" .. key.. "') : '" .. key.. "'", {silent = true, expr = true})
end

return {
  "voldikss/vim-floaterm",
  config = function()
    vim.g.floaterm_shell = "nu"
    vim.g.floaterm_tile = ""
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_autoclose = 0
    vim.g.floaterm_opener = "edit"

    vim.cmd("au BufEnter * if &buftype == 'terminal' | :call timer_start(50, { -> execute('startinsert!') }, { 'repeat': 3 }) | endif")
    vim.cmd("hi FloatermBorder guifg=#f5bde6 guibg=none")

    setFTToggleMap("<C-t>", "TERM", "")
  end
}
