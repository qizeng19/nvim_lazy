-- https://github.com/ray-x/lsp_signature.nvimsign
--
return {
	"ray-x/lsp_signature.nvim",
	event = "LspAttach",
	config = function()
		require("lsp_signature").setup()
	end
}
