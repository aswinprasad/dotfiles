return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>fh", "<cmd>DiffviewFileHistory %<CR>", desc = "View File history" },
    { "<leader>fd", "<cmd>DiffviewOpen<CR>", desc = "View Current Index Diff/Merge Diff" },
  },
  opts = function()
    local actions = require("diffview.actions")
    return {
      enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
      keymaps = {
        view = {
          { "n", "q", actions.close },
          { "n", "<Tab>", actions.select_next_entry },
          { "n", "<S-Tab>", actions.select_prev_entry },
          { "n", "<leader>a", actions.focus_files },
          { "n", "<leader>e", actions.toggle_files },
        },
        file_panel = {
          { "n", "q", actions.close },
          { "n", "h", actions.prev_entry },
          { "n", "o", actions.focus_entry },
          { "n", "gf", actions.goto_file },
          { "n", "sg", actions.goto_file_split },
          { "n", "st", actions.goto_file_tab },
          { "n", "<C-r>", actions.refresh_files },
          { "n", "<leader>e", actions.toggle_files },
        },
        file_history_panel = {
          { "n", "q", "<cmd>DiffviewClose<CR>" },
          { "n", "o", actions.focus_entry },
          { "n", "O", actions.options },
        },
      },
    }
  end,
}
