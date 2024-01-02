vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.smarttab = true

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.formatoptions = "tcqjr"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Natural splits
vim.opt.splitright = true
vim.opt.splitbelow = true

