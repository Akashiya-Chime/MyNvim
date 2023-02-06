local M = {}

-- toggleFT func: 存在对应名称的窗口则toggle，否则新建
function M.toggleFT(name, cmd)
    if vim.fn['floaterm#terminal#get_bufnr'](name) ~= -1 then
        vim.cmd(string.format('exec "FloatermToggle %s"', name))
    else
        vim.cmd(string.format('FloatermNew --name=%s %s', name, cmd))
    end
end


function M.setup()
  -- do nothing
end

return M
