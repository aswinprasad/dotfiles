-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Silent keymap option
local opts = { silent = true }

-- Escape insert mode with jk
vim.keymap.set({ "n", "v", "i" }, "<A-a>", "<ESC>", { noremap = true })

-- Select all
vim.keymap.set({ "n", "v" }, "<C-a>", "ggVG", { noremap = true })

-- Redo
vim.keymap.set("n", "<S-u>", "<C-r>", { noremap = true })

-- Goto definition
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, desc = "LSP: Goto Definition" })

-- Save all buffers
-- vim.keymap.set("n", "<C-S>", "<cmd>wa<CR>", { noremap = true })

-- Better copy and paste in visual mode
vim.keymap.set("v", "p", '"_dP', { noremap = true })

-- Don't yank newline when using $
vim.keymap.set("v", "$", "g_", { noremap = true })

-- Move to the beginning of the line
vim.keymap.set({ "n", "v" }, "H", "^", { noremap = true })

-- Move to the end of the line
vim.keymap.set({ "n", "v" }, "L", "$", { noremap = true })

-- Scroll Up & Center
vim.keymap.set("n", "K", "<C-u>zz", { noremap = true, desc = "Scroll Up & Center" })

-- Scroll Down & Center
vim.keymap.set("n", "J", "<C-d>zz", { noremap = true, desc = "Scroll Down & Center" })

-- Displays hover information about the symbol under the cursor in a floating
-- vim.keymap.set("n", "gh", vim.lsp.buf.hover, { noremap = true, desc = "LSP: Hover" })

-- Increase vertical split
vim.keymap.set("n", "<C-l>", "<cmd> vertical resize +5 <CR>", { noremap = true, desc = "Increase vertical split" })

-- Decrease vertical split
vim.keymap.set("n", "<C-h>", "<cmd> vertical resize -5 <CR>", { noremap = true, desc = "Decrease vertical split" })

-- Increase horizontal split
vim.keymap.set("n", "<C-k>", "<cmd> horizontal resize -5 <CR>", { noremap = true, desc = "Decrease horizontal split" })

-- Decrease horizontal split
vim.keymap.set("n", "<C-j>", "<cmd> horizontal resize +5 <CR>", { noremap = true, desc = "Increase horizontal split" })

-- Previous unmatched group
vim.keymap.set(
  "n",
  "<A-K>",
  "<plug>(MatchitNormalMultiBackward)",
  { noremap = true, desc = "Previous unmatched group" }
)

-- Next unmatched group
vim.keymap.set("n", "<A-J>", "<plug>(MatchitNormalMultiForward)", { noremap = true, desc = "Next unmatched group" })

-- Move to left pane
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, desc = "Move to left pane" })

-- Move to below pane
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, desc = "Move to below pane" })

-- Move to top pane
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, desc = "Move to top pane" })

-- Move to right pane
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, desc = "Move to right pane" })

-- Close current pane
vim.keymap.set("n", "<A-W>", "<C-w>q", { noremap = true, desc = "Close pane" })

-- Split window vertically
vim.keymap.set("n", "<leader>v", "<cmd> vsp <CR>", { noremap = true, desc = "Split Vertical" })

-- Split window horizontally
vim.keymap.set("n", "<leader>w", "<cmd> sp <CR>", { noremap = true, desc = "Split Horizontal" })

-- Close buffer
vim.keymap.set("n", "<C-w>", "<cmd> bd <CR>", { noremap = true, desc = "Close Buffer" })

-- Paste in insert mode
vim.keymap.set("i", "<C-v>", "<c-r>+", { noremap = true, desc = "Paste in insert mode" })

-- Redraw / Clear hlsearch / Diff Update
vim.keymap.set(
  "n",
  "<leader>/",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { remap = true, desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- Save without format
vim.keymap.set({ "n", "x", "s" }, "<leader>s", "<cmd>noa w<CR>", { noremap = true, desc = "Save without format" })

-- Search current buffer
-- local function find_in_current_buffer()
--   require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
--     winblend = 10,
--     previewer = true,
--   }))
-- end
--
-- vim.keymap.set("n", "<C-f>", function()
--   find_in_current_buffer()
-- end, { desc = "Find in Current Buffer" })

-- Lspsaga
-- LSP finder - Find the symbol's definition
vim.keymap.set("n", "gR", "<cmd>Lspsaga finder ref<CR>", { noremap = true, desc = "LSP: Find references" })

-- Code action
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
-- vim.keymap.set("n", "cr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
-- vim.keymap.set("n", "cR", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>")

-- Go to type definition
vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

-- Diagnostic jump can use `<c-o>` to jump back
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
vim.keymap.set("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)

vim.keymap.set("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle Outline
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Pressing the key twice will enter the hover window
vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>")

-- Substitute
-- vim.keymap.set("n", "gr", require("substitute").operator, { noremap = true, desc = "Substitute" })
-- vim.keymap.set("n", "grr", require("substitute").line, { noremap = true, desc = "Substitute line" })
-- vim.keymap.set("n", "grS", require("substitute").eol, { noremap = true, desc = "Substitute to end of line" })
-- vim.keymap.set("x", "gr", require("substitute").visual, { noremap = true, desc = "Substitute visual" })

-- Unmap lsp default keymaps
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")

-- remap % to ctrl m for matching pairs like (), [], {} and html tags
vim.keymap.set("n", "<C-m>", "%", { noremap = true, desc = "Match pairs" })

-- Disable `q` for macro recording as default
-- Set initial state for 'q'
vim.g.q_record_macro = false
vim.keymap.set("n", "q", "<Nop>", { noremap = true })

-- Function to toggle 'q' functionality
function _G.toggle_q_macro()
  if vim.g.q_record_macro then
    -- If currently set for recording macros, make 'q' do nothing
    vim.keymap.set("n", "q", "<Nop>", { noremap = true })
    vim.g.q_record_macro = false
    vim.print("Macro recording disabled")
  else
    -- If currently set to do nothing, make 'q' record macros
    vim.keymap.set("n", "q", "q", { noremap = true })
    vim.g.q_record_macro = true
    vim.print("Macro recording enabled")
  end
end

vim.keymap.set(
  "n",
  "<leader>uq",
  "<cmd>lua _G.toggle_q_macro()<CR>",
  { noremap = true, silent = true, desc = "Toggle 'q' Functionality" }
)

-- Open powershell terminal in a new buffer
vim.keymap.set("n", "<leader>tm", function()
  vim.cmd("term pwsh")
  vim.cmd("setlocal nonumber norelativenumber")
  vim.cmd("startinsert")
end, { noremap = true, desc = "Open powershell terminal in a new buffer without line numbers" })

-- Exit terminal mode
vim.keymap.set("t", "<A-a>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Remap Alt+; to % in normal, visual, and operator-pending modes
vim.keymap.set({ "n", "x", "o" }, "<A-;>", "<plug>(MatchitNormalForward)")

-- New line below without cursor
vim.keymap.set("i", "<C-S-CR>", "<CR><esc>kA", { noremap = true, silent = true })

-- Enalble c-v for paste in command mode
vim.keymap.set("c", "<C-v>", "<C-r>+")

-- Remap find files
vim.keymap.set("n", "<C-p>", LazyVim.pick("files"), { noremap = true, desc = "Find Files (Root Dir)" })

-- Switch buffers
vim.keymap.set(
  "n",
  "<Tab>",
  "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
  { noremap = true, desc = "Find Files (Root Dir)" }
)

-- Grep search
vim.keymap.set("n", "<C-S-f>", LazyVim.pick("live_grep"), { noremap = true, desc = "Grep (Root Dir)" })
-- fzf search
vim.keymap.set("v", "<C-f>", function()
  local text = vim.getVisualSelection()
  require("fzf-lua").grep_curbuf({ search = text })
end, { desc = "Search buffer with exact visual selection" })

vim.keymap.set("n", "<C-f>", function()
  require("fzf-lua").grep_curbuf()
end, { desc = "Search buffer" })

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})
  text = string.gsub(text, "\n", "")
  return text
end
