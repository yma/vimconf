execute pathogen#infect()
Helptags

"Colors settings
syntax on
set background=dark
"colorscheme ron
"colorscheme inkpot
"highlight Normal     ctermbg=none
colorscheme synic

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
nmap <leader>s :AckFromSearch<CR>
nmap <leader>t :call RefreshTags()<CR>
nmap <leader>[ :tprevious<CR>
nmap <leader>] :tnext<CR>

" Use the same symbols as TextMate for tabstops, EOLs, spaces
set listchars=tab:▸\ ,eol:¬,trail:·
set list

set number
highlight LineNr ctermfg=darkgrey ctermbg=black

set fcs+=vert:╹

" Easy window resizing
:map <C-h> <C-w><lt>
:map <C-j> <C-w>+
:map <C-k> <C-w>-
:map <C-l> <C-w>>

" Autoinsert, autoindent brachets
inoremap {<CR> {<CR>@<Esc>o}<Esc>k^i<Del>

set dictionary+=/etc/vim/dico.txt
set complete-=k complete+=k

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Auto scroll 5 lines when cursor is at the limit of the window
set scrolloff=5


filetype on
filetype plugin on
filetype indent on

hi Folded ctermbg=0 ctermfg=2

call ide#Tabs(4, 1)
call ide#Shortcuts()


" Plugins configuration

" Gundo
nmap <leader>u :GundoToggle<CR>

" Gist
let g:gist_post_private = 1
