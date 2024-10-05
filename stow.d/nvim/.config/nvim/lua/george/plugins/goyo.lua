return {
	{
		"junegunn/goyo.vim",
		dependencies = { "junegunn/limelight.vim" },
		init = function()
			vim.cmd([[
		function! s:goyo_enter()
			set nocursorline
			set noshowmode
			set noshowcmd
			set scrolloff=999
			setlocal linebreak
			setlocal formatoptions=l
			setlocal noexpandtab
			setlocal spell
			nnoremap j gj
			nnoremap k gk
			set mouse=
			lua require('lualine').hide()
			Limelight
		endfunction

		function! s:goyo_leave()
			set scrolloff=5
			set mouse=a
			set cursorline
			set showmode
			set showcmd
			setlocal nolinebreak
			map k k
			map j j
			setlocal nospell
			lua require('lualine').hide({unhide=true})
			Limelight!
		endfunction

		if has('autocmd')
			augroup Goyo
				autocmd!
				autocmd! User GoyoEnter nested call <SID>goyo_enter()
				autocmd! User GoyoLeave nested call <SID>goyo_leave()
			augroup END
		endif
			
		]])

			local k = vim.keymap
			k.set("n", "<leader>o", ":Goyo<cr>", { noremap = true, silent = true, desc = "Toggle Goyo" })
		end

	}
}
