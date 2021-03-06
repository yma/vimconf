function! ide#Shortcuts()
    nmap <leader>2 :call ide#Tabs(2, 1)<CR>
    nmap <leader>4 :call ide#Tabs(4, 1)<CR>
    nmap <leader>8 :call ide#Tabs(8, 1)<CR>
    nmap <leader>@ :call ide#Tabs(2, 0)<CR>
    nmap <leader>$ :call ide#Tabs(4, 0)<CR>
    nmap <leader>* :call ide#Tabs(8, 0)<CR>

    nnoremap <F8> :set textwidth=80<CR>
    nnoremap <F9> :set invincsearch<CR>
    nnoremap <F10> :set invhls<CR>
    nnoremap <F12> :IDE<CR>
    nnoremap <C-F12> :setlocal spell spelllang=fr<CR>

    " Don't work
    "nnoremap <C-F9> /[<=>]\{7\}<CR>
endfunction

function! ide#IDE_netrw()
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

function! ide#IDE_nerdtree()
    NERDTree
endfunction

function! ide#Colors()
    highlight LineNr ctermfg=darkgrey ctermbg=black

    highlight StatusLine ctermfg=black ctermbg=yellow
    highlight StatusLineNC ctermfg=black ctermbg=green
    highlight VertSplit ctermfg=black ctermbg=green

    highlight TabLineFill ctermfg=black ctermbg=darkgreen
    highlight TabLine ctermbg=black ctermfg=darkgreen cterm=NONE
    highlight TabLineSel ctermbg=darkgreen ctermfg=black cterm=NONE
    highlight Title ctermbg=yellow ctermfg=black

    highlight Folded ctermbg=black ctermfg=darkgreen
    highlight CursorLine ctermbg=lightgray ctermfg=black cterm=NONE
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

function! ide#QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

function! ide#Search(...)
    let pattern = a:1
    if a:0 > 1
        let path = a:2
    else
        let path = "%"
    endif
    execute 'vimgrep /' . pattern . '/j '. path
    cwindow
endfunction

function! ide#BuffersQuickfix()
  " Fill the buffer list into the quickfix window
  let qfbuffers = []
  for bufnum in range(1, bufnr('$'))
    if bufloaded(bufnum)
        let item = {}
        let item['bufnr'] = bufnum
        let item['filename'] = bufname(bufnum)
        let item['lnum'] = 1
        let qfbuffers = qfbuffers + [item]
    endif
  endfor
  call setqflist(qfbuffers)
  cwindow
endfunction

command IDE call ide#IDE_nerdtree()
command Limit80 set textwidth=80
command PlayHtml call ide#PlayHtml()
command! -nargs=0 -bar Qargs execute 'args ' . ide#QuickfixFilenames()
command! -nargs=* Search call ide#Search(<f-args>)
command Buffers call ide#BuffersQuickfix()
