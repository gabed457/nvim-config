-- Bruno API Collections Configuration-- Bruno API Collections Configuration-- Bruno Collections Configuration

-- Add your Bruno collection paths here

-- Configure your API collections for backend development-- Add your Bruno collection paths here

local M = {}

-- ════════════════════════════════════════════════════════════════════════════-- Each collection should point to the root directory containing bru files

-- API Collections

-- Uncomment and modify these, or add your own

M.collections = {

  -- {local M = {}return {

  --   name = 'Backend API',

  --   path = '~/projects/api/bruno',  collections = {

  --   env = 'local',

  --   base_url = 'http://localhost:3000',-- ┌──────────────────────────────────────────────────────────────────────────┐    -- Example: Add your Bruno collections here

  -- },

  -- {-- │                           API COLLECTIONS                                 │    -- Uncomment and modify these examples, or add your own:

  --   name = 'User Service',

  --   path = '~/projects/users/bruno',-- │  Add your Bruno collections below. Each collection represents an API      │    

  --   env = 'dev',

  --   base_url = 'http://localhost:3001',-- │  project with its own environment variables and base URLs.                │    -- {

  -- },

}-- └──────────────────────────────────────────────────────────────────────────┘    --   name = "My API",



-- Environment presets    --   path = "~/projects/my-api/bruno",

M.environments = {

  local_dev = {M.collections = {    --   env = "dev", -- default environment

    name = 'local',

    variables = {  -- ──────────────────────────────────────────────────────────────────────────    -- },

      BASE_URL = 'http://localhost:3000',

      API_VERSION = 'v1',  -- Example: Main Backend API    -- {

    },

  },  -- ──────────────────────────────────────────────────────────────────────────    --   name = "Work Project",

  dev = {

    name = 'dev',  -- {    --   path = "~/work/project/api-collection",

    variables = {

      BASE_URL = 'https://dev-api.example.com',  --   name = 'Backend API',    --   env = "local",

      API_VERSION = 'v1',

    },  --   path = '~/projects/backend-api/bruno',    -- },

  },

  staging = {  --   env = 'local',    -- {

    name = 'staging',

    variables = {  --   description = 'Main backend microservice',    --   name = "Personal",

      BASE_URL = 'https://staging-api.example.com',

      API_VERSION = 'v1',  --   base_url = 'http://localhost:3000',    --   path = "/Users/username/Documents/bruno-collections/personal",

    },

  },  -- },    --   env = "production",

  prod = {

    name = 'prod',    -- },

    variables = {

      BASE_URL = 'https://api.example.com',  -- ──────────────────────────────────────────────────────────────────────────  },

      API_VERSION = 'v1',

    },  -- Example: User Service  

  },

}  -- ──────────────────────────────────────────────────────────────────────────  -- Default settings for Bruno



-- Settings  -- {  settings = {

M.settings = {

  default_env = 'local',  --   name = 'User Service',    -- Default environment if not specified in collection

  show_headers = true,

  show_response_time = true,  --   path = '~/projects/user-service/api',    default_env = "dev",

  auto_save_responses = false,

  default_view = 'json',  --   env = 'dev',    

}

  --   description = 'User authentication and profiles',    -- Show response headers by default

-- Helper: Add a collection

function M.add_collection(name, path, env, vars)  --   base_url = 'http://localhost:3001',    show_headers = true,

  table.insert(M.collections, {

    name = name,  -- },    

    path = path,

    env = env or M.settings.default_env,    -- Show response time

    variables = vars or {},

  })  -- ──────────────────────────────────────────────────────────────────────────    show_response_time = true,

end

  -- Example: External APIs (third-party integrations)    

-- Helper: Get collection by name

function M.get_collection(name)  -- ──────────────────────────────────────────────────────────────────────────    -- Auto-save responses to file

  for _, col in ipairs(M.collections) do

    if col.name == name then  -- {    auto_save_responses = false,

      return col

    end  --   name = 'Stripe API',    

  end

  return nil  --   path = '~/bruno-collections/stripe',    -- Response body view: "json", "raw", "preview"

end

  --   env = 'test',    default_view = "json",

-- Helper: Get environment

function M.get_env(name)  --   description = 'Payment processing',  },

  return M.environments[name]

end  --   base_url = 'https://api.stripe.com',}



-- Helper: List collections  -- },

function M.list_collections()}

  local names = {}

  for _, col in ipairs(M.collections) do-- ┌──────────────────────────────────────────────────────────────────────────┐

    table.insert(names, col.name)-- │                          ENVIRONMENT PRESETS                              │

  end-- │  Define common environments with their configurations.                    │

  return names-- └──────────────────────────────────────────────────────────────────────────┘

end

M.environments = {

return M  local_dev = {

    name = 'local',
    variables = {
      BASE_URL = 'http://localhost:3000',
      API_VERSION = 'v1',
      AUTH_TOKEN = '',
    },
  },
  development = {
    name = 'dev',
    variables = {
      BASE_URL = 'https://dev-api.example.com',
      API_VERSION = 'v1',
      AUTH_TOKEN = '',
    },
  },
  staging = {
    name = 'staging',
    variables = {
      BASE_URL = 'https://staging-api.example.com',
      API_VERSION = 'v1',
      AUTH_TOKEN = '',
    },
  },
  production = {
    name = 'prod',
    variables = {
      BASE_URL = 'https://api.example.com',
      API_VERSION = 'v1',
      AUTH_TOKEN = '',
    },
  },
}

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                            GLOBAL SETTINGS                                │
-- └──────────────────────────────────────────────────────────────────────────┘

M.settings = {
  -- Default environment for new collections
  default_env = 'local',

  -- Response display settings
  default_view = 'body', -- 'body', 'headers', 'all'
  show_headers = true,
  show_response_time = true,
  show_status_code = true,

  -- Request settings
  timeout = 30000, -- 30 seconds
  follow_redirects = true,
  verify_ssl = true,

  -- Auto-save responses for debugging
  auto_save_responses = false,
  response_save_path = '~/.local/share/nvim/bruno-responses',

  -- Formatters (requires jq for JSON, xmllint for XML)
  formatters = {
    json = { 'jq', '.' },
    xml = { 'xmllint', '--format', '-' },
    html = { 'xmllint', '--format', '--html', '-' },
  },
}

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                         REQUEST TEMPLATES                                 │
-- │  Common request templates for quick API testing.                          │
-- └──────────────────────────────────────────────────────────────────────────┘

M.templates = {
  -- GET request template
  get = [[meta {
  name: {{NAME}}
  type: http
  seq: 1
}

get {
  url: {{BASE_URL}}/{{ENDPOINT}}
  body: none
  auth: {{AUTH_TYPE}}
}

headers {
  Content-Type: application/json
  Accept: application/json
}
]],

  -- POST request template
  post = [[meta {
  name: {{NAME}}
  type: http
  seq: 1
}

post {
  url: {{BASE_URL}}/{{ENDPOINT}}
  body: json
  auth: {{AUTH_TYPE}}
}

headers {
  Content-Type: application/json
  Accept: application/json
}

body:json {
  
}
]],

  -- PUT request template
  put = [[meta {
  name: {{NAME}}
  type: http
  seq: 1
}

put {
  url: {{BASE_URL}}/{{ENDPOINT}}
  body: json
  auth: {{AUTH_TYPE}}
}

headers {
  Content-Type: application/json
  Accept: application/json
}

body:json {
  
}
]],

  -- DELETE request template
  delete = [[meta {
  name: {{NAME}}
  type: http
  seq: 1
}

delete {
  url: {{BASE_URL}}/{{ENDPOINT}}
  body: none
  auth: {{AUTH_TYPE}}
}

headers {
  Content-Type: application/json
  Accept: application/json
}
]],

  -- Authenticated request with Bearer token
  auth_bearer = [[meta {
  name: {{NAME}}
  type: http
  seq: 1
}

{{METHOD}} {
  url: {{BASE_URL}}/{{ENDPOINT}}
  body: {{BODY_TYPE}}
  auth: bearer
}

headers {
  Content-Type: application/json
  Accept: application/json
  Authorization: Bearer {{AUTH_TOKEN}}
}
]],
}

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                        HELPER FUNCTIONS                                   │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Get a collection by name
function M.get_collection(name)
  for _, col in ipairs(M.collections) do
    if col.name == name then
      return col
    end
  end
  return nil
end

-- Get all collection names
function M.get_collection_names()
  local names = {}
  for _, col in ipairs(M.collections) do
    table.insert(names, col.name)
  end
  return names
end

-- Create a new request from template
function M.create_request(template_name, vars)
  local template = M.templates[template_name]
  if not template then
    return nil
  end

  local content = template
  for key, value in pairs(vars or {}) do
    content = content:gsub('{{' .. key .. '}}', value)
  end
  return content
end

return M
