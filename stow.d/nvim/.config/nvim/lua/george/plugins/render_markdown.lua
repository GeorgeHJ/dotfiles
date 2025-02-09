return {
	'MeanderingProgrammer/render-markdown.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup(
			{
				file_types = { "markdown", "vimwiki" },
				bullet = { right_pad = 2 },
				heading = {
					backgrounds = {
						'RenderMarkdownH1Bg',
						'RenderMarkdownH2Bg',
						'RenderMarkdownH3Bg',
						'RenderMarkdownH4Bg',
						'RenderMarkdownH5Bg',
						'RenderMarkdownH6Bg',
					},
					foregrounds = {
						'RenderMarkdownH1',
						'RenderMarkdownH2',
						'RenderMarkdownH3',
						'RenderMarkdownH4',
						'RenderMarkdownH5',
						'RenderMarkdownH6',
					},
				}
			}
		)
		vim.cmd([[
		  highlight RenderMarkdownH1 guifg=#7d9bd7 gui=bold
		  highlight RenderMarkdownH2 guifg=#7d9bd7 gui=bold
		  highlight RenderMarkdownH3 guifg=#7d9bd7 gui=bold
		  highlight RenderMarkdownH4 guifg=#7d9bd7 gui=bold
		  highlight RenderMarkdownH5 guifg=#7d9bd7 gui=bold
		  highlight RenderMarkdownH6 guifg=#7d9bd7 gui=bold
		  highlight RenderMarkdownH1Bg guifg=#7d9bd7 guibg=#242435 gui=bold
		  highlight RenderMarkdownH2Bg guifg=#7d9bd7 guibg=#242435 gui=bold
		  highlight RenderMarkdownH3Bg guifg=#7d9bd7 guibg=#242435 gui=bold
		  highlight RenderMarkdownH4Bg guifg=#7d9bd7 guibg=#242435 gui=bold
		  highlight RenderMarkdownH5Bg guifg=#7d9bd7 guibg=#242435 gui=bold
		  highlight RenderMarkdownH6Bg guifg=#7d9bd7 guibg=#242435 gui=bold
		]])
	end
}
