require("settings")
require("keybinds")
require("plugins")
require("status-bar")

local directoryPath = "~/.config/nvim/lua/plugins"
local fileList = {}

--executing a command to get every file name(with extension) on the directory plugins
local command = "ls -p " .. directoryPath .. " | grep -v /"

local fileHandle = io.popen(command)
--a String with the name of every file in plugins/
local output = fileHandle:read("*a")
fileHandle:close()

-- iterating over the individual files name
for file in output:gmatch("[^\r\n]+") do
  local fileName = string.sub(file, 0, string.len(file)-4)
  require("plugins." .. fileName)
end

--Rust LSP
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
    end,
  },
})
