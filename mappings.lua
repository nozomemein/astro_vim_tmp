-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
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
    ["<S-k>"] = {"{"},
    ["<S-j>"] = {"}"},
    ["<leader>rn"] = {":RSpecNearest<CR>", desc = "Run nearest spec", silent = true},
    ["<leader>rf"] = {":RSpecCurrentFile<CR>", desc = "Run current file spec", silent = true},
    ["<leader>rr"] = {":RSpecRerun<CR>", desc = "Rerun spec", silent = true},
    ["<leader>rF"] = {":RSpecOnlyFailures<CR>", desc = "Run only failed spec", silent = true},
    ["<leader>rs"] = {":RSpecShowLastResult<CR>", desc = "Show spec results", silent = true},

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-i>"] =  { 'copilot#Accept("<CR>")', silent = true, expr = true },
  }
}
