require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "telescope find files" })
map("n", "<C-S-f>", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

map({ "n", "t" }, "<C-`>", function()
  require("nvchad.term").toggle { pos = "float", id = "vscodeFloatTerm" }
end, { desc = "terminal toggle floating term" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
