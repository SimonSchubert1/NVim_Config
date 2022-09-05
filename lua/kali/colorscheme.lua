vim.cmd "colorscheme darkplus"

local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorschem " .. colorscheme)
if not status_ok then
    vim.notify("colorschem " .. colorschem .. "not found!")
    return
end
