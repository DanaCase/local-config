"for allowing vundles
"set     nocompatible
"filetype plugin indent on
"filetype plugin on
"syntax on

set backspace=2
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
set t_Co=256
set background=dark
let g:solarized_temrcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set encoding=utf8
set guifont=Source\ Code\ Pro\ Light:h12
"let g:php_annotations_syntax=1
imap jj <ESC>
imap JJ <ESC>
imap jJ <ESC>
imap Jj <ESC>

" set auto indent and bind F9 to tun it off (when pasting)
" -- use = to automatically reindent
set autoindent
set smartindent
set pastetoggle=<F9>
au InsertLeave * set nopaste

" set soft tabs to 4 spaces in all cases
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"show hidden files 
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree

"call ag instead of ack
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

"lets you use the god damned mouse like a human
set mouse=a

"lets you specify local vimrc
"
"let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}

"When opening or creating a .vue file set the filetype to HTML for proper rendering
autocmd BufNewFile,BufRead *.vue set filetype=html 

"autocmd BufNewFile,BufRead *.ts set filetype=typescript

"set runtimepath^=~/.vim/bundle/ctrlp.vim


call plug#begin('~/.vim/plugged')
Plug 'drewtempelmeyer/palenight.vim'
"Plug  'wookiehangover/jshint.vim'
Plug  'pangloss/vim-javascript'
"Plug  'othree/javascript-libraries-syntax.vim'
Plug  'mxw/vim-jsx'
Plug  'othree/html5.vim'
Plug  'qbbr/vim-symfony'
"Plug  'gregsexton/matchtag'
Plug  'maksimr/vim-jsbeautify'
Plug  'chase/vim-ansible-yaml'
Plug  'ervandew/supertab'
"Plug  'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug  'mmozuras/snipmate-mocha'
Plug  'posva/vim-vue'
"Plug  'MarcWeber/vim-addon-local-vimrc'
"Plug 'Glench/Vim-Jinja2-Syntax'
Plug  'lepture/vim-jinja'
Plug  'majutsushi/tagbar'
Plug  'vim-syntastic/syntastic'
Plug 'chriskempson/base16-vim'
Plug 'digitaltoad/vim-jade'
Plug 'Quramy/tsuquyomi'
Plug 'tpope/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"Plug 'jparise/vim-graphql'
Plug 'chrisbra/unicode.vim'

"npm install instant-markdown
"Plug 'suan/vim-instant-markdown'

"pip install instant-rst
Plug 'gu-fan/InstantRst'

Plug 'dearrrfish/vim-applescript'

"LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

"Rust
Plug 'simrat39/rust-tools.nvim'

"Auto Complete
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'

"Syntax
Plug 'nvim-treesitter/nvim-treesitter'

"Debug
Plug 'puremourning/vimspector'

"Ui
Plug 'voldikss/vim-floaterm'

"Tree
Plug  'scrooloose/nerdtree'

"html
Plug  'vim-scripts/closetag.vim'
Plug  'mattn/emmet-vim'

"comments
Plug  'scrooloose/nerdcommenter'

"Search
Plug  'mileszs/ack.vim'
"replaced fzf.vim with fzf lua because I hear its faster
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
" optional for icon support
Plug 'nvim-tree/nvim-web-devicons'

"git
Plug  'tpope/vim-fugitive'

"note taking
Plug  'vimwiki/vimwiki'

"LLM 
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'


call plug#end()


" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/code/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

let g:used_javascript_libs = 'jquery,underscore,angularjs,angularuirouter,react'

"Jinja comments
let g:NERDAltDelims_jinja = 1
"jsx comments
let g:NERDCustomDelimiters = { 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }

"Syntastic checkers
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_typescript_checkers = ['tslint'] " You shouldn't use 'tsc' checker.

" Hex read
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>

" Hex write
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

"ctrl p ignore
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

colorscheme palenight

set shell=bash\ -i

"" Statusline (requires Powerline font)
set statusline=
set statusline+=%(%{&buflisted?bufnr('%'):''}\ >\ %)
set statusline+=%< " Truncate line here
set statusline+=%f\  " File path, as typed or relative to current directory
set statusline+=%{&modified?'+\ ':''}
set statusline+=%{&readonly?'🔒':''}
set statusline+=%= " Separation point between left and right aligned items
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
set statusline+=%(\ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
set statusline+=%-2v " Virtual column number
set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G|

" ------------------------ 8< ------------------------

" Statusline with highlight groups (requires Powerline font, using Solarized theme)
"set statusline=
"set statusline+=%(%{&buflisted?bufnr('%'):''}\ \ %)
"set statusline+=%< " Truncate line here
"set statusline+=%f\  " File path, as typed or relative to current directory
"set statusline+=%{&modified?'+\ ':''}
"set statusline+=%{&readonly?'\ ':''}
"set statusline+=%1*\  " Set highlight group to User1
"set statusline+=%= " Separation point between left and right aligned items
"set statusline+=\ %{&filetype!=#''?&filetype:'none'}
"set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  "\.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
"set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
"set statusline+=\ %* " Restore normal highlight
"set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
"set statusline+=%-2v " Virtual column number
"set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G|

"" Logic for customizing the User1 highlight group is the following
"" - if StatusLine colors are reverse, then User1 is not reverse and User1 fg = StatusLine fg
"hi StatusLine cterm=reverse gui=reverse ctermfg=14 ctermbg=8 guifg=#93a1a1 guibg=#002732
"hi StatusLineNC cterm=reverse gui=reverse ctermfg=11 ctermbg=0 guifg=#657b83 guibg=#073642
"hi User1 ctermfg=14 ctermbg=0 guifg=#93a1a1 guibg=#073642

lua require('init')

"Lots of inspo from: https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
