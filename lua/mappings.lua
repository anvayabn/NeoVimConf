require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("c", "qqq", "qa")

-- mapping that is specifically for my to-do lists
-- The mapping creates the a new day template which can be filled

-- function to get current date and time
local function insert_date_time()
  local dateTime = os.date("[%m-%d-%Y][%H:%M:%S]")
  vim.api.nvim_put({dateTime}, 'l', true, true)
end
-- mapping to print current date and time 
map('n', 'cdt', insert_date_time, { noremap = true, silent = true, desc = "Insert Current Date and Time"})

local function insert_line_separator()
  local line = '----------------------------------------------------------'
  vim.api.nvim_put({line}, 'l', true, true)
end
-- mapping to insert line separtor
map('n', 'ls', insert_line_separator, { noremap = true, silent = true, desc = "Insert line Separator"})
local function insert_new_todo_sec()
  insert_line_separator()
  insert_date_time()
  insert_line_separator()
end
map("n", "tod", insert_new_todo_sec, {desc = "Insert new todo list section for this date"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
