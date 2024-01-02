local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-h>a", mark.add_file, { desc = "harpoon: add file" })
vim.keymap.set("n", "<C-h>s", ui.toggle_quick_menu, {desc = "harpoon: show files"})

vim.keymap.set("n", "<C-h>1", function() ui.nav_file(1) end, {desc = "harpoon: jump to file 1"})
vim.keymap.set("n", "<C-h>2", function() ui.nav_file(2) end, {desc = "harpoon: jump to file 2"})
vim.keymap.set("n", "<C-h>3", function() ui.nav_file(3) end, {desc = "harpoon: jump to file 3"})
vim.keymap.set("n", "<C-h>4", function() ui.nav_file(4) end, {desc = "harpoon: jump to file 4"})

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-h>n", function() harpoon:list():next() end, {desc = "harpoon: next in list"})
vim.keymap.set("n", "<C-h>p", function() harpoon:list():prev() end, {desc = "harpoon: prev in list"})
