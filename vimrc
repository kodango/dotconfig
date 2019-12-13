" Modeline and Notes {
"   vim: set foldmarker={,} foldlevel=0:
"   
"   Note: This is my personal .vimrc, I don't recommend you copy it, just
"   use the pieces you want. 
"
"   Contact:
"   tuantuan <dangoakachan@foxmail.com>
"
""  Usage:
"   1. Install the plugin manager 'vim-plug':
"
"     # curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"   2. Copy the vimrcfile to your user configure directory
"
"     # cp the_vimrc_file ~/.vimrc
"
"   2. Reopen vim and run :PlugInstall to install the plugins:
"
"     :PlugInstall
"
"   3. (MacOS required) Install the ctags binary:
"
"     # brew install ctags
"
"   4. (Deoplete required) Install the dependency for deoplete plugin:
"
"     # pip3 install --user pynvim
"
"   Last updated: 2019-12-13 12:00:00
" }

" Basics {
    set nocompatible    " explicitly get out of vi-compatible mode
    filetype plugin indent on   " load filetype plugins/indent settings
    syntax on           " syntax highlight on
    set termguicolors   " enable 24bit color

    set backspace=indent,eol,start    " make backspace a more flexible
    set clipboard+=unnamed   " share window clipboard
    set fileformats=unix,dos,mac " support all three, in this order

    let &keywordprg=':help'		      " program to use for the |K| command.  
    let mapleader=','

    " Encodings {
        set enc=utf-8		" Sets the character encoding used inside Vim.
        set fenc=utf-8	    " Sets the character encoding for the file.
        set fencs=ucs-bom,utf-8,gb18030,gbk,gb2312,cp936		
    " }

    " set backup    " make backup files
    " set backupdir=$HOME/.vim/backup " where to put backup files
    " set autochdir  " always switch to the current file directory
" }

" Text Formatting/Layout {
    set textwidth=79
    set completeopt=menu    " use a pop up menu for completions
    set wildmenu    " turn on command line complete wild style
    set wildignore=*.dll,*.bak,*.exe,*.pyc  " ignore these list file extension
    set formatoptions=tcrql

    " Indent {
        set autoindent
        set smartindent
        set cindent "  enable automatic C program indenting.  
    " }

    " Tab {
        set tabstop=4   " real tabs should be 4
        set shiftwidth=4    " auto-indent amount
        set expandtab   " no real tabs please!
        set smarttab 
    " }
" } 

" Plugins { 
    " Vim plugin manager start here
    call plug#begin('~/.vim/plugged')

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'scrooloose/nerdtree'
    Plug 'majutsushi/tagbar'
    Plug 'vim-airline/vim-airline'
    Plug 'arcticicestudio/nord-vim'

    " Deoplete completion
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'

    " Initialize plugin system
    call plug#end()

    " Vim-go settings
    let g:go_fmt_command = "goimports"
    let g:go_list_type = "quickfix"
    let g:go_gopls_complete_unimported = 1
    let g:go_version_warning = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_format_strings = 1

    " NERDTree settings
    nnoremap <Leader>n :NERDTreeToggle<CR>

    let NERDTreeShowLineNumbers=1
    let NERDTreeAutoCenter=1
    let NERDTreeShowHidden=0
    let NERDTreeIgnore=['\.pyc','\~$','\.swp']
    let NERDTreeShowBookmarks=2
    let g:nerdtree_tabs_open_on_console_startup=1

    autocmd VimEnter * NERDTree | wincmd p
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " Tagbar settings
    nnoremap <Leader>t :TagbarToggle<CR>
    autocmd FileType go nested :TagbarOpen

    let g:tagbar_compact = 1
    let g:tagbar_autoshowtag = 1
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }

    " Deoplete.nvim settings
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

    let g:deoplete#enable_at_startup = 1
    if exists('g:deoplete#enable_at_startup')
        call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
    endif
" }

" UI {
    set number  " turn on line number
    set numberwidth=5   " we are good up to 99999 lines
    set report=0    " tell us when anything is changed via :...
    set ruler   " always show current positions along the bottom
    set showcmd " show the command being typed
    set showmode    " show editing mode
    set showmatch   " show matching brackets
    set matchpairs+=<:>
    set splitbelow " show split window below
    set splitright
    set completeopt=longest,menu    " use a pop up menu for completions

    " Highlight {
        "set cursorcolumn    " highlight the current column
        "highlight cursorcolumn guibg=lightblue

        set cursorline  " highlight the current line
        highlight cursorline cterm=bold
        "highlight linenr ctermfg=darkcyan
    " }

    " Colorscheme {
        set background=dark
        colorscheme nord
    " }

    " Search {
        set hlsearch    " highlight search result.
        set incsearch   " do search as you type your search phrase
        set ignorecase smartcase    " smart ignore case when searching.
    " }

    " Statusline {
        set laststatus=2    " always show the status line
        set statusline=
        set statusline+=%-3.3n                       " buffer number
        set statusline+=%t                           " filename
        set statusline+=%h%m%r%w                     " status flags
        set statusline+=[%{&ff}]                     " file format
        set statusline+=[%{strlen(&ft)?&ft:'none'}]  " file type
        set statusline+=%=                           " right align remainder
        set statusline+=0x%-8B                       " character value
        set statusline+=%-14(%l,%c%V%)               " line, character
        set statusline+=%<%LL                        " file lines
    " }
" }

" GUI {
    if has('gui_running')
        set lines=999 columns=999 " size of gvim window

        " Remove toolbar and menubar
        set guioptions-=T
        set guioptions-=m

        " Font. Very important.
        if has('win32') || has('win64')
            set guifont=Consolas:h11:cANSI
        elseif has('gui_macvim')
            set transparency=10
            set guifont=Monaco:h12
            "set showtabline=2

            " Remove scrollbar also
            set guioptions-=r
            set guioptions-=R
            set guioptions-=l
            set guioptions-=L
        elseif has('unix')
            set guifont=Monospace\ 12
        endif
    endif
" }

" User-defined {
    " Easy edit of files in the same directory.
    if has('unix')
        nnoremap ,e :e <C-R>=expand("%:p:h") . "/" <CR>
    else
        nnoremap ,e :e <C-R>=expand("%:p:h") . "\\" <CR>
    endif

    " Typical keypress errors:
    iabbr teh the

    " Abbreviations for some words in common use
    iabbr #c  # coding=utf-8
    iabbr #p  #!/usr/bin/env python
    iabbr #b  #!/bin/bash
" }
