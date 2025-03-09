return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>/", false },
    { "<C-i>", false },
  },
  opts = {
    keymap = {
      -- Below are the default binds, setting any value in these tables will override
      -- the defaults, to inherit from the defaults change [1] from `false` to `true`
      builtin = {
        -- neovim `:tmap` mappings for the fzf win
        -- true,        -- uncomment to inherit all the below in your custom config
        ["<A-a>"] = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
      },
    },
    previewers = {
      builtin = {
        -- fzf-lua is very fast, but it really struggled to preview a couple files
        -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
        -- It turns out it was Treesitter having trouble parsing the files.
        -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
        -- (Yes, I know you shouldn't have 100KB minified files in source control.)
        syntax_limit_b = 1024 * 100, -- 100KB
      },
    },
  },
}
