local M = {}

local function run_p4_cmd(cmd)
  local handle = io.popen("p4 " .. cmd .. " 2>&1")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result
  end
  return "Error running p4 command"
end

local function create_floating_window(content)
  local lines = type(content) == 'string' and vim.split(content, "\n") or content
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
end

local function get_p4_user()
  local output = run_p4_cmd("info")
  return output:match("User name:%s*(%S+)") or "Unknown User"
end

local function handle_p4_command(cmd)
  local file = vim.fn.expand("%")
  local output = run_p4_cmd(cmd .. " " .. file)

  vim.cmd("checktime")

  vim.notify(output:gsub("\n$", ""), vim.log.levels.INFO)
end

function M.p4_edit()
  handle_p4_command("edit")
end

function M.p4_opened()
  create_floating_window(run_p4_cmd("opened"))
end

function M.p4_add()
  handle_p4_command("add")
end

function M.p4_revert()
  handle_p4_command("revert")
end

function M.p4_sync()
  create_floating_window(run_p4_cmd("sync"))
end

function M.get_resolve_files()
  create_floating_window(run_p4_cmd("resolve -n"))
end

function M.revert_unmodified_files()
  create_floating_window(run_p4_cmd("revert -a"))
end

function M.list_user_pending_changelists()
  local user = get_p4_user()
  if user == "Unknown User" then
    vim.notify("Could not determine P4 user.", vim.log.levels.ERROR)
    return
  end
  local output = run_p4_cmd("changes -u " .. user .. " -s pending")


  local output_detail = "default changelist:\n" .. run_p4_cmd("opened -c default") .. "\n"

  for line in output:gmatch("[^\r\n]+") do
    output_detail = output_detail .. line .. "\n"
    local changelist = line:match("^Change (%d+)")
    if changelist then

      local function append_files(cmd, header)
        local result = run_p4_cmd(cmd)
        local files_start = result:find(header)
        if files_start then
          local files = result:sub(files_start):gmatch("[^\r\n]+")
          local skip_first = true
          local has_files = false
          for f in files do
            if skip_first then
              skip_first = false
            else
              if not has_files then
                output_detail = output_detail .. header .. "\n"
                has_files = true
              end
              output_detail = output_detail .. f .. "\n"
            end
          end
        end
      end

      append_files("describe -s " .. changelist, "Affected files ...")
      append_files("describe -s -S " .. changelist, "Shelved files ...")
    end
    output_detail = output_detail .. "\n"
  end


  create_floating_window(output_detail)
end

function M.setup()
  local commands = {
    { name = "P4Edit", func = M.p4_edit },
    { name = "P4Opened", func = M.p4_opened },
    { name = "P4Add", func = M.p4_add },
    { name = "P4Revert", func = M.p4_revert },
    { name = "P4Sync", func = M.p4_sync },
    { name = "P4ResolveFiles", func = M.get_resolve_files },
    { name = "P4RevertUnmodifiedFiles", func = M.revert_unmodified_files },
    { name = "P4ListUserPendingChangelists", func = M.list_user_pending_changelists },
  }

  for _, cmd in ipairs(commands) do
    vim.api.nvim_create_user_command(cmd.name, cmd.func, { desc = "Run " .. cmd.name })
  end

  local keymaps = {
    { key = "<leader>pe", func = M.p4_edit, desc = "P4 Edit"},
    { key = "<leader>po", func = M.p4_opened, desc = "P4 Opened" },
    { key = "<leader>pa", func = M.p4_add, desc = "P4 Add" },
    { key = "<leader>pV", func = M.p4_revert, desc = "P4 Revert" },
    { key = "<leader>ps", func = M.p4_sync, desc = "P4 Sync" },
    { key = "<leader>pr", func = M.get_resolve_files, desc = "P4 Get Resolve Files" },
    { key = "<leader>pv", func = M.revert_unmodified_files, desc = "P4 Revert Unmodified Files" },
    { key = "<leader>pc", func = M.list_user_pending_changelists, desc = "P4 List User Pending Changelists" },
  }

  for _, map in ipairs(keymaps) do
    vim.keymap.set("n", map.key, map.func, { desc = map.desc })
  end
end

return M
