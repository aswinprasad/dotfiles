return {
  "saghen/blink.cmp",
  ---@class PluginLspOpts
  opts = {
    completion = {
      keyword = {
        range = "full",
      },
    },
    keymap = {
      preset = "super-tab",
      ["<C-j>"] = { "select_next", "snippet_forward", "fallback" },
      ["<C-k>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    -- sources = {
    -- default = { "lsp", "path", "buffer" },
    -- default = { "lsp", "path", "buffer", "codecompanion" },
    -- cmdline = {}, -- Disable sources for command-line mode
    -- },
  },
}
