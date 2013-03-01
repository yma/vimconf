execute pathogen#infect()

syntax on
colorscheme ron

set mouse=a
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

" plugin Gundo
nmap <leader>u :GundoToggle<CR>

" plugin Gist
let g:gist_post_private = 1

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

function! Tabs(spaces, expand)
    if a:expand
        set expandtab
        set tabstop=8
    else
        set noexpandtab
        execute 'set tabstop='.a:spaces
    endif
    execute 'set softtabstop='.a:spaces
    execute 'set shiftwidth='.a:spaces
endfunction

function! PlayHtml()
    " a javascript expression is used as an arg value
    syn region  javaScriptExpression contained start=+&{+ keepend end=+};\?+ contains=@htmlJavaScript,@htmlPreproc
endfunction

command Limit80 set textwidth=80
command PlayHtml call PlayHtml()
nnoremap <F8> :set textwidth=80<CR>

nmap <leader>2 :call Tabs(2, 1)<CR>
nmap <leader>4 :call Tabs(4, 1)<CR>
nmap <leader>8 :call Tabs(8, 1)<CR>
nmap <leader>$ :call Tabs(4, 0)<CR>
nmap <leader>* :call Tabs(8, 0)<CR>
call Tabs(4, 1)


nnoremap <F9> :set invincsearch<CR>
nnoremap <F10> :set invhls<CR>
nnoremap <F12> :IDE<CR>
nnoremap <C-F12> :setlocal spell spelllang=fr<CR>

" Don't work
"nnoremap <C-F9> /[<=>]\{7\}<CR>

let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split

function! IDE()
    set splitbelow
    "set splitright
    "set nosplitright
    30vsplit +Explore
    "set splitright
endfunction

command IDE call IDE()
