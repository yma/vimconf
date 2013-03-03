execute pathogen#infect()

syntax on
colorscheme ron

set hidden "Don't close buffer, keep undo history
"set mouse=a
set linebreak
set wildmenu
set nomodeline
set showmode
set incsearch
set hlsearch

set autoindent
set smartindent

let mapleader="@"
nmap <leader>l :set list!<CR>
nmap <leader>n :set number!<CR>
nmap <leader>d :bn<CR>:bd#<CR>
nmap <leader>w :%s/\s\+$//gc<CR>

" Use the same symbols as TextMate for tabstops, EOLs, spaces
set listchars=tab:▸\ ,eol:¬,trail:·
set list

set number
highlight LineNr ctermfg=darkgrey ctermbg=black

highlight StatusLine ctermfg=black ctermbg=yellow
highlight StatusLineNC ctermfg=black ctermbg=green
highlight VertSplit ctermfg=black ctermbg=green
set fcs+=vert:╹

highlight TabLineFill ctermfg=black ctermbg=white
highlight TabLine ctermfg=darkgreen ctermbg=black cterm=NONE
highlight TabLineSel ctermfg=white ctermbg=black
highlight Title ctermfg=yellow ctermbg=black

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
"filetype plugin on
"filetype indent on

hi Folded ctermbg=0 ctermfg=2

call ide#Tabs(4, 1)
call ide#Shortcuts()


" Plugins configuration

" Gundo
nmap <leader>u :GundoToggle<CR>

" Gist
let g:gist_post_private = 1
