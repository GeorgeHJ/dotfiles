-- Populate loclist with the current buffer diagnostics
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    local ft = vim.bo.ft
    if ft ~= "vimwiki" then
      vim.diagnostic.setloclist({ open = false })
    end
  end,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
local severity = vim.diagnostic.severity
local highlights = {
  [severity.ERROR] = "DiagnosticSignError",
  [severity.WARN] = "DiagnosticSignWarn",
  [severity.HINT] = "DiagnosticSignHint",
  [severity.INFO] = "DiagnosticSignInfo",
}
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      -- Get cursor position safely
      local ok, cursor = pcall(vim.api.nvim_win_get_cursor, 0)
      if not ok then
        return diagnostic.message
      end
      local current_line = cursor[1] - 1
      if diagnostic.lnum == current_line then
        return ""
      end
      return diagnostic.message
    end,
    prefix = function(diagnostic)
      -- Get cursor position safely
      local ok, cursor = pcall(vim.api.nvim_win_get_cursor, 0)
      if not ok then
        return "■"
      end -- fallback prefix
      local current_line = cursor[1] - 1
      if diagnostic.lnum == current_line then
        return ""
      end
      -- Return the specific prefix character
      return "■"
    end,
  },
  underline = true,
  virtual_lines = { current_line = true },
  signs = {
    text = {
      [severity.ERROR] = signs.Error,
      [severity.WARN] = signs.Warn,
      [severity.HINT] = signs.Hint,
      [severity.INFO] = signs.Info,
    },
    numhl = highlights,
    texthl = highlights,
  },
})
-- Refresh virtual text when cursor moves
local refresh_timer = nil
local last_line = -1

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  callback = function()
    local current_line = vim.fn.line(".")

    if current_line == last_line then
      return
    end

    last_line = current_line

    if refresh_timer then
      vim.fn.timer_stop(refresh_timer)
    end

    refresh_timer = vim.fn.timer_start(50, function()

    local diagnostics = vim.diagnostic.get(0)
    if #diagnostics > 0 then
      vim.diagnostic.show()
    end
    refresh_timer = nil
    end)
  end,
})
