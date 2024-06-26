-- Orignally from: https://medium.com/indian-coder/supercharge-flutter-with-neovim-a-complete-setup-guide-cbe5cbf5b073
lvim.plugins = {
  -- for DAP support
  { "mfussenegger/nvim-dap" },
  -- for auto install mason packages
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = { "prettier", "emmet_language_server", }
    },
  },
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
              args = { "flutter" }
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
  {
    "ThePrimeagen/vim-be-good",
    -- lazy = false,
  },
  -- {
  -- "folke/tokyonight.nvim",
  -- config = true,
  -- },
}

--custom statuscolumn
-- vim.opt.numberwidth = 3
-- vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"
vim.opt.relativenumber = true     -- relative line numbers
vim.opt.wrap = true               -- wrap lines
vim.opt.clipboard = "unnamedplus" -- yank uses system clipboard
-- uncomment this if you want to use the custom theme
-- lvim.colorscheme = "tokyonight"
-- lvim.transparent_window = true
-- makes dart format your code on save
vim.g.dart_format_on_save = true
-- makes formatter on save
lvim.format_on_save.enabled = true
-- keybinds
vim.api.nvim_set_keymap('n', '<C-z>', '<NOP>', { noremap = true, silent = true })

--Automatically clone flutter snippets
local snippet_path = vim.fn.expand("~/.config/lvim/snippets/awesome-flutter-snippets")
if vim.fn.isdirectory(snippet_path) == 0 then
  local result = vim.fn.system({ "git", "clone", "https://github.com/Nash0x7E2/awesome-flutter-snippets", snippet_path })
  if result ~= 0 then
    print("Flutter Snippets installation failed. Error code: " .. result)
  end
end

-- makes prettier as formatter
-- see https://dev.to/datner/configuring-eslint-and-prettier-in-lunarvim-bonus-tailwindcss-2211
require "lvim.lsp.null-ls.formatters".setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact", "html" },
  },
}

-- git clone https://github.com/Nash0x7E2/awesome-flutter-snippets ~/.config/lvim/snippets/awesome-flutter-snippets
-- for more info see : https://github.com/sambergo/lunarvim-snippet-examples
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/lvim/snippets/awesome-flutter-snippets" } })

require("lvim.lsp.manager").setup("emmet_language_server")
