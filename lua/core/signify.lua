local M = {}

function M.setup()
    vim.g.signify_sign_add = '+'
    vim.g.signify_sign_change = '~'
    vim.g.signify_sign_delete = '-'

    vim.cmd [[
        highlight SignifySignAdd guifg=green ctermfg=green
        highlight SignifySignChange guifg=yellow ctermfg=yellow
        highlight SignifySignDelete guifg=red ctermfg=red
    ]]
end
return M
