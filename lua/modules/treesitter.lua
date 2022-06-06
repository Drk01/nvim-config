local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then return end

ts_config.setup {
    ensure_installed = {
        "bash", "lua", "typescript", "graphql", "vue", "dockerfile",
        "json", "yaml", "comment", "jsonc", "tsx", "html", "json5", "jsdoc",
        "latex", "css", "dart"
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = true
    },
    autotag = {enable = true},
    autopairs = {enable = true}
}

