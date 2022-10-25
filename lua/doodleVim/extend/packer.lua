local M = {}

M.fns = {}

M.add = function(name, fn)
    M.fns[name] = fn
end

M.PostPackerCompileDone = function()
    for name, fn in pairs(M.fns) do
        local ok, _ = pcall(fn)
        if not ok then
            vim.notify("Function: '" .. name .. "' Runs Failed")
        end
    end
end

return M
