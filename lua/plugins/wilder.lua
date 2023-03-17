return {
  "gelguy/wilder.nvim",
  config = function()
    local wilder = require("wilder")
    wilder.setup({
      modes = { ':', '/', '?' },
    })
    vim.api.nvim_command("silent! UpdateRemotePlugins")
    wilder.set_option('pipeline', {
      wilder.branch(
        -- 当默认无输入时 展示15条历史记录
        {
          wilder.check(function (_, x) return vim.fn.empty(x) end),
          wilder.history(15)
        },
        -- 当输入时 展示所有匹配项(模糊匹配)
        wilder.cmdline_pipeline({
          fuzzy = 1,
          fuzzy_filter = wilder.vim_fuzzy_filter()
        }),
        -- pipeline for search
        wilder.search_pipeline()
      ),
    })
    wilder.set_option('renderer', wilder.popupmenu_renderer(
      wilder.popupmenu_palette_theme({
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
        border = 'rounded',
        -- max_height = '75%',      -- max height of the palette
        max_height = 17,
        min_height = 0,          -- set to the same as 'max_height' for a fixed height window
        prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
        reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'

        highlights = {
          accent = "WilderAccent",
          selected_accent = "WilderSelectedAccent",
        },

        highlighter = wilder.basic_highlighter(),
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()},
      })
    ))
    -- 设置高亮
    vim.api.nvim_set_hl(0, 'WilderAccent', { fg = '#5f87ff' })
    vim.api.nvim_set_hl(0, 'WilderSelectedAccent', { fg = '#5f87ff', bg = '#4e4e4e' })
  end
}
