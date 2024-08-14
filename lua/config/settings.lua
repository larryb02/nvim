-- Enable filetype detection, plugins, and indentation
vim.cmd('filetype plugin indent on')

-- Set tab width to 4 spaces
vim.opt.tabstop = 4

-- Set shift width to 4 spaces
vim.opt.shiftwidth = 4

-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.cmd.syntax('on')
vim.cmd.set('number')
vim.cmd.set('cursorline')
vim.cmd.colorscheme('habamax')
