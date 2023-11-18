-- Orignally from: https://medium.com/indian-coder/supercharge-flutter-with-neovim-a-complete-setup-guide-cbe5cbf5b073
lvim.plugins = {
  -- for DAP support
  { "mfussenegger/nvim-dap" },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require('flutter-tools').setup {
       -- (uncomment below line for windows only)
       -- flutter_path = "home/flutter/bin/flutter.bat",

        debugger = {
          -- make these two params true to enable debug mode
          enabled = false,
          run_via_dap = false,
          register_configurations = function(_)

             require("dap").adapters.dart = {
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
                args = {"flutter"}
              }

            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = '~/Development/flutter/bin/cache/dart-sdk/',
                flutterSdkPath = '~/Development/flutter/',
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              }
            }
            -- uncomment below line if you've launch.json file already in your vscode setup
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        dev_log = {
          -- toggle it when you run without DAP
          enabled = false,
          open_cmd = "tabedit",
        },
        lsp = {
          on_attach = require("lvim.lsp").common_on_attach,
          capabilities = require("lvim.lsp").default_capabilities,
        },

      }
    end
  },
  -- for dart syntax hightling
  {
    "dart-lang/dart-vim-plugin"
  },
}
-- git clone https://github.com/Nash0x7E2/awesome-flutter-snippets ~/.config/lvim/snippets/awesome-flutter-snippets
require("luasnip/loaders/from_vscode").load { paths = { "~/.config/lvim/snippets/awesome-flutter-snippets" } }