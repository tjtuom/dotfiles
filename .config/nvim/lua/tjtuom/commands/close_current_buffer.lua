function CloseCurrentBuffer()
  local current_buf = vim.api.nvim_get_current_buf() -- Get the current buffer
  local next_buf = vim.fn.bufnr("#") -- Get the alternate buffer (previous buffer)

  if next_buf == -1 or not vim.api.nvim_buf_is_loaded(next_buf) then
    -- If no alternate buffer is found, load a new one
    next_buf = vim.fn.bufnr("$") -- Get the last buffer number
  end

  if next_buf == current_buf then
    -- If there are no other buffers, just create a new empty buffer
    vim.cmd("enew")
  else
    -- Switch to the next available buffer
    vim.cmd("buffer " .. next_buf)
  end

  -- Finally, close the current buffer
  vim.api.nvim_buf_delete(current_buf, { force = true })
end -- Function to open the newest image in the test/screenshot directory

-- Create a Neovim command to call the function
vim.api.nvim_create_user_command("CloseCurrentBuffer", CloseCurrentBuffer, {})
