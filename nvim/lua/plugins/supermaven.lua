return {
  "supermaven-inc/supermaven-nvim",
  lazy = false,
  enabled = false,
  opts = {
    keymaps = {
      accept_suggestion = "<Right>", -- handled by nvim-cmp / blink.cmp
    },
    disable_inline_completion = false,
  }
}
