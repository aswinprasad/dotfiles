return {
  "gbprod/substitute.nvim",
  config = function()
    require("substitute").setup()

    vim.keymap.set("n", "gr", require("substitute").operator, { noremap = true, desc = "Substitute" })
    vim.keymap.set("n", "grr", require("substitute").line, { noremap = true, desc = "Substitute line" })
    vim.keymap.set("n", "grS", require("substitute").eol, { noremap = true, desc = "Substitute to end of line" })
    vim.keymap.set("x", "gr", require("substitute").visual, { noremap = true, desc = "Substitute visual" })
  end,
}
