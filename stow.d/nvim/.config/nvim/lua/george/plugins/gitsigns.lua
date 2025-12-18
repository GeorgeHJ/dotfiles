return {
	"lewis6991/gitsigns.nvim",
	dependencies = { "folke/which-key.nvim" },
	config = function()
		require('gitsigns').setup {
			signs                        = {
				add          = { text = '│' },
				change       = { text = '│' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir                 = {
				follow_files = true
			},
			attach_to_untracked          = true,
			current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts      = {
				virt_text = true,
				virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
			sign_priority                = 6,
			update_debounce              = 100,
			status_formatter             = nil, -- Use default
			max_file_length              = 40000, -- Disable if file is longer than this (in lines)
			preview_config               = {
				-- Options passed to nvim_open_win
				border = 'single',
				style = 'minimal',
				relative = 'cursor',
				row = 0,
				col = 1
			},
			on_attach                    = function(bufnr)
				local gs = package.loaded.gitsigns
				local wk = require("which-key")

				wk.add({
					{
						icon = { icon = "󰊢", color = "cyan" },
						mode = { "n" },
						-- Navigation
						{
							']c',
							function()
								if vim.wo.diff
								then
									vim.cmd.normal({ ']c', bang = true })
								else
									vim.schedule(function() gs.next_hunk() end)
								end
							end,
							desc = "Next hunk",
							buffer = bufnr
						},
						{
							'[c',
							function()
								if vim.wo.diff
								then
									vim.cmd.normal({ '[c', bang = true })
								else
									vim.schedule(function() gs.prev_hunk() end)
								end
							end,
							desc = "Previous hunk",
							buffer = bufnr
						},
						{'<leader>h', group = "Git"},
						-- Actions
						{ '<leader>hs', gs.stage_hunk,                                desc = "Stage hunk",        buffer = bufnr },
						{ '<leader>hr', gs.reset_hunk,                                desc = "Reset hunk",        buffer = bufnr },
						{ '<leader>hS', gs.stage_buffer,                              desc = "Stage buffer",      buffer = bufnr },
						{ '<leader>hu', gs.undo_stage_hunk,                           desc = "Undo stage hunk",   buffer = bufnr },
						{ '<leader>hR', gs.reset_buffer,                              desc = "Reset buffer",      buffer = bufnr },
						{ '<leader>hp', gs.preview_hunk,                              desc = "Preview hunk",      buffer = bufnr },
						{ '<leader>hb', function() gs.blame_line { full = true } end, desc = "Blame line",        buffer = bufnr },
						{ '<leader>tb', gs.toggle_current_line_blame,                 desc = "Toggle line blame", buffer = bufnr },
						{ '<leader>hd', gs.diffthis,                                  desc = "Diff this",         buffer = bufnr },
						{ '<leader>hD', function() gs.diffthis('~') end,              desc = "Diff this ~",       buffer = bufnr },
						{ '<leader>td', gs.toggle_deleted,                            desc = "Toggle deleted",    buffer = bufnr },
					},
					{
						mode = { "v" },
						{ '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, desc = "Stage hunk", buffer = bufnr },
						{ '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, desc = "Reset hunk", buffer = bufnr },
					},
					{
						mode = { "o", "x" },
						{ 'ih', ':<C-U>Gitsigns select_hunk<CR>', desc = "Select hunk", buffer = bufnr },
					}
				})
			end
		}
	end
}
