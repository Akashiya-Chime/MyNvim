return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    vim.g.coc_global_extensions = {
      "coc-marketplace",
      "coc-clangd",
      -- "coc-lua",
      "coc-rust-analyzer",
      "coc-json",
      "coc-git"
    }
    
    -- keymap
    local keyset = vim.keymap.set

    function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
      else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end

    local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

    keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
    keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
    keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

    keyset('n', '<F2>', '<Plug>(coc-rename)', {silent = true})
    keyset('n', 'gd', '<Plug>(coc-definition)', {silent = true})
    keyset('i', '<c-y>', "coc#pum#visible() ? coc#pum#confirm() : '<c-y>'", {silent = true, noremap = true, expr = true})
    keyset('n', 'gd', '<Plug>(coc-definition)', {silent = true})
    keyset('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
    keyset('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
    keyset('n', 'gr', '<Plug>(coc-references)', {silent = true})
    -- keyset('n', '<F3>', ':call CocAction("doHover")<CR>', {silent = true})
    keyset('n', '<F3>', '<CMD>lua _G.show_docs()<CR>', {silent = true})
    keyset('n', 'F', ':call CocAction("format")<CR>', {silent = true})

  end
}
