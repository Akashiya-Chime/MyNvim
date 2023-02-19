return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text"
  },

  config = function()
    local dap_breakpoint_color = {
      breakpoint = {
        ctermbg=0,
        fg='#993939',
        bg='#31353f',
      },
      logpoing = {
        ctermbg=0,
        fg='#61afef',
        bg='#31353f',
      },
      stopped = {
        ctermbg=0,
        fg='#98c379',
        bg='#31353f'
      },
    }

    vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
    vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
    vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

    local dap_breakpoint = {
      error = {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      },
      condition = {
        text = 'ﳁ',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
      },
      rejected = {
        text = "",
        texthl = "DapBreakpint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      },
      logpoint = {
        text = '',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint',
      },
      stopped = {
        text = '',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
      },
    }

    vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
    vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
    vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
    vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
    vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({})

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    dap.adapters.lldb = {
      type = "executable",
      command = "C:/Users/Akashiya/scoop/apps/mingw-winlibs-llvm/current/bin/lldb-vscode.exe",
      name = "lldb"
    }
    -- dap.adapters.cppdbg = {
    --   id = "cppdbg",
    --   type = "executable",
    --   command = "C:/Users/Akashiya/.vscode-insiders/extensions/ms-vscode.cpptools-1.14.3-win32-x64/debugAdapters/bin/OpenDebugAD7.exe"
    -- }
    dap.configurations.cpp = {
      {
        name = 'Launch',
        type = 'lldb',
        -- type = 'cppdbg',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = function()
          local input = vim.fn.input("Input args: ")
          return vim.fn.split(input, " ", true)
        end,
        runInTerminal = false,
      }
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

    -- keybing
    vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", {silent = true, noremap = true, buffer = bufnr})
    vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", {silent = true, noremap = true, buffer = bufnr})
    vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", {silent = true, noremap = true, buffer = bufnr})
    vim.keymap.set("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true, noremap = true, buffer = bufnr})
    vim.keymap.set("n", "<F6>", "<cmd>lua require'dapui'.toggle()<CR>", {silent = true, noremap = true, buffer = bufnr})

    require("nvim-dap-virtual-text").setup {
      enabled = true,                        -- enable this plugin (the default)
      enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
      highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
      highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
      show_stop_reason = true,               -- show stop reason when stopped for exceptions
      commented = false,                     -- prefix virtual text with comment string
      only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
      all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
      --- A callback that determines how a variable is displayed or whether it should be omitted
      --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
      --- @param buf number
      --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
      --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
      --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
      display_callback = function(variable, _buf, _stackframe, _node)
        return variable.name .. ' = ' .. variable.value
      end,

      -- experimental features:
      virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
      all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
      virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
    }

  end
}
