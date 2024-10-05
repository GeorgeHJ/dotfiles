" Appearance mods
" syntax match mkdListItem "^*" conceal cchar=•
syn match  mkdListItem      "^\s*[-*+]\s\+"                       contains=mkdListTab,mkdListBullet2
syn match  mkdListItem      "^\s*\d\+\.\s\+"                      contains=mkdListTab
syn match  mkdListTab       "^\s*\*"                              contained contains=mkdListBullet1
syn match  mkdListBullet1   "\*"                                  contained conceal cchar=•
syn match  mkdListBullet2   "[-*+]"                               contained conceal cchar=•
syntax match todoCheckbox "\[\ \]" conceal cchar=
syntax match todoCheckbox "\[X\]" conceal cchar=
syntax match todoCheckbox "\[\.\]" conceal cchar=󰄗
syntax match todoCheckbox "\[o\]" conceal cchar=󰡖
