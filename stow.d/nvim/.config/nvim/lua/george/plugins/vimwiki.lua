return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_ext2syntax = {
			[".md"] = 'markdown',
			['.markdown'] = 'markdown',
			['.mdown'] = 'markdown'
		}
		vim.g.vimwiki_global_ext = 0
		vim.g.vimwiki_auto_chdir = 1
		vim.g.vimwiki_filetypes = { "markdown" }
		vim.g.vimwiki_list = {
			{
				name = "Notes",
				path = "~/Documents/Notes/",
				index = "index",
				ext = ".md",
				syntax = "markdown",
				auto_diary_index = 1,
				diary_caption_level = -1,
				links_space_char = "_",
				auto_tags = 1
			},
		}
		vim.cmd(
			[[
				augroup VimWikiDiary
				autocmd!
					autocmd BufNewFile ~/Documents/Notes/diary/* read !fortune|sed -e 's/\(^\)/\1> /'
					autocmd BufNewFile ~/Documents/Notes/diary/* :g/^$/d
					autocmd BufNewFile ~/Documents/Notes/diary/* :norm G2o
				augroup END
				]])
	end,
}
