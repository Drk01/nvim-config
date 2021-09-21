local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then return end

ts_config.setup {
    ensure_installed = {
        "bash", "lua", "php", "typescript", "graphql", "vue", "dockerfile",
        "json", "yaml", "comment", "jsonc", "tsx", "html", "json5", "jsdoc",
        "latex", "css"
    },
    highlight = {enable = true, use_languagetree = true},
    autotag = {enable = true},
    autopairs = {enable = true}
}

