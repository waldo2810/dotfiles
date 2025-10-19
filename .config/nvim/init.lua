require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.lazy")

local function set_background_from_macos()
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    if not handle then return end
    local result = handle:read("*a")
    handle:close()

    if result:match("Dark") then
        vim.o.background = "dark"
    else
        vim.o.background = "light"
    end
end

-- set_background_from_macos()
