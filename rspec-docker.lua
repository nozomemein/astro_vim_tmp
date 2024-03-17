local M ={}
local test_outputs = {}

local function extract_summary(outputs)
  for _, line in ipairs(outputs) do
    if line:match("%d+ examples?, %d+ failures?") then
      return line
    end
  end
  return "No summary found"
end

local function create_progress_window()
  local message = "Running Rspec in Docker..."

end

function M.run_docker_rspec()
  local rspec_runnig = true
  local path = vim.fn.expand('%')
  local cmd = "docker compose exec puma bundle exec rspec " .. path
  vim.fn.jobstart(cmd, {
    on_stdout = function(_, data)
      if data then
        for _, line in ipairs(data) do
          if line ~= "" then
            table.insert(test_outputs, line)
          end
        end
      end
    end,
    stdout_buffered = true,
    stderr_buffered = true,
    on_exit = function()
      local summary = extract_summary(test_outputs)
      vim.api.nvim_echo({{summary, "None"}}, true, {})
      test_outputs = {}
      rspec_runnig = false
    end
  })
end



return M
