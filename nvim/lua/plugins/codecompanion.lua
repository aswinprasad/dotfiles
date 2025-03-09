return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
    strategies = {
      --NOTE: Change the adapter as required
      chat = {
        adapter = "copilot",
        keymaps = {
          hide = {
            modes = {
              n = "q",
            },
            callback = function(chat)
              chat.ui:hide()
            end,
            description = "AI: Hide the chat buffer",
          },
        },
        slash_commands = {
          ["buffer"] = {
            opts = {
              provider = "fzf_lua", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["file"] = {
            opts = {
              provider = "fzf_lua", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["help"] = {
            opts = {
              provider = "fzf_lua", -- telescope|mini_pick|fzf_lua
            },
          },
          ["symbols"] = {
            opts = {
              provider = "fzf_lua", -- default|telescope|mini_pick|fzf_lua
            },
          },
        },
      },
      inline = { adapter = "copilot" },
      agent = { adapter = "copilot" },
    },
    opts = {
      log_level = "DEBUG",
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-3.5-sonnet",
            },
          },
        })
      end,
    },
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionActions",
    "CodeCompanionChat",
  },
  keys = {
    {
      "<leader>ap",
      "<cmd>CodeCompanionActions<cr>",
      mode = { "n", "v" },
      desc = "codecompanion: actions",
    },
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Toggle<cr>",
      mode = { "n", "v" },
      desc = "codecompanion: toggle chat",
    },
    {
      "<leader>ag",
      "<cmd>CodeCompanionChat Add<cr>",
      mode = "v",
      desc = "codecompanion: add to chat",
    },
    {
      "<leader>ac",
      ":CodeCompanionChat /buffer<Space>",
      mode = { "n", "v" },
      desc = "codecompanion: chat with buffer",
    },
  },
  init = function()
    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cabbrev cc CodeCompanion]])
  end,
}
