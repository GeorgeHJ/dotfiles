local opt = vim.opt_local

opt.wrap = true
opt.linebreak = true
opt.list = false
opt.formatoptions:remove('l')
opt.textwidth = 80
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.commentstring = "<!--%s-->"
vim.keymap.set("n", "j", "gj", { buffer = true })
vim.keymap.set("n", "k", "gk", { buffer = true })
