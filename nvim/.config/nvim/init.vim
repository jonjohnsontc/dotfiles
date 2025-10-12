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

" Detect terminal background and set Neovim background accordingly
lua << EOF
-- Function to detect terminal background color
local function detect_background()
  -- Method 1: Check COLORFGBG environment variable (common in many terminals)
  local colorfgbg = vim.env.COLORFGBG
  if colorfgbg then
    -- COLORFGBG format is "foreground;background"
    -- Background value: 0-6 = dark, 7-15 = light
    local bg = colorfgbg:match(";(%d+)$")
    if bg then
      bg = tonumber(bg)
      if bg and bg >= 0 and bg <= 6 then
        vim.o.background = 'dark'
        return
      elseif bg and bg >= 7 then
        vim.o.background = 'light'
        return
      end
    end
  end

  -- Method 2: For macOS, check if using dark mode via system preference
  if vim.fn.has('mac') == 1 then
    local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
    if handle then
      local result = handle:read("*a")
      handle:close()
      if result and result:match("Dark") then
        vim.o.background = 'dark'
        return
      else
        vim.o.background = 'light'
        return
      end
    end
  end

  -- Fallback: default to dark
  vim.o.background = 'dark'
end

-- Detect on startup
detect_background()
EOF

colorscheme github-monochrome

