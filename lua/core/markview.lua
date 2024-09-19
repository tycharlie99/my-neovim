local M = {}

function M.setup()
  local status, markview = pcall(require, "markview")

  if not status then
    print("Failed to load markview")
  end

  markview.setup({
    headings = {
      enable = true,
      shift_width = 0,
      heading_1 = {
        style = "icon",
        hl = "DiagnosticOk",
      },
      heading_2 = {
        style = "icon",
        hl = "DiagnosticOk",
      },
      heading_3 = {
        style = "icon",
        hl = "DiagnosticOk",
      },
    },
    list_items = {
      enable = true,
      shift_width = 2,
      ident_size = 3,
    },
  })

end

return M
