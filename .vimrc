set nocompatible
set tags=~/.tags

"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" set Bundles
filetype off

set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

Bundle 'neocomplcache'
Bundle 'QuickBuf'
Bundle 'surround.vim'
Bundle 'The-NERD-tree'
Bundle 'snipMate'
Bundle 'Gundo'
Bundle 'quickrun.vim'
Bundle 'fugitive.vim'

Bundle 'git://github.com/h1mesuke/vim-alignta.git'
Bundle 'git://github.com/sigwyg/htmlform.vim.git'
Bundle 'git://github.com/hail2u/vim-css3-syntax.git'

filetype plugin indent on

" display
" ----------------------
set number
set ruler
set cmdheight=1
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set title
set linespace=0
set showcmd
set wildmenu
set wildmode=list:longest,full
"set textwidth=78

" syntax color
" ---------------------
"set t_Co=256
syntax on
colorscheme ir_black
highlight LineNr ctermfg=0

"colorscheme slate
"highlight Normal guibg=grey5
"highlight NonText guibg=grey5

"colorscheme ron
"highlight LineNr ctermfg=grey


" search
" ----------------------
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch

" edit
" ---------------------
set autoindent
set cindent
set showmatch
set backspace=indent,eol,start
set clipboard=unnamed
set pastetoggle=<F12>
set guioptions+=a

" tab
" --------------------
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set shiftround
set nowrap

set listchars=tab:>-
set list

" keymap
" --------------------
"set bioskey
"set timeout
"set timeoutlen=300

" move
nnoremap \h <Home>
nnoremap \l <End>
nnoremap zl zL
nnoremap zh zH

inoremap \h <Home>
inoremap \l <End>
inoremap \j <C-End>
inoremap \k <C-Home>
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>

" date/time
inoremap ,dd <C-R>=strftime('%Y/%m/%d (%a)')<CR>
inoremap ,dt <C-R>=strftime('%H:%M')<CR>
inoremap ,df <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>
                
" text-edit
noremap <CR> i<CR><ESC>
inoremap <C-l> <Del>
command! -nargs=1 -bang -bar -complete=file Rename sav<bang> <args> | call delete(expand('#:p'))


" brackets"
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>
inoremap []5 [%  %]<LEFT><LEFT><LEFT>
inoremap {}5 {%  %}<LEFT><LEFT><LEFT>

" search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" window
nnoremap <silent> <C-x>1 :only<CR>
nnoremap <silent> <C-x>2 :sp<CR>
nnoremap <silent> <C-x>3 :vsp<CR>
set splitbelow
set splitright
set visualbell

" buffer
nnoremap <silent> bb :b#<CR>
nnoremap <silent> bp :bp<CR>
nnoremap <silent> bn :bn<CR>
nnoremap <silent> bd :bd<CR>
nnoremap ls :ls<CR>:b

" re-select
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>

" vim(rc)
nnoremap <Space>r :<C-u>execute "source " expand("%:p")<CR>
nnoremap <Space>v :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <Space>, :<C-u>e $MYVIMRC<CR>
nnoremap <Space>. :<C-u>e $MYGVIMRC<CR>

" Encode
command! Utf8 e ++enc=utf-8
command! Sjis e ++enc=sjis
command! Euc e ++enc=euc-jp

" Other Hacks
noremap ; :
noremap : ;
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
cnoremap <C-p> <Up> 
cnoremap <C-n> <Down> 
cnoremap <Leader><Leader> ~/
inoremap <C-x><C-s> <Esc>:w<CR>i
nnoremap <C-x><C-s> <Esc>:w<CR>
nnoremap <Space>w <Esc>:w<CR>

" <C-k>: delete till line-end.
inoremap <C-k>  <C-o>D

augroup MyAutoCmd
    autocmd!
    " For noexpandtab
    autocmd BufNewFile,BufRead * set expandtab
    " For netrw
    "autocmd BufWrite,BufRead * set ft=perl
augroup END

" closetag
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" markdown
nnoremap \m :call DisplayMarkdown()<CR>
function! DisplayMarkdown()
    !perl ~/Sites/Git/Markdown/Markdown.pl --html4tags "%" > /tmp/__markdown.html;
    vert diffsplit /tmp/__markdown.html
    highlight DiffChange guibg=grey0
    highlight DiffAdd    guibg=grey0
    highlight DiffText   gui=NONE, guibg=grey0
    highlight DiffDelete guibg=grey0
 
    call cursor(1,1)
"    %diffput
"    wincmd c
"    set ft=html
"    diffoff<CR>
endfunction

" custom :cd to :CD
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" backup
" --------------------
set backup
set swapfile
set backupdir=~/.vim/backup
set directory=~/.vim/swap



"
" ------------------------------------------------
" encoding
" > http://www.kawaz.jp/pukiwiki/?vim
" ------------------------------------------------
"

if !has('gui_macvim') && !has('kaoriya')
    set encoding=utf8
    set fileencodings=iso-2022-jp,sjis,utf8

    if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
        set fileencodings+=cp932
        set fileencodings-=euc-jp
        set fileencodings-=euc-jisx0213
        set fileencodings-=eucjp-ms
        let &encoding = s:enc_euc
        let &fileencoding = s:enc_euc
        else
        let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    unlet s:enc_euc
    unlet s:enc_jis
    endif

    if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
        let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
    endif

    set fileformats=unix,dos,mac
    if exists('&ambiwidth')
    set ambiwidth=double
    endif
endif


"
" http://nanasi.jp/articles/vim/bufonly_vim.html#id4
"
" -----------------------------------------------------------------------
" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer] 
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.
" -----------------------------------------------------------------------
"

command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
    if a:buffer == ''
        " No buffer provided, use the current buffer.
        let buffer = bufnr('%')
    elseif (a:buffer + 0) > 0
        " A buffer number was provided.
        let buffer = bufnr(a:buffer + 0)
    else
        " A buffer name was provided.
        let buffer = bufnr(a:buffer)
    endif

    if buffer == -1
        echohl ErrorMsg
        echomsg "No matching buffer for" a:buffer
        echohl None
        return
    endif

    let last_buffer = bufnr('$')

    let delete_count = 0
    let n = 1
    while n <= last_buffer
        if n != buffer && buflisted(n)
            if a:bang == '' && getbufvar(n, '&modified')
                echohl ErrorMsg
                echomsg 'No write since last change for buffer'
                            \ n '(add ! to override)'
                echohl None
            else
                silent exe 'bdel' . a:bang . ' ' . n
                if ! buflisted(n)
                    let delete_count = delete_count+1
                endif
            endif
        endif
        let n = n+1
    endwhile

    if delete_count == 1
        echomsg delete_count "buffer deleted"
    elseif delete_count > 1
        echomsg delete_count "buffers deleted"
    endif

endfunction



"
" ----------------------------------------------------------------
" NERD_tree.vim
"  - http://vim.sourceforge.net/scripts/script.php?script_id=1658
" ----------------------------------------------------------------
"
nnoremap nt :NERDTreeToggle<CR>


"
" -------------------------------------------------------------------
" HTML Key Mappings for Typing Character Codes
" 
" |--------------------------------------------------------------------
" |Keys     |Insert   |For  |Comment
" |---------|---------|-----|-------------------------------------------
" |\&       |&amp;    |&    |ampersand
" |\<       |&lt;     |<    |less-than sign
" |\>       |&gt;     |>    |greater-than sign
" |\.       |&middot; |・   |middle dot (decimal point)
" |\?       |&#8212;  |?    |em-dash
" |\2       |&#8220;  |“   |open curved double quote
" |\"       |&#8221;  |”   |close curved double quote
" |\`       |&#8216;  |‘   |open curved single quote
" |\'       |&#8217;  |’   |close curved single quote (apostrophe)
" |\`       |`        |`    |OS-dependent open single quote
" |\'       |'        |'    |OS-dependent close or vertical single quote
" |\<Space> |&nbsp;   |     |non-breaking space
" |---------------------------------------------------------------------
"
" > http://www.stripey.com/vim/html.html
"
"
autocmd BufEnter * if &filetype == "html" | call MapHTMLKeys() | endif
function! MapHTMLKeys(...)
  if a:0 == 0 || a:1 != 0
    inoremap \\ \
    inoremap \& &amp;
    inoremap \< &lt;
    inoremap \> &gt;
    inoremap \. ・
    inoremap \- &#8212;
    inoremap \<Space> &nbsp;
    inoremap \` &#8216;
    inoremap \' &#8217;
    inoremap \2 &#8220;
    inoremap \" &#8221;
    autocmd! BufLeave * call MapHTMLKeys(0)
  else
    iunmap \\
    iunmap \&
    iunmap \<
    iunmap \>
    iunmap \-
    iunmap \<Space>
    iunmap \`
    iunmap \'
    iunmap \2
    iunmap \"
    autocmd! BufLeave *
  endif " test for mapping/unmapping
endfunction " MapHTMLKeys()


"
" htmlform.vim
"  - from test of mine
"
vnoremap \u :call ChangeUL()<CR>
vnoremap \t :call ChangeTable()<CR>

" ChangeUL
function! ChangeUL() range
    let l:count = a:firstline

    while l:count <= a:lastline
        let l:str = getline(l:count)
        let l:out = substitute(l:str, '^\s\+', '', '') 
        let l:out = substitute(l:str, '^\(.\+\)$', '<li>\1<\/li>', '') 
        call setline(l:count, l:out)
let l:count = l:count + 1 
    endwhile

    call append(a:lastline, '</ul>')
    call append(a:firstline - 1, '<ul>')
endfunction


" ChangeTable
function! ChangeTable() range
    let l:count = a:firstline

    while l:count <= a:lastline
        let l:str = getline(l:count)
        let l:out = substitute(l:str, '\s\{2,}', '</td><td>', '') 
        let l:out = '<tr><td>' . l:out . '</td></tr>'
        call setline(l:count, l:out)
        let l:count = l:count + 1 
    endwhile

    call append(a:lastline, '</table>')
    call append(a:firstline - 1, '<table>')
endfunction


" 
" QuickBuf
"  - http://www.vim.org/scripts/script.php?script_id=1910
"
let g:qb_hotkey = "<F3>"


"
" snipMate.vim
"  - http://www.vim.org/scripts/script.php?script_id=2540
"
" below, Reload xxx.snippet. :call SnipMateReload()
"  -> http://webtech-walker.com/archive/2009/10/26021358.html
"
function! SnipMateReload()
    if &ft == 'snippet'
        let ft = substitute(expand('%'), '.snippets', '', '')
        if has_key(g:did_ft, ft)
            unlet g:did_ft[ft]
        endif
        silent! call GetSnippets(g:snippets_dir, ft)
    endif
endfunction


"
" origine -> zoom.vim@hokaccha
"  - http://gist.github.com/200505
"
function! FontToggle(trigger)
    if &guifont == "Courier\ New:h14"
        if a:trigger  == 'b'
            execute 'set guifont=Courier\ New:h36'
            execute 'set columns=51'
            execute 'set lines=16'
        elseif a:trigger == 'f'
            execute 'set guifont=nanahoshi-beta:h18'
            execute 'set guifontwide=nanahoshi-beta:h18'
            "execute 'set guifont=Inconsolata:h15'
            "execute 'set guifontwide=Inconsolata:h15'
            execute 'set columns=124'
            execute 'set lines=36'
        endif

   else
       execute 'set guifont=Courier\ New:h14'
       execute 'set guifontwide='
       execute 'set columns=140'
       execute 'set lines=40'
   endif
endfunction
nnoremap <C-f> :<C-u>call FontToggle('f')<CR>
nnoremap <C-b> :<C-u>call FontToggle('b')<CR>

"
" neocomplcache
"  - https://github.com/Shougo/neocomplcache
"  - https://github.com/Shougo/neocomplcache/blob/998764e1072fa5b183c3da4705b8187658fa0b41/presen/neocomplcache.txt

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

"Quick Type, ignore neocomplcache.
let g:NeoComplCache_SkipCompletionTime = '0.3'
let g:NeoComplCache_SkipInputTime = '0.1'

" Plugin key-mappings.
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" <CR> : delete popup and hold indent
" <C-h>: close popup and delete backword char.
" <BS> : close popup and delete backword char.
" <C-n>: manual-start neocomplcache.
" <C-p>: Vim native-keyword complement.
" <C-j>: Vim native-Omni completion.
inoremap <expr><CR> pumvisible() ? "\<C-y>\<CR>X\<BS>" : "\<CR>X\<BS>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#smart_close_popup()."\<C-y>"
inoremap <expr><C-e> neocomplcache#smart_close_popup()."\<C-e>"
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
inoremap <expr><C-j> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"

" <TAB>: TAB completion.(Can't work...!)
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }

"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"    let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"
" gundo.vim
"  - https://github.com/sjl/gundo.vim
"
nnoremap <F5> :GundoToggle<CR>


"
" quickrun
"  - https://github.com/thinca/vim-quickrun/
"
let g:quickrun_config = {}
let g:quickrun_config.haskell = {'command' : 'runhugs'}

" Set shortcut keys.
for [key, com] in items({
\   '<Leader>x' : '>:',
\   '<Leader>p' : '>!',
\   '<Leader>w' : '>',
\   '<Leader>q' : '>>',
\ })
    execute 'nnoremap <silent>' key ':QuickRun' com '-mode n<CR>'
    execute 'vnoremap <silent>' key ':QuickRun' com '-mode v<CR>'
endfor
