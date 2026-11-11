-- vim.pack.add {
-- 	{src = 'https://github.com/neovim/nvim-lspconfig'},
-- }
vim.lsp.inlay_hint.enable(true)
vim.lsp.enable('jdtls')
vim.lsp.enable('intelephense')
vim.lsp.enable('vue_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pyrefly')
vim.lsp.enable('qmlls')
vim.lsp.enable('clangd')
vim.lsp.enable('nushell')
vim.lsp.enable('tombi')
vim.lsp.enable('texlab')
vim.lsp.config('lua_ls', {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT'
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				}
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				-- library = vim.api.nvim_get_runtime_file("", true)
			}
		})
	end,
	settings = {
		Lua = {}
	}
})
vim.lsp.enable('lua_ls')
vim.lsp.config("ltex_plus", {
  filetypes = {
    -- Prose / markup
    "bib",
    "context",
    "gitcommit",
    "html",
    "markdown",
    "org",
    "pandoc",
    "plaintex",
    "quarto",
    "mail",
    "mdx",
    "rmd",
    "rnoweb",
    "rst",
    "tex",
    "text",
    "typst",
    "xhtml",

    -- Programming languages
    "bash",
    "c",
    "cpp",
    "cs",
    "clojure",
    "coffee",
    "dart",
    "elixir",
    "elm",
    "elixir",
    "erlang",
    "fsharp",
    "fortran",
    "go",
    "groovy",
    "haskell",
    "java",
    "javascript",
    "javascriptreact",
    "julia",
    "kotlin",
    "lisp",
    "lua",
    "matlab",
    "perl",
    "perl6",
    "php",
    "powershell",
    "puppet",
    "python",
    "r",
    "ruby",
    "rust",
    "scala",
    "sql",
    "swift",
    "typescript",
    "typescriptreact",
    "verilog",
    "vb",
  },

  settings = {
    ltex = {
      language = "en-US",

      enabled = {
        -- Prose / markup
        "bib",
        "context",
        "gitcommit",
        "html",
        "markdown",
        "org",
        "pandoc",
        "plaintex",
        "quarto",
        "mail",
        "mdx",
        "rmd",
        "rnoweb",
        "rst",
        "tex",
        "latex",
        "text",
        "typst",
        "xhtml",

        -- Programming languages
        "shellscript",
        "c",
        "csharp",
        "cpp",
        "clojure",
        "coffeescript",
        "dart",
        "elixir",
        "elm",
        "elisp",
        "emacs-lisp",
        "erlang",
        "fsharp",
        "fortran-modern",
        "go",
        "groovy",
        "haskell",
        "java",
        "javascript",
        "javascriptreact",
        "julia",
        "kotlin",
        "lisp",
        "lua",
        "matlab",
        "perl",
        "perl6",
        "php",
        "powershell",
        "puppet",
        "python",
        "r",
        "ruby",
        "rust",
        "scala",
        "sql",
        "swift",
        "typescript",
        "typescriptreact",
        "verilog",
        "vb",
      },
    },
  },
})

vim.lsp.enable("ltex_plus")
vim.filetype.add({
  pattern = {
    [".*"] = {
      function(path)
        local name = vim.fs.basename(path)

        if not name:find(".", 1, true) then
          return "text"
        end
      end,
      { priority = -math.huge },
    },
  },
})
