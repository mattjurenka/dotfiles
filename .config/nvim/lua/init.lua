-- Editor Config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Keymap Config
local opts = { noremap = true, silent = true }

-- lsp saga
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- ctrl s to save
vim.keymap.set('n', '<c-s>', '<Cmd>w<CR>', opts)
vim.keymap.set('i', '<c-s>', '<Cmd>w<CR>', opts)

-- ctrl t for newtab, tab + s-tab to switch tabs, ctrl q to exit window
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', '<c-t>', '<Cmd>tabnew<CR>', opts)
vim.keymap.set('i', '<c-t>', '<Cmd>tabnew<CR>', opts)
vim.keymap.set('n', '<c-q>', '<Cmd>q<CR>', opts)
vim.keymap.set('i', '<c-q>', '<Cmd>q<CR>', opts)

local signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = 'ﴞ ',
}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  virtual_text = {
    source = true,
  },
})
