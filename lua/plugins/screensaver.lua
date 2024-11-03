local typing_active = false
local typing_speed_variation = { 50, 150 } -- Speed range for dynamic typing
local current_char_index = 0 -- Start at 0 to include the first character
local current_code = ''

-- TypeScript code generation components
local types = { 'string', 'number', 'boolean', 'any', 'void' }
local var_names = { 'foo', 'bar', 'baz', 'qux', 'value', 'result', 'data', 'config' }
local functions = { 'getData', 'calculate', 'process', 'init', 'fetchValue', 'update', 'handleEvent', 'setConfig' }
local class_names = { 'User', 'DataService', 'Calculator', 'Logger', 'AppController', 'HttpService' }
local interfaces = { 'IData', 'IService', 'ICalculator', 'IUser', 'ILogger' }

-- Randomly select a type, variable, function, and class name
local function random_from_table(tbl)
  return tbl[math.random(#tbl)]
end

-- Generate valid TypeScript class code with methods and properties
local function generate_typescript_class()
  local class_name = random_from_table(class_names)
  local method_name = random_from_table(functions)
  local return_type = random_from_table(types)
  local param_name = random_from_table(var_names)
  local param_type = random_from_table(types)
  local property_name = random_from_table(var_names)
  local property_type = random_from_table(types)

  -- Generate a valid TypeScript class
  return string.format(
    [[
class %s {
  private %s: %s;

  constructor(%s: %s) {
    this.%s = %s;
  }

  public %s(): %s {
    return this.%s;
  }
}

const instance = new %s('%s');
console.log(instance.%s());
]],
    class_name,
    property_name,
    property_type,
    param_name,
    param_type,
    property_name,
    param_name,
    method_name,
    return_type,
    property_name,
    class_name,
    random_from_table(var_names),
    method_name
  )
end

-- Generate valid TypeScript interface
local function generate_typescript_interface()
  local interface_name = random_from_table(interfaces)
  local method_name = random_from_table(functions)
  local return_type = random_from_table(types)
  local param_name = random_from_table(var_names)
  local param_type = random_from_table(types)

  return string.format(
    [[
interface %s {
  %s(%s: %s): %s;
}
]],
    interface_name,
    method_name,
    param_name,
    param_type,
    return_type
  )
end

-- Combine random code structures into a valid TypeScript block
local function generate_random_typescript_code()
  local random_code = generate_typescript_interface() .. '\n\n' .. generate_typescript_class()
  return random_code
end

-- Function to simulate dynamic typing of generated code
local function simulate_dynamic_typing()
  if not typing_active then
    return
  end

  -- Fetch the next character from the current_code
  if current_char_index < #current_code then
    -- Type one character at a time (including the first character)
    local next_char = current_code:sub(current_char_index + 1, current_char_index + 1)
    vim.api.nvim_input(next_char)
    current_char_index = current_char_index + 1
  else
    -- If the current snippet is fully typed, generate new code and reset indices
    vim.api.nvim_input '<CR>'
    current_code = generate_random_typescript_code() -- Generate new TypeScript code
    current_char_index = 0 -- Reset to 0 to ensure the first character is typed
  end

  -- Continue typing after a random delay
  vim.defer_fn(simulate_dynamic_typing, math.random(typing_speed_variation[1], typing_speed_variation[2]))
end

-- Function to apply syntax highlighting
local function apply_syntax_highlighting()
  vim.cmd 'set filetype=typescript' -- Set the file type for proper syntax highlighting
end

-- Command to start dynamic TypeScript typing simulation
vim.api.nvim_create_user_command('StartDynamicTyping', function()
  if not typing_active then
    typing_active = true
    current_code = generate_random_typescript_code() -- Generate initial code
    current_char_index = 0 -- Ensure first character is included
    apply_syntax_highlighting() -- Ensure the code is properly highlighted
    simulate_dynamic_typing()
    print 'Dynamic TypeScript typing started!'
  end
end, {})

-- Command to stop the dynamic typing simulation
vim.api.nvim_create_user_command('StopDynamicTyping', function()
  typing_active = false
  print 'Dynamic typing stopped!'
end, {})

-- Toggle command to start/stop typing simulation
vim.api.nvim_create_user_command('ToggleDynamicTyping', function()
  if typing_active then
    vim.cmd 'StopDynamicTyping'
  else
    vim.cmd 'StartDynamicTyping'
  end
end, {})
