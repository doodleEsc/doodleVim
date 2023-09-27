local ui = {}

function ui.treesitter(plugin)
    require("doodleVim.extend.lazy").add("nvim-treesitter", function()
        require("doodleVim.utils.defer").immediate_load("nvim-treesitter")
        local vendor = {
            "bash",
            "cmake",
            "comment",
            "c",
            "cpp",
            "dot",
            "dockerfile",
            "go",
            "gomod",
            "gowork",
            "json",
            "html",
            "lua",
            "make",
            "python",
            "regex",
            "rust",
            "toml",
            "vim",
            "yaml",
            "solidity",
            "markdown",
            "org",
            "java",
        }

        -- HACK: add norg and norg_meta parser_info to nvim-treesitter

        local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
        parser_configs.org = {
            install_info = {
                url = "https://github.com/milisims/tree-sitter-org",
                revision = "081179c52b3e8175af62b9b91dc099d010c38770",
                files = { "src/parser.c", "src/scanner.cc" },
            },
            filetype = "org",
        }

        local langs = {}
        local utils = require("doodleVim.utils.utils")
        for _, lang in ipairs(vendor) do
            if not utils.ts_is_installed(lang) then
                table.insert(langs, lang)
            end
        end
        if #langs > 0 then
            local update = require("nvim-treesitter.install").update({ with_sync = true })
            local ok, _ = pcall(update, langs)
            if not ok then
                vim.notify("TSUpdate Failed...")
            end
        end
    end)
end

return ui
