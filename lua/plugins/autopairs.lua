return {
  "windwp/nvim-autopairs",
  config = function()
    local npairs_ok, npairs = pcall(require, "nvim-autopairs")
    if not npairs_ok then
      return
    end

    npairs.setup {
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
      },
      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
      },
      map_cr = false,
    }
    
    -- fix the bug with coc.nvim to comfirm completion
    _G.MUtils = {}
    MUtils.completion_confirm=function()
      if vim.fn.pumvisible() ~= 0  then
        vim.fn["coc#_select_confirm"]()
      else
        return npairs.autopairs_cr()
      end
    end
    vim.keymap.set('i', '<S-CR>', 'v:lua.MPairs.completion_confirm()', {expr = true, noremap = true})

  end
}
