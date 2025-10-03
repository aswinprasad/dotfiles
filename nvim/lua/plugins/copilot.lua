return {
  "zbirenbaum/copilot.lua",
  optional = true,
  opts = {
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      hide_during_completion = vim.g.ai_cmp,
      keymap = {
        accept = "<C-l>",
        accept_word = "<C-]>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-q>",
      },
    },
    copilot_model = "gpt-4o-copilot",
    panel = { enabled = false },
  },
}
