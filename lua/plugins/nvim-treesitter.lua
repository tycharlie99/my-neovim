return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "go",
        "lua",
        "python",

        "html",
        "javascript",
        "css",

        "markdown",
        "markdown_inline",
        "json",
        "yaml",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      fold = {
        enable = true,
      },
    },
  },
}
