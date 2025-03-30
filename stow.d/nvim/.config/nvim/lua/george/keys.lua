local k = vim.keymap

k.set({ "x", "n" }, "<C-y>", '"+y', { noremap = true, silent = true })
k.set({ "x", "n" }, "<C-p>", '"+p', { noremap = true, silent = true })
k.set("n", "<leader>z", ":set spell!<cr>", { noremap = true, silent = true, desc = "Toggle spellcheck" })

-- Delete new default LSP mappings
k.del('n', 'gri')
k.del('n', 'gra')
k.del('n', 'grr')
k.del('n', 'grn')
