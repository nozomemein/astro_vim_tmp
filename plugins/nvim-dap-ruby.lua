return {
  "suketa/nvim-dap-ruby",
  lazy = false,
  config = function()
    require("dap-ruby").setup()
  end
}
