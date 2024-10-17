-- Configurable array of patterns to mask
local mask_patterns = { '_KEY', '_ENDPOINT', '_DATABASE' } -- Add more patterns as needed

local masked_lines = {} -- Table to store real values
local streaming_active = true -- Default streaming mode to ON

-- Function to check if a line matches any pattern
local function matches_mask_pattern(line)
  for _, pattern in ipairs(mask_patterns) do
    if line:match('.*' .. pattern .. '%s*=%s*.+') then
      return true
    end
  end
  return false
end

-- Function to update the masked_lines table with new real values when editing
local function update_real_values_in_buffer()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Loop through the buffer and update real values
  for lineno, line in ipairs(lines) do
    if matches_mask_pattern(line) then
      masked_lines[lineno] = line -- Save the updated real value
    end
  end
end

-- Function to mask variables matching the patterns visually (for display only)
local function mask_keys_in_buffer()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Loop through the buffer and mask keys
  for lineno, line in ipairs(lines) do
    if matches_mask_pattern(line) then
      -- Only store the real value if it's not already stored
      if not masked_lines[lineno] then
        masked_lines[lineno] = line -- Save the real value
      end

      -- Mask the value with asterisks visually only
      local masked_line = line:gsub('=.*$', '= ********')
      vim.api.nvim_buf_set_lines(0, lineno - 1, lineno, false, { masked_line })
    end
  end
end

-- Function to restore real values in the buffer
local function restore_real_keys_in_buffer()
  for lineno, real_value in pairs(masked_lines) do
    vim.api.nvim_buf_set_lines(0, lineno - 1, lineno, false, { real_value })
  end
end

-- Automatically restore real values before writing the file
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    if not streaming_active then
      update_real_values_in_buffer() -- Update real values with any edits before saving
    end
    restore_real_keys_in_buffer() -- Ensure real values are saved to disk
  end,
})

-- Reapply masking after saving the file, but only visually if streaming mode is on
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*',
  callback = function()
    if streaming_active then
      mask_keys_in_buffer() -- Mask the keys visually after saving
    end
  end,
})

-- Apply masking when opening a file or when text changes, only if streaming is active
vim.api.nvim_create_autocmd({ 'BufReadPost', 'TextChanged', 'TextChangedI' }, {
  pattern = '*',
  callback = function()
    if streaming_active then
      mask_keys_in_buffer() -- Mask keys when reading or editing
    end
  end,
})

-- Command to turn streaming mode ON
vim.api.nvim_create_user_command('StreamingOn', function()
  streaming_active = true
  mask_keys_in_buffer()
  print 'Streaming mode ON: Sensitive keys masked'
end, {})

-- Command to turn streaming mode OFF
vim.api.nvim_create_user_command('StreamingOff', function()
  streaming_active = false
  restore_real_keys_in_buffer() -- Restore real values when streaming mode is off
  print 'Streaming mode OFF: Sensitive keys restored'
end, {})

-- Ensure streaming mode is ON by default
vim.api.nvim_exec_autocmds('BufReadPost', {})
