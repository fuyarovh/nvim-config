return {
	'echasnovski/mini.nvim',
	version = false,
	config = function ()
		require('mini.animate').setup {
			cursor = {
				enable = false,
			},
			scroll = {
				enable = false,
			}
		}
		local gen_loader = require('mini.snippets').gen_loader
		require('mini.snippets').setup({
			snippets = {
				gen_loader.from_lang()
			}
		})
		require('mini.notify').setup({
		})
	end
}
