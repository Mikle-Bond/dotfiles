set nocompatible

" Using Vundle.vim
" Instalation:
" git clone https://github.com/VundleVim/Vundle.vim.git
" ~/.vim/bundle/Vundle.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  
Plugin 'gmarik/Vundle.vim'

" ================== Colorchemes ===================
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dylanaraps/wal.vim'

" ================== Syntaxes ===================
" GLSL syntax
Plugin 'fmoralesc/vim-pinpoint'
Plugin 'sophacles/vim-processing'
Plugin 'tikhomirov/vim-glsl'
Plugin 'aklt/plantuml-syntax'
" flex, bison and c syntaxes
Plugin 'justinmk/vim-syntax-extra' 
" Needs to be together
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" ================== Completers ===================
" Plugin 'Townk/vim-autoclose'
" Plugin 'Rip-Rip/clang_complete'
" Plugin 'scrooloose/syntastic'
Plugin 'lyokha/vim-xkbswitch'
" Plugin 'vim-xkbswitch'

" ================== Navigation ===================
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'rafaqz/ranger.vim'
Plugin 'francoiscabrol/ranger.vim'

" ================== Misc ===================
" Plugin 'simmel/vim-pastie'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-fugitive'
Plugin 'mmedvede/w3m.vim'
Plugin 'dodie/vim-disapprove-deep-indentation'
Plugin 'fidian/hexmode'
" Plugin ''

call vundle#end()
    
filetype plugin indent on
     
" set mouse=a
set spelllang=ru_yo,en_us
" set keymap=russian-jcukenwin
" set iminsert=0
" set imsearch=0
" highlight lCursor guifg=NONE guibg=Cyan

" ---------------------------------
" Plugins Section

" -------------------------- Theme
" color gamma
set background=dark

" main color theme
"colorscheme molokai
colorscheme wal

" -------------------------- Airline
" don't hide statusbar
set laststatus=2

let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#default#layout=[
			\ ['a', 'b', 'c'],
			\ ['x', 'y', 'z']
			\ ]

if empty($DISPLAY)
	let g:airline#extensions#xkblayout#enabled = '0'
endif

  "if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
  "endif

  "" unicode symbols
  "let g:airline_left_sep = '»'
  "let g:airline_left_sep = '▶'
  "let g:airline_right_sep = '«'
  "let g:airline_right_sep = '◀'
  "let g:airline_symbols.crypt = '🔒'
  "let g:airline_symbols.linenr = '␊'
  "let g:airline_symbols.linenr = '␤'
  "let g:airline_symbols.linenr = '¶'
  "let g:airline_symbols.maxlinenr = '☰'
  "let g:airline_symbols.maxlinenr = ''
  "let g:airline_symbols.branch = '⎇'
  "let g:airline_symbols.paste = 'ρ'
  "let g:airline_symbols.paste = 'Þ'
  "let g:airline_symbols.paste = '∥'
  "let g:airline_symbols.spell = 'Ꞩ'
  "let g:airline_symbols.notexists = '∄'
  "let g:airline_symbols.whitespace = 'Ξ'

" -------------------------- NERD
" nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
map <c-n> :NERDTreeToggle<CR>
let g:nerdtree_tans_open_on_console_startup=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -------------------------- NERDcommenter
let g:NERDSpaceDelims=1

" -------------------------- Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" -------------------------- YCM 
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='/home/mikle/.config/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=['<TAB>']
let g:ycm_key_list_previous_completion=['<S-TAB>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_server_python_interpreter='/usr/bin/python2'

nnoremap <leader>ji :YcmCompleter GoToImprecise<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jj :YcmCompleter GoTo<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>

" -------------------------- Tagbar
nmap <F8> :TagbarToggle<CR>

" -------------------------- vim-autoclose
let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}

" -------------------------- XKB-switch
let g:XkbSwitchEnable = 1
let g:XkbSwitchLib = "/usr/local/lib/libxkbswitch.so"
let g:XkbSwitchIMapings = ['ru']

" -------------------------- Vim-Markdown
let g:vim_markdown_folding_disabled = 1
set nofoldenable

" -------------------------- Navigation

nnoremap <leader>v <C-w>v
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k



" ranger by rafaqz
" map <leader>rr :RangerEdit<cr>
" map <leader>rv :RangerVSplit<cr>
" map <leader>rs :RangerSplit<cr>
" map <leader>rt :RangerTab<cr>
" map <leader>ri :RangerInsert<cr>
" map <leader>ra :RangerAppend<cr>
" map <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@

" ranger by francoiscabol
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

