set nocompatible

" Using Vundle.vim
" Instalation:
" git clone https://github.com/VundleVim/Vundle.vim.git
" ~/.vim/bundle/Vundle.vim

" -------------------------- Vundle {{{

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
Plugin 'neovimhaskell/haskell-vim'
Plugin 'itchyny/vim-haskell-indent'

" ================== Completers ===================
" Plugin 'Townk/vim-autoclose'
" Plugin 'Rip-Rip/clang_complete'
" Plugin 'scrooloose/syntastic'
Plugin 'lyokha/vim-xkbswitch'
" Plugin 'vim-xkbswitch'
Plugin 'lervag/vimtex'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'ervandew/supertab'

" ================== Navigation ===================
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'zhou13/vim-easyescape'
" Plugin 'yuttie/comfortable-motion.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'pelodelfuego/vim-swoop' " <leader>l
" ================== Ranger ===================
" Plugin 'Mizuchi/vim-ranger'
Plugin 'rafaqz/ranger.vim'
" Plugin 'francoiscabrol/ranger.vim'

" ================== Misc ===================
" Plugin 'simmel/vim-pastie'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-fugitive'
Plugin 'mmedvede/w3m.vim'
Plugin 'dodie/vim-disapprove-deep-indentation' " ಠ_ಠ
Plugin 'fidian/hexmode'
" Plugin 'mikewest/vimroom'
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'
Plugin 'jceb/vim-orgmode'
" Plugin ''

call vundle#end()

filetype plugin indent on
" }}}
" -------------------------- Vim {{{

set background=dark
" colorscheme molokai
colorscheme wal
set guifont=DroidSansMonoForPowerline\ Nerd\ Font\ 12
set fileencodings=ucs-bom,utf8,cp1251,default,latin1
set spelllang=ru_yo,en_us
set scrolloff=4
" highlight lCursor guifg=NONE guibg=Cyan

" separate backups
" NB: both folders has to be created
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp//

" This is for working across multiple xterms and/or gvims
" Transfer/read and write one block of text between vim sessions (capture whole line):
" Write
nmap ;w :. w! ~/.vimxfer<CR>
vmap ;w :'<,'> w! ~/.vimxfer<CR>
" Read
nmap ;r :r ~/.vimxfer<CR>
" Append
nmap ;a :. w! >>~/.vimxfer<CR>
vmap ;a :'<,'> w! >>~/.vimxfer<CR>

map <silent> - :nohls<CR>

map n nzz
map N Nzz

" moving through splits
nnoremap <leader>v <C-w>v
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" cycling through buffers
map <right> <ESC>:bn<RETURN>
map <left> <ESC>:bp<RETURN>

" }}}
" -------------------------- Airline {{{
" don't hide statusbar
set laststatus=2

let g:airline_powerline_fonts=0
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#default#layout=[ ['a', 'b', 'c'], ['x', 'y', 'z'] ]

" set the CN (column number) symbol:
" let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

if empty($DISPLAY)
	let g:airline#extensions#xkblayout#enabled = '0'
endif

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = '' " e0b0
let g:airline_left_alt_sep = ""
"
let g:airline_right_sep = '' "e0b1
let g:airline_right_alt_sep = ''
" let g:airline_right_sep = "" "e0b6

" let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'

let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '☰'
" let g:airline_symbols.maxlinenr = ''

" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'

let g:airline_symbols.branch = ''
" let g:airline_symbols.branch = '⎇'

let g:airline_symbols.readonly = ''
" let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" }}}
" -------------------------- NERD {{{
" map <c-n> :NERDTreeToggle<CR>
" let g:nerdtree_tans_open_on_console_startup=1
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
" -------------------------- NERDcommenter {{{
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailningWhitespace=1

" }}}
" -------------------------- Syntastic {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" }}}
" -------------------------- YouCompleteMe {{{
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='/home/mikle/.config/.ycm_extra_conf.py'
" let g:ycm_key_list_select_completion=['<TAB>']
" let g:ycm_key_list_previous_completion=['<S-TAB>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_disable_for_files_larger_than_kb = 30

nnoremap <leader>ji :YcmCompleter GoToImprecise<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jj :YcmCompleter GoTo<CR>
nnoremap <leader>jf :YcmCompleter FixIt<CR>
nnoremap <leader>jt :YcmCompleter GetType<CR>

" }}}
" -------------------------- SuperTab {{{

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" }}}
" -------------------------- Tagbar {{{
nmap <F8> :TagbarToggle<CR>

" }}}
" -------------------------- vim-autoclose {{{
let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}

" }}}
" -------------------------- XKB-switch {{{
" set keymap=russian-jcukenwin
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = "/usr/local/lib/libxkbswitch.so"
" let g:XkbSwitchIMappings = ['ru']
" set iminsert=0
" set imsearch=0

" }}}
" -------------------------- Vim-Markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
set nofoldenable

" }}}
" -------------------------- Ranger {{{

" " ranger by rafaqz
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

" " vim-ranger by Mizuchi
" let g:ranger_executable = 'ranger'
" let g:ranger_on_exit = 'bw!'
" let g:ranger_open_mode = 'tabe'
" map <leader>f :tabe %:p:h<cr>

" }}}
" -------------------------- Vimtex {{{
let g:vimtex_enabled = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0

if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

autocmd FileType haskell call SetHsEnv()
function! SetHsEnv()
	setlocal tabstop=8 expandtab
	setlocal softtabstop=4 shiftwidth=4
	setlocal shiftround
endfunction

autocmd FileType tex call SetTexEnv()
function! SetTexEnv()
	" Get spellcheck
	setlocal spell
	" Wrap lines (as I work on half screen with preview)
	setlocal wrap nolist linebreak
	" indent lines after wrap
	setlocal breakindent breakindentopt=shift:2
	" Fix navigation
	nnoremap <buffer> j gj
	nnoremap <buffer> k gk

	" Make tabs default width
	setlocal softtabstop=2 shiftwidth=2
	" Disable length mark
	setlocal colorcolumn=0
	" get spell check working
	nnoremap <buffer> <leader>s hea<C-x><C-s>
endfunction

" }}}
" -------------------------- easyescape {{{

" let g:easyescape_chars = { "j": 1, "k": 1 }
" let g:easyescape_timeout = 100
" cnoremap jk <ESC>
" cnoremap kj <ESC>

" }}}
" -------------------------- UniSnips {{{

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" }}}
" -------------------------- Goyo {{{
function! s:goyo_enter()
	set wrap
	set linebreak
	set nolist
	nnoremap j gj
	nnoremap k gk
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()

nnoremap <silent> <leader>z :Goyo<cr>

" }}}
" -------------------------- Coolstuff {{{
" TODO: look into this

" ]p -- paste with indent

" compiler gcc
set wildmenu
set wildmode=list:longest,full

" inoremap jj <Esc> -- kinda already jk
" imap ii <C-[>
" nnoremap jjjj <Nop>

" tf is this?
set incsearch
set nohidden
" let g:clipbrdDefaultReg = '+'

nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

set autochdir
" autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
" autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
" map <leader>cd :cd %:h

" set cul
" hi CursorLine term=none cterm=none ctermbg=3

set ttyfast
set undolevels=1000
set updatecount=100
set complete=.,w,b,u,U,t,i,d
set noerrorbells
set visualbell
set t_vb=

map <leader>tl :set list!<cr>
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
" set listchars=eol:§,tab:¤›,extends:»,precedes:«,nbsp:‡
match ErrorMsg '\s\+$'

iab AlP ABCDEFGHIJKLMNOPQRSTUVWXYZ
iab MoN January February March April May June July August September October November December
iab MoO Jan Feb Mar Apr May Jun Jul Aug Sep Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
iab NuM 12345678901234567890123456789012345678901234567890123456789012345678901234567890
iab RuL ----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8----+----9----+----0

" nnoremap ; :
" nnoremap : ;

" set tags=tags;/

" }}}
" vim: fdm=marker:
