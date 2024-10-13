-- local Path = require("utils.path")
--
-- local function find_files_from_project_git_root()
--   local opts = {}
--   if Path.is_git_repo() then
--     opts = {
--       cwd = Path.get_git_root(),
--     }
--   end
--   require("telescope.builtin").find_files(opts)
-- end
--
-- local function find_in_current_buffer()
--   require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
--     winblend = 10,
--     previewer = true,
--   }))
-- end
--
-- local function get_buffers()
--   require("telescope.builtin").buffers({
--     sort_mru = true,
--     ignore_current_buffer = true,
--     show_all_buffers = true,
--   })
-- end
--
-- local function live_grep_from_project_git_root()
--   local opts = {}
--
--   if Path.is_git_repo() then
--     opts = {
--       cwd = Path.get_git_root(),
--     }
--   end
--
--   require("telescope.builtin").live_grep(opts)
-- end
--
-- return {
--   {
--     "nvim-telescope/telescope.nvim",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "debugloop/telescope-undo.nvim",
--       {
--         "nvim-telescope/telescope-fzf-native.nvim",
--         build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
--       },
--     },
--     config = function()
--       local telescope = require("telescope")
--       local actions = require("telescope.actions")
--       telescope.load_extension("fzf")
--
--       telescope.setup({
--         extensions = {
--           fzf = {
--             fuzzy = true, -- false will only do exact matching
--             override_generic_sorter = true, -- override the generic sorter
--             override_file_sorter = true, -- override the file sorter
--             case_mode = "smart_case", -- or "ignore_case" or "respect_case"
--             -- the default case_mode is "smart_case"
--           },
--         },
--         defaults = {
--           prompt_prefix = "   ",
--           initial_mode = "insert",
--           selection_strategy = "reset",
--           sorting_strategy = "ascending",
--           layout_strategy = "horizontal",
--           layout_config = {
--             horizontal = {
--               prompt_position = "top",
--               preview_width = 0.55,
--               results_width = 0.8,
--             },
--             vertical = {
--               mirror = false,
--             },
--             width = 0.87,
--             height = 0.80,
--             preview_cutoff = 120,
--           },
--           path_display = { "truncate" },
--           mappings = {
--             i = {
--               ["<A-a>"] = actions.close,
--               ["<C-j>"] = actions.move_selection_next,
--               ["<C-k>"] = actions.move_selection_previous,
--               ["<C-v>"] = function()
--                 vim.cmd("normal! p")
--                 vim.cmd("startinsert!")
--               end,
--             },
--           },
--         },
--       })
--     end,
--     keys = {
--       -- add <leader>fa to find all, including hidden files
--       {
--         "<C-p>",
--         "<cmd> Telescope find_files follow=true hidden=true <CR>",
--         desc = "Find All Files (including hidden)",
--       },
--       -- add <leader>fl to live grep from git root
--       {
--         "<C-S-f>",
--         function()
--           live_grep_from_project_git_root()
--         end,
--         desc = "Live Grep From Project Git Root",
--       },
--       {
--         "<Tab>",
--         function()
--           get_buffers()
--         end,
--         desc = "Search Recent Buffers",
--       },
--       -- {
--       --   "<C-f>",
--       --   function()
--       --     find_in_current_buffer()
--       --   end,
--       --   desc = "Search Recent Buffers",
--       -- },
--       {
--         "<leader><leader>",
--         false,
--       },
--       {
--         "<leader>fu",
--         "<cmd> Telescope undo <CR>",
--         desc = "Undo History",
--       },
--       -- add <leader>fg to find files from project git root
--     },
--   },
-- }

local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  keys = {
    -- add a keymap to browse plugin files
    -- stylua: ignore
    { "<leader>/", false},
    { "<leader><leader>", false },
    { "<Tab>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffer" },
    { "<C-p>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { "<C-S-f>", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    { "<leader>fu", "<cmd> Telescope undo <CR>", desc = "Undo History" },
  },
  -- change some options
  opts = {
    defaults = {
      prompt_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      path_display = { "truncate" },
      mappings = {
        i = {
          ["<A-a>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-v>"] = function()
            vim.cmd("normal! p")
            vim.cmd("startinsert!")
          end,
          ["<A-w>"] = actions.select_horizontal,
          ["<A-v>"] = actions.select_vertical,
        },
      },
    },
  },
}
