return {
	init_options = {
		settings = {
			lint = {
				select = {
					"I", -- Import-related checks (isort)
					"E", -- pycodestyle errors
					"W", -- pycodestyle warnings
					"F", -- Pyflakes checks (error prevention)
					"B", -- flake8-bugbear best practices
					"ANN", -- Type annotations enforcement
					"D", -- Docstring conventions (PEP 257)
					"C4", -- Comprehensions
					"C90", -- mccabe
				}
			}
		}
	}
}
