require "nvchad.options"

-- add yours here!

local function python3_version_ok()
  local out = vim.fn.systemlist({ "python3", "-c", "import sys; print('.'.join(map(str, sys.version_info[:2])))" })

  if vim.v.shell_error ~= 0 or #out == 0 then
    return false
  end

  local major, minor = out[1]:match("^(%d+)%.(%d+)$")
  major, minor = tonumber(major), tonumber(minor)

  return major ~= nil and minor ~= nil and (major > 3 or (major == 3 and minor >= 10))
end

local function prepend_python_path()
  local candidates = {
    "/opt/homebrew/opt/python@3.12/libexec/bin",
    "/usr/local/opt/python@3.12/libexec/bin",
    "/opt/homebrew/opt/python@3.11/libexec/bin",
    "/usr/local/opt/python@3.11/libexec/bin",
    "/opt/homebrew/opt/python@3.10/libexec/bin",
    "/usr/local/opt/python@3.10/libexec/bin",
  }

  for _, path in ipairs(candidates) do
    if vim.fn.isdirectory(path) == 1 then
      vim.env.PATH = path .. ":" .. vim.env.PATH
      return
    end
  end
end

if not python3_version_ok() then
  prepend_python_path()
end

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
