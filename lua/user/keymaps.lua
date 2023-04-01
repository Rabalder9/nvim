local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>e", ":Lex 30<cr>", opts)
--keymap("n", "<leader>r", ":VimtexTocToggle<cr>", opts)
keymap("n", "<leader>p", ":w | :! pdflatex %<CR><CR> | :! biber %:r <CR> | :! pdflatex %<CR><CR>", opts)
keymap("n", "<leader>j", ":wincmd h<cr>", opts)
keymap("n", "<leader>k", ":wincmd l<cr>", opts)

vim.cmd [[map <leader>z :! zathura %<.pdf &<CR><CR>]]
vim.cmd [[map <leader>c :%y+<CR>]]

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local insert_cite = Terminal:new({ cmd = "insert_cite", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

function _insert_cite_toggle()
  insert_cite:toggle()
end

keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
keymap("n", "<leader>s", "<cmd>lua _insert_cite_toggle()<CR>", {noremap = true, silent = true})





-- Visual mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "A-j", ":m .+1<CR>==", opts)
keymap("v", "A-k", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)


