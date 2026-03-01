local o = vim.o

-- General settings
o.number = true
o.termguicolors = true
o.mouse = "a"
o.cursorline = true
o.scrolloff = 5
o.list = true
o.showmode = false

-- Indentation
o.tabstop = 4
o.shiftwidth = 4

-- Search and Substitute
o.inccommand = "nosplit"
o.ignorecase = true
o.smartcase = true

-- Folds and View
o.foldlevel = 99
o.foldlevelstart = 99
o.viewoptions = "folds,cursor"

-- Undo file and Spellfile
o.undofile = true
local spelldir = vim.fn.stdpath("data") .. "/spell/"
vim.fn.mkdir(spelldir, "p")
local spellfile = spelldir .. "en.utf-8.add"
o.spellfile = spellfile
