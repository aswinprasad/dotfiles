return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Disable specific keymaps
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gr", false }
    keys[#keys + 1] = { "gR", false }
    keys[#keys + 1] = { "gD", false }
    keys[#keys + 1] = { "<c-k>", false, mode = "i" }

    -- Merge the existing opts with our new configuration
    return vim.tbl_deep_extend("force", opts, {
      servers = {
        html = {},
        cssls = {},
        tsserver = {
          enabled = false,
        },
        ts_ls = {
          enabled = false,
        },
        vtsls = {
          -- explicitly add default filetypes, so that we can extend
          -- them in related extras
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                maxInlayHintLength = 30,
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
          keys = {
            {
              "gD",
              false,
              -- function()
              --   local params = vim.lsp.util.make_position_params()
              --   LazyVim.lsp.execute({
              --     command = "typescript.goToSourceDefinition",
              --     arguments = { params.textDocument.uri, params.position },
              --     open = true,
              --   })
              -- end,
              desc = "Goto Source Definition",
            },
            {
              "gR",
              false,
              -- function()
              --   LazyVim.lsp.execute({
              --     command = "typescript.findAllFileReferences",
              --     arguments = { vim.uri_from_bufnr(0) },
              --     open = true,
              --   })
              -- end,
              desc = "File References",
            },
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
            {
              "<leader>cM",
              LazyVim.lsp.action["source.addMissingImports.ts"],
              desc = "Add missing imports",
            },
            {
              "<leader>cu",
              LazyVim.lsp.action["source.removeUnused.ts"],
              desc = "Remove unused imports",
            },
            {
              "<leader>cD",
              LazyVim.lsp.action["source.fixAll.ts"],
              desc = "Fix all diagnostics",
            },
            {
              "<leader>cV",
              function()
                LazyVim.lsp.execute({ command = "typescript.selectTypeScriptVersion" })
              end,
              desc = "Select TS workspace version",
            },
          },
        },
        emmet_language_server = {
          filetypes = {
            "css",
            "html",
            "xhtml",
            "xml",
            "htmldjango",
            "javascriptreact",
            "less",
            "pug",
            "sass",
            "scss",
            "typescriptreact",
          },
        },
      },
    })
  end,
}
