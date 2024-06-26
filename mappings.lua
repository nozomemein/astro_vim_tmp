-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<S-l>"] = {"$"},
    ["<S-h>"] = {"^"},
    ["K"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "LSP Hover" }, -- flutter-tools対応
    ["gd"] = { "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "LSP Go to Definition" }, -- flutter-tools対応
    ["<leader>rl"] = {":FlutterLspRestart<CR>", desc = "Restart Flutter LSP"},
    ["<leader>rn"] = {":RSpecNearest<CR>", desc = "Run nearest spec", silent = true},
    ["<leader>rf"] = {":RSpecCurrentFile<CR>", desc = "Run current file spec", silent = true},
    ["<leader>rr"] = {":RSpecRerun<CR>", desc = "Rerun spec", silent = true},
    ["<leader>rF"] = {":RSpecOnlyFailures<CR>", desc = "Run only failed spec", silent = true},
    ["<leader>rs"] = {":RSpecShowLastResult<CR>", desc = "Show spec results", silent = true},
    ["<leader>rd"] = {"<cmd>lua require('user.rspec-docker').run_docker_rspec()<CR>", desc = 'Run Rspec in Docker'}, --docker rspecのコマンド

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-l>"] =  { 'copilot#Accept("<CR>")', silent = true, expr = true, script = true, replace_keycodes = false },
  },
  x = {
    ["p"] = { '"_dP', desc = "Paste without yanking", silent = true },
  }
}
