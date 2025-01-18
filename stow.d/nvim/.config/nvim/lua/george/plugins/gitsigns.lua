return {
	"lewis6991/gitsigns.nvim",
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

				local function map(mode, keys, func, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, keys, func, opts)
				end

				local nbufmap = function(keys, func, desc)
					vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				nbufmap(']c',
					function()
						if vim.wo.diff then return ']c' end
						vim.schedule(function() gs.next_hunk() end)
						return '<Ignore>'
					end,
					"Next hunk"
				)

				nbufmap('[c',
					function()
						if vim.wo.diff then return '[c' end
						vim.schedule(function() gs.prev_hunk() end)
						return '<Ignore>'
					end,
					"Prevous hunk"
				)

				-- Actions
				nbufmap('<leader>hs', gs.stage_hunk, "Stage Hunk")
				nbufmap('<leader>hr', gs.reset_hunk, "Reset Hunk")
				map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
				map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
				nbufmap('<leader>hS', gs.stage_buffer, "Stage Buffer")
				nbufmap('<leader>hu', gs.undo_stage_hunk, "Undo Stage Hunk")
				nbufmap('<leader>hR', gs.reset_buffer, "Reset Buffer")
				nbufmap('<leader>hp', gs.preview_hunk, "Preview Hunk")
				nbufmap('<leader>hb', function() gs.blame_line { full = true } end, "Blame Line")
				nbufmap('<leader>tb', gs.toggle_current_line_blame, "Toggle Current Line Blame")
				nbufmap('<leader>hd', gs.diffthis, "Diff This")
				nbufmap('<leader>hD', function() gs.diffthis('~') end, "Diff This")
				nbufmap('<leader>td', gs.toggle_deleted, "Toggle Deleted")

				-- Text object
				map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
			end
		}
	end
}
