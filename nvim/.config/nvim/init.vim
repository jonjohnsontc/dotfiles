source ~/.vimrc

call plug#begin()
Plug 'ellisonleao/gruvbox.nvim'
Plug 'SebastianZaha/nvim-solar-paper'
Plug 'ericbn/vim-solarized'
Plug 'ItsTerm1n4l/spice.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'greggh/claude-code.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'idr4n/github-monochrome.nvim'
call plug#end()

lua require('claude-code').setup()
lua vim.lsp.enable('rust_analyzer')

" Recommended telescope remappings from telescope getting started
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ls <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

