return {
  {
    "github/copilot.vim",
    lazy=false,
  },
  {
    "slim-template/vim-slim",
    lazy=false,
  },
  {
    "tpope/vim-rails",
    lazy=false,
  },
  {
    "noprompt/vim-yardoc",
    lazy=false,
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {
        fvm = true,
        flutter_path = "/opt/homebrew/bin/dart", -- brewでinstallしたdartのパスにしないとLSPが動かない
      }
    end,
  }
}
