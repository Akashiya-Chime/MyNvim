return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    vim.g.coc_global_extensions = {
      "coc-marketplace",
      "coc-clangd",
      "coc-lua",
      "coc-rust-analyzer",
      "coc-json",
      "coc-git"
    }
    
    -- keymap
    local keyset = vim.keymap.set
    keyset('i', '<TAB>', "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()", {silent = true, noremap = true, expr = true})
    keyset('i', '<S-TAB>', "coc#pum#visible() ? coc#pum#prev(1) : \"\\<s-tab>\"", {silent = true, noremap = true, expr = true})
    keyset("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : \"\\<c-g>u\\<cr>\\<c-r>=coc#on_enter()\\<cr>\"", {silent = true, noremap = true, expr = true})
    keyset('n', '<F2>', '<Plug>(coc-rename)', {silent = true})
    keyset('n', 'gd', '<Plug>(coc-definition)', {silent = true})
    keyset('i', '<c-y>', "coc#pum#visible() ? coc#pum#confirm() : '<c-y>'", {silent = true, noremap = true, expr = true})
    keyset('n', 'gd', '<Plug>(coc-definition)', {silent = true})
    keyset('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
    keyset('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
    keyset('n', 'gr', '<Plug>(coc-references)', {silent = true})

  end
}
