set number                               
syntax enable
syntax on                                 
set showmatch                                                                                       
set matchtime=100     "showtime 100*0.1 = 10 second
set incsearch                                                                                       
let Tlist_Auto_Open=1                      
let Tlist_Exit_OnlyWindow=1                                                 
let Tlist_Use_Right_Window = 1              
set fencs=utf-8,gbk                                                                                 
let Tlist_File_Fold_Auto_Close=1 
let Tlist_Use_Right_Window=1

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
"set ai                 " always set autoindenting on
"set backup             " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
if &term=="xterm"
     set t_Co=8
     set t_Sb=m
     set t_Sf=m
endif
set et "replace tabs with spaces
set ts=4 "setting tab size to 4
set sts=4 "setting soft tab stop to 4
set sw=4 "setting shift width to 4
"filetype plugin indent on"
"set nobackup
set encoding=utf-8 fileencodings=ucs-bom,utf-8
set cursorline
set nu

set background=dark
set t_Co=256

set helplang=cn
colorscheme monokai
set fileformats=unix
set cindent
set clipboard=unnamed

set ignorecase
"set confirm  "/show save or onlyread confirm  

call pathogen#infect()
inoremap jj <Esc>
inoremap ii <Esc>
inoremap dd <Esc>

