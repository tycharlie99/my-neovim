local M = {}

local p4diff = require("perforce.diff")

-- 執行 Perforce 命令並回傳結果
local function run_p4_cmd(cmd)local handle = io.popen("p4 " .. cmd .. " 2>&1")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result
  end
  return "Error running p4 command"
end

-- 開啟當前檔案（p4 edit）
function M.p4_edit()local file = vim.fn.expand("%")
  local output = run_p4_cmd("edit " .. file)
  print(output)
end

-- 提交當前檔案
function M.p4_submit()local file = vim.fn.expand("%")
  vim.cmd("botright split") -- 開新視窗輸入 changelist 描述
  vim.cmd("terminal p4 submit " .. file)
end

-- 顯示 Perforce 開啟的檔案
function M.p4_opened()local output = run_p4_cmd("opened")
  print(output)
end

-- 註冊 Neovim 指令
function M.setup()
  vim.api.nvim_create_user_command("P4Edit", M.p4_edit, {})
  vim.api.nvim_create_user_command("P4Submit", M.p4_submit, {})
  vim.api.nvim_create_user_command("P4Opened", M.p4_opened, {})
  p4diff.setup()
end

return M
