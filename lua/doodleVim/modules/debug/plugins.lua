local debug = {}
local conf = require("doodleVim.modules.debug.config")

debug['mfussenegger/nvim-dap'] = {
    opt = true,
    after = "mason.nvim",
    config = conf.dap
}

debug['rcarriga/nvim-dap-ui'] = {
    after = "nvim-dap",
    config = conf.dapui
}

return debug
