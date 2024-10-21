-- Function to open the newest image in the test/screenshot directory
function OpenLatestWallabyScreenshot()
  -- Specify the directory path
  local screenshot_dir = "test/screenshots"

  -- Run shell command to find the newest file
  local find_cmd = string.format("ls -t %s | head -n 1", screenshot_dir)

  -- Get the newest file
  local handle = io.popen(find_cmd)
  local newest_file = ""
  if handle then
    newest_file = handle:read("*a")
    handle:close()
  else
    print("Failed to find screenshot directory: ", screenshot_dir)
  end

  -- Trim any newlines
  newest_file = newest_file:gsub("%s+", "")

  -- Construct the full path to the file
  local full_path = screenshot_dir .. "/" .. newest_file

  -- Use the system's open command to open the image
  if newest_file ~= "" then
    vim.fn.jobstart({ "open", full_path }, { detach = true })
    print("Opening: " .. full_path)
  else
    print("No screenshots found.")
  end
end

-- Create a Neovim command to call the function
vim.api.nvim_create_user_command("OpenLatestWallabyScreenshot", OpenLatestWallabyScreenshot, {})
