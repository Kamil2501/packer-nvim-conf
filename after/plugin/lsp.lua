local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'eslint', 'rust_analyzer'},
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  mapping = cmp.mapping.preset.insert({
	  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	  ['<Tab>'] = cmp.mapping.confirm({select=true}),
  })
})
