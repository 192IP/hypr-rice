" Инициализация vim-plug
call plug#begin('~/.config/nvim/plugged')

" Плагины
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

call plug#end()

" Настройка плагинов
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp"},
  highlight = { enable = true },
}

local lspconfig = require'lspconfig'
lspconfig.clangd.setup{}

local cmp = require'cmp'
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
})
EOF

" Общие настройки
set number
set relativenumber
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
