" My .vimrc -- dguitarbite (dguitarbite@gmail.com)
" github.com/dguitarbite/dguitarbite

" ============================================
" Note to myself:
" Use vim or die
" ============================================

set nocompatible              " be iMproved, required
filetype off                  " Required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/vundle
call vundle#begin()         " Start Vundle Plugin Configuration

    " To add plugins, add the entries inside the vundle#begin/end block.
    " Syntax : Plugin '<author-name>/<repo-name>' For Github
    "        : Plugin '<complete URL to git repo>' For git repo
    "        : Plugin '<author>/<repo>, {'rtp': '$path/folder name'} rename
    "        : Plugin '<plugin-name>' If its a vim script like on vim-scripts.org

    " let Vundle manage Vundle
    Plugin 'gmarik/Vundle.vim'

    " Auto-Complete -- https://github.com/Valloric/YouCompleteMe (used by ultisnips)
    Plugin 'Valloric/YouCompleteMe'

    " Install Puppet Modules for Vim - https://github.com/rodjek/vim-puppet
    Plugin 'rodjek/vim-puppet'

    " TODO: Fill me !!!
    Plugin 'terryma/vim-multiple-cursors'

    " Install Syntastic https://github.com/scrooloose/syntastic
    Plugin 'scrooloose/syntastic'

    " Install Fugitive https://github.com/tpope/vim-fugitive
    Plugin 'tpope/vim-fugitive'

    " Install Tabular - https://github.com/godlygeek/tabular
    Plugin 'godlygeek/tabular'

    " NrrwRgn plugin
    Plugin 'chrisbra/NrrwRgn'

    " For Snipmate - Various Libraries required
    " https://github.com/tomtom/tlib_vim
    " https://github.com/MarcWeber/vim-addon-mw-utils.git
    Plugin 'tomtom/tlib_vim'
    Plugin 'MarcWeber/vim-addon-mw-utils'

    " Install Snipmate - https://github.com/garbas/vim-snipmate
    Plugin 'garbas/vim-snipmate'

    " Install a few snippets for snipmate https://github.com/honza/vim-snippets.git
    Plugin 'honza/vim-snippets'

    " More Pythonic Snippet https://github.com/SirVer/ultisnips
    Plugin 'SirVer/ultisnips'

    " Neo Complete https://github.com/Shougo/neocomplete.vim
    Plugin 'Shougo/neocomplete'

    " Install Status Plugin - Powerline https://github.com/Lokaltog/powerline
    Plugin 'Lokaltog/powerline'

    " Install CtrlP - https://github.com/kien/ctrlp.vim
    Plugin 'kien/ctrlp.vim'

    " Install Python Mode :: https://github.com/klen/python-mode
    Plugin 'klen/python-mode'

    " Install Licence Loader
    Plugin 'license-loader'

    " Time Tap
    Plugin 'TimeTap'

    " Maven Plugin
    Plugin 'maven-plugin'

    " Strip White Spaces at the end of lines
    Plugin 'StripWhiteSpaces'

    " Python Unit tests and MakeGreen bar
    Plugin 'pyunit.vim'
    Plugin 'reinh/vim-makegreen'

    " DocBook
    Plugin 'docbook44'

    " DocBook Helper
    Plugin 'docbkhelper'

    " Python Tools
    Plugin 'python-tools'

    " Python.vim
    Plugin 'python.vim'
    
    " Vim Rails
    Plugin 'tpope/vim-rails'
    
    " Vim Ruby
    Plugin 'vim-ruby/vim-ruby'
    
    " Vim Cucumber
    Plugin 'tpope/vim-cucumber'

    " All of your Plugins must be added before the following line
call vundle#end()            " End Vundle Plugin Configuration

filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Background type
set background=dark


" detect encoding
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" Configure CloseTag for XML/HTML only
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim


" Set indents,tabs as per languages
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79


" Keybindings for plugin toggle
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F5>
nmap <F6> :TagbarToggle<cr>
nmap <F7> :NERDTreeToggle<cr>
nmap <F8> :GundoToggle<cr>
nmap <F9> :IndentGuidesToggle<cr>
nmap <D-/> :
nnoremap <leader>a :Ack
nnoremap <leader>v V`]

set clipboard=unnamed

" Save in sudo mode
" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Mouse and backspace
set mouse=a
set backspace=2 " make backspace work like most other apps

" Rebind <Leader> key
let mapleader = ","


" Spellings (I do a lot of spelling mistakes)
nmap <silent> <leader>p :set spell<CR>
nmap <silent> <leader>P :set spell!<CR>


" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" Stop using arrow keys, learn VIM better ... lot better!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Bind Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Easier moving between tabs
map <Leader>N <esc>:tabprevious<CR>
map <Leader>M <esc>:tabnext<CR>


" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" NERDTree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" ZenCoding
let g:user_emmet_expandabbr_key='<C-j>'


" Minibuf shortcut mappings
nnoremap <Leader>m <esc>:bp<CR>
nnoremap <Leader>n <esc>:bn<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line. I use Minibuf
" instead.
" set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Status Line!
set statusline+=%n:             " - buffer number, followed by a colon
set statusline+=%<%f            " - relative filename, truncated from the left
set statusline+=\               " - a space
set statusline+=%h              " - [Help] if this is a help buffer
set statusline+=%m              " - [+] if modified, [-] if not modifiable
set statusline+=%r              " - [RO] if readonly
set statusline+=\               " - a space
set statusline+=%{fugitive#statusline()} " Add Vim Fugutive in the status line
set statusline+=\               " - a space
set statusline+=%=              " - right-align the rest
set statusline+=%-10.(%l,%c%V%) " - line,column[-virtual column]
set statusline+=\               " - a space
set statusline+=%4L             " - total number of lines in buffer
set statusline+=\               " - a space
set statusline+=%P              " - position in buffer as percentage

" Map sort function to a key
vnoremap <Leader>s :sort<CR>


" Easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" INSERT BEFORE COLORSCHEME COMMAND
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable filetype dectection and ft specific plugin/indent
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on

" Enable syntax highlighting
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
let &colorcolumn="70,80,120,".join(range(123,999),",")
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700
set showmatch                       " show matching bracket (briefly jump)
set matchpairs+=<:>                 " For HTML

" Real programmers don't use TABs but spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround



" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile


"=========================================================================
"" Toggle Mouse Plugin
"=========================================================================
" Toggle mouse plugin for quickly toggling mouse between Vim and terminal
" Maintainer:   Vincent Driessen <vincent@datafox.nl>
" Version:      Vim 7 (may work with lower Vim versions, but not tested)
" URL:          http://github.com/nvie/vim-togglemouse
"
" Only do this when not done yet for this buffer
if exists("b:loaded_toggle_mouse_plugin")
    finish
endif
let b:loaded_toggle_mouse_plugin = 1

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

" Add mappings, unless the user didn't want this.
" The default mapping is registered under to <F12> by default, unless the user
" remapped it already (or a mapping exists already for <F12>)
if !exists("no_plugin_maps") && !exists("no_toggle_mouse_maps")
    if !hasmapto('<SID>ToggleMouse()')
        noremap <F12> :call <SID>ToggleMouse()<CR>
        inoremap <F12> <Esc>:call <SID>ToggleMouse()<CR>a
    endif
endif


" ============================================================================
" ============================================================================
"" IDE Setup for Various Programming Languages
" ============================================================================
" ============================================================================


" Settings for vim-powerline
set laststatus=2


" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable                           " disable folding


"=============================================================================
"" Programming in C/C++
"=============================================================================


function! FT_C()
  if v:version >= 600
    setlocal formatoptions=croql
    setlocal cindent
    setlocal comments=sr:/*,mb:*,el:*/,://
    setlocal shiftwidth=4
    if v:version >= 704
      setlocal fo+=j " remove comment leader when joining lines
    endif
  else
    set formatoptions=croql
    set cindent
    set comments=sr:/*,mb:*,el:*/,://
    set shiftwidth=4
  endif
endf

augroup C_prog
  autocmd!
  autocmd FileType c,cpp        call FT_C()
  autocmd BufRead,BufNewFile /home/mg/src/brogue-*/**/*.[ch]  setlocal ts=4
augroup END


"=============================================================================
" Programming in Java
" ============================================================================


function! FT_Java()
  if v:version >= 600
    setlocal formatoptions=croql
    setlocal cindent
    setlocal comments=sr:/*,mb:*,el:*/,://
    setlocal shiftwidth=4
    "setlocal efm=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
    if v:version >= 704
      setlocal fo+=j " remove comment leader when joining lines
    endif
  else
    set formatoptions=croql
    set cindent
    set comments=sr:/*,mb:*,el:*/,://
    set shiftwidth=4
    "set efm=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
  endif
endf

augroup Java_prog
  autocmd!
  autocmd FileType java         call FT_Java()
augroup END


" ============================================================================
" Programming in Perl
" ============================================================================


function! FT_Perl()
  if v:version >= 600
    setlocal formatoptions=croql
""  setlocal smartindent
    setlocal shiftwidth=4
    if v:version >= 704
      setlocal fo+=j " remove comment leader when joining lines
    endif
  else
    set formatoptions=croql
""  set smartindent
    set shiftwidth=4
  endif

  " <S-F9> = check syntax
  map  <buffer> <S-F9>  :!perl -c %<CR>
  imap <buffer> <S-F9>  <C-O><S-F9>
endf

augroup Perl_prog
  autocmd!
  autocmd FileType perl         call FT_Perl()
augroup END
