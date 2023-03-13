" Vim Config based on Tim Pope's sensible.vim
"
syntax enable
filetype plugin indent on

set expandtab tabstop=3 shiftwidth=3 smarttab nowrap textwidth=0
set autoindent smartindent
set fileformats=unix,dos
set splitbelow splitright

set hidden autoread
set backspace=indent,eol,start

set complete-=i
set nrformats-=o
set timeout ttimeoutlen=100
set incsearch

set shortmess+=I
set ruler laststatus=2 cmdheight=1 showmode
set scrolloff=2 sidescrolloff=8
set display+=lastline

set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set history=2000
set viminfo^=!

if !exists('g:loaded_matchit') &&
  \ findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if exists(':Man') != 2 && !exists('g:loaded_man') && 
  \ &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

" Open file at last position when closed
augroup QOL
   au!
   autocmd BufReadPost *
   \ if line("'\"") >= 1 && line("'\"") <= line("$") 
     \ && &ft !~# 'commit'
   \ |   exe "normal! g`\""
   \ | endif
augroup END

" Appearance
" Place highlight overrides in ColorFix function below.
"
if &t_Co == 8 && $TERM !~# '^Eterm'
   set t_Co=16
else
   set t_Co=256
   set termguicolors
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

func! ColorFix()
   hi Comment cterm=italic ctermfg=7 gui=italic guifg=#777777
   hi Normal guibg=#171717
   hi Visual guibg=#000000
   hi NonText guibg=NONE guifg=#777777
   hi CursorLine guibg=#000000
   hi ColorColumn guibg=#272727
   hi CursorColumn guibg=#2F2F2F
   hi Keyword guifg=#9977AA
   hi Statement guifg=#9977AA
endfu

augroup Appearance
   au!
   autocmd ColorScheme * silent call ColorFix()
augroup END

set background=dark
colorscheme desert
