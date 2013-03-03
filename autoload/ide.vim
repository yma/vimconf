function! ide#Shortcuts()
    nmap <leader>2 :call ide#Tabs(2, 1)<CR>
    nmap <leader>4 :call ide#Tabs(4, 1)<CR>
    nmap <leader>8 :call ide#Tabs(8, 1)<CR>
    nmap <leader>@ :call ide#Tabs(2, 0)<CR>
    nmap <leader>$ :call Tide#abs(4, 0)<CR>
    nmap <leader>* :call Tide#abs(8, 0)<CR>

    nnoremap <F8> :set textwidth=80<CR>
    nnoremap <F9> :set invincsearch<CR>
    nnoremap <F10> :set invhls<CR>
    nnoremap <F12> :IDE<CR>
    nnoremap <C-F12> :setlocal spell spelllang=fr<CR>

    " Don't work
    "nnoremap <C-F9> /[<=>]\{7\}<CR>
endfunction

function! ide#IDE()
    let g:netrw_liststyle=3 " Use tree-mode as default view
    let g:netrw_browse_split=4 " Open file in previous buffer
    let g:netrw_preview=1 " preview window shown in a vertically split
    "let g:netrw_altv=1
    set splitbelow

    "set splitright
    "set nosplitright
    30vsplit +Explore
    "set splitright
endfunction

function! ide#Tabs(spaces, expand)
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

function! ide#PlayHtml()
    " a javascript expression is used as an arg value
    syn region  javaScriptExpression contained start=+&{+ keepend end=+};\?+ contains=@htmlJavaScript,@htmlPreproc
endfunction

command IDE call ide#IDE()
command Limit80 set textwidth=80
command PlayHtml call ide#PlayHtml()
