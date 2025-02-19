local M = {}

function M.setup()
    local status, null_ls = pcall(require, "null-ls")
    if not status then
        print("Failed to load null-ls")
        return
    end

    local function get_source()
        local source = {}
        for key, type in pairs(_G.lspconfig.linter) do
            for _, linter in ipairs(type) do
                if key == "linters" then
                    table.insert(source, null_ls.builtins.diagnostics[linter])
                elseif key == "formatters" then
                    table.insert(source, null_ls.builtins.formatting[linter])
                elseif key == "code_actions" then
                    table.insert(source, null_ls.builtins.code_actions[linter])
                end
            end
        end
        return source
    end


    null_ls.setup({
        sources = get_source(),
    })

end

return M
