return {
  {
    "mhinz/vim-signify",
    config = function()
      -- Function to check if we're in a Perforce repository
      local function is_perforce()
        local ok, output = pcall(vim.fn.system, "p4 info")
        if ok then
          local root = output:match("Client root: ([^\n]+)")
          if root and vim.fn.getcwd():find(root, 1, true) then
            return true
          end
        end
        return false
      end

      -- Set signify signs
      vim.g.signify_sign_add = '+'
      vim.g.signify_sign_change = '~'
      vim.g.signify_sign_delete = '-'

      -- Highlight settings
      vim.api.nvim_set_hl(0, 'SignifySignAdd', { fg = 'green' })
      vim.api.nvim_set_hl(0, 'SignifySignChange', { fg = 'yellow' })
      vim.api.nvim_set_hl(0, 'SignifySignDelete', { fg = 'red' })

      -- Disable signify by default if not in a Perforce repo
      if not is_perforce() then
        vim.g.signify_disable_by_default = 1
      end
    end,
  },
}
