" Vunble init
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sandeepcr529/Buffet.vim'
Plugin 'sjl/gundo.vim.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'fatih/vim-go'

let g:go_fmt_autosave = 0

call vundle#end()
" Vunble end

filetype on
filetype plugin on
filetype indent on

set spelllang=fr,en

set hidden "Don't close buffer, keep undo history
"set mouse=a
set linebreak
set wildmenu
set nomodeline
set showmode
set incsearch
set hlsearch
set noequalalways "Disable automatic resizing on close/split

set autoindent
set smartindent

function! RefreshTags()
    if filereadable(".ctags_local")
        silent !xargs -a .ctags_local ctags -R
    else
        silent !ctags -R
    endif
    redraw!
endfunction

"let mapleader="@"
nmap <leader>l :set list!<CR>
nmap <leader>n :set number!<CR>
nmap <leader>d :bn<CR>:bd#<CR>
nmap <leader>w :%s/\s\+$//gc<CR>
nmap <leader>s :AckFromSearch! -k<CR>
nmap <leader>t :call RefreshTags()<CR>
nmap <leader>b :Bufferlist<CR>
nmap <leader>u :GundoToggle<CR>
nmap <leader>[ :tprevious<CR>
nmap <leader>] :tnext<CR>
nmap <leader>a :set spell!<CR>
nmap <leader>p :set invpaste<CR>

" Use the same symbols as TextMate for tabstops, EOLs, spaces
set listchars=tab:▸\ ,eol:¬,trail:·
set list

set number
highlight LineNr ctermfg=darkgrey ctermbg=black

set fcs+=vert:╹,stl:·

" Easy window resizing
noremap <C-h> <C-w><lt>
noremap <C-j> <C-w>+
noremap <C-k> <C-w>-
noremap <C-l> <C-w>>

" Autoinsert, autoindent brachets
inoremap {<CR> {<CR>@<Esc>o}<Esc>k^i<Del>

" Copy/Paste to clipboard
noremap <leader>v "+p
noremap <leader>V "+P
noremap <leader>c "+yy
vnoremap <leader>c "+y
inoremap  <C-V> <C-R>+

set dictionary+=/etc/vim/dico.txt
set complete-=k complete+=k

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Auto scroll 5 lines when cursor is at the limit of the window
set scrolloff=5

"Colors settings
syntax on
set background=dark

call ide#Tabs(4, 1)
call ide#Shortcuts()
call ide#Colors()

" Gist plugin configuration
let g:gist_post_private = 1
