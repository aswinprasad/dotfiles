return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<C-b>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    { "<C-e>", "<cmd>Neotree focus<cr>", desc = "Neotree focus" },
  },
  opts = {
    filesystem = {
      use_libuv_file_watcher = false,
    },
    window = {
      width = 30,
      mappings = {
        ["o"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        ["Z"] = "system_open",
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()

        -- Check OS type
        local os_name = vim.loop.os_uname().sysname

        if os_name == "Windows_NT" then
          -- Windows specific handling
          local lastSlashIndex = path:match("^.+()\\[^\\]*$")
          local p = lastSlashIndex and path:sub(1, lastSlashIndex - 1) or path
          vim.cmd("silent !start explorer " .. p)
        elseif os_name == "Darwin" then
          -- macOS handling
          local parent_path = vim.fn.fnamemodify(path, ":h")
          vim.fn.jobstart({ "open", parent_path }, { detach = true })
        else
          -- Linux/Unix handling (optional)
          vim.fn.jobstart({ "xdg-open", path }, { detach = true })
        end
      end,
    },
  },
}
