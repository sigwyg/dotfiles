set nocompatible


" -----------------------------------------------------------------------
" Vundle: {{{
"  - https://github.com/vim-scripts/vundle
" NeoBundle.vim
"  - https://github.com/Shougo/neobundle.vim
"

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle'))

"
" Unite
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
    NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
    NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
    NeoBundle 'git://github.com/t9md/vim-unite-ack.git'
    NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
    NeoBundle 'git://github.com/Shougo/unite-ssh.git'
    NeoBundle 'git://github.com/ujihisa/vimshell-ssh.git'
"
" Git
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
    NeoBundle 'git://github.com/thinca/vim-openbuf.git'
"NeoBundle 'https://github.com/motemen/git-vim'
"
" Text
NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
NeoBundle 'git://github.com/t9md/vim-textmanip.git'
NeoBundle 'git://github.com/thinca/vim-template.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
    NeoBundle 'git://github.com/tpope/vim-repeat.git'
NeoBundle 'git://github.com/kana/vim-textobj-user.git'
    NeoBundle 'git://github.com/kana/vim-textobj-indent.git'
"NeoBundle 'git://github.com/msanders/snipmate.vim.git'
"
" Display
NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'
"
" Syntax
NeoBundle 'git://github.com/t9md/vim-quickhl.git'
NeoBundle 'git://github.com/othree/html5.vim.git'
NeoBundle 'git://github.com/cakebaker/scss-syntax.vim.git'
NeoBundle 'git://github.com/hail2u/vim-css3-syntax.git'
NeoBundle 'git://github.com/hallison/vim-markdown.git'
"NeoBundle 'git://github.com/tpope/vim-markdown.git'
"
" Develop
NeoBundle 'git://github.com/sjl/gundo.vim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
"NeoBundle 'git://github.com/basyura/jslint.vim.git'
"
" Browser
NeoBundle 'git://github.com/yuratomo/w3m.vim.git'
NeoBundle 'git://github.com/tsukkee/lingr-vim.git'
NeoBundle 'git://github.com/basyura/TweetVim.git'
    NeoBundle 'git://github.com/basyura/twibill.vim.git'
    NeoBundle 'git://github.com/tyru/open-browser.vim.git'
    NeoBundle 'git://github.com/mattn/webapi-vim.git'
"NeoBundle 'git://github.com/vim-scripts/TwitVim.git'
"
" Presen
NeoBundle 'https://github.com/sorah/presen.vim'
NeoBundle 'git://github.com/pocket7878/presen-vim.git'
    NeoBundle 'git://github.com/pocket7878/curses-vim.git'
NeoBundle 'git://github.com/thinca/vim-showtime.git'
"NeoBundle 'git://github.com/thinca/vim-fontzoom.git'
"
" Colorscheme
NeoBundle 'git://github.com/nanotech/jellybeans.vim.git'
NeoBundle 'git://gist.github.com/187578.git' " <- h2u_black

" }}}


filetype plugin indent on

" -----------------------------------------------------------------------
" Basis:{{{
"

" Add $PATH for node (jslint/csslint)
if has('vim_starting')
    if isdirectory(expand('~/.nvm/v0.6.18/bin/'))
        execute 'let $PATH="' . $PATH . ':' . $HOME .'/.nvm/v0.6.18/bin/"'
    endif
endif

" display
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

" syntax color
"set t_Co=8
syntax on

"colorscheme h2u_black
colorscheme jellybeans
"highlight LineNr ctermfg=0

"colorscheme slate
"highlight Normal guibg=grey5
"highlight NonText guibg=grey5

"colorscheme ron
"highlight LineNr ctermfg=grey

set cursorline
highlight CursorLine   cterm=bold
"set cursorcolumn
"highlight CursorColumn ctermbg=0

" search
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
"set grepprg=ack\ -a
set grepprg=grep\ -nH

" edit
set autoindent
set cindent
set showmatch
set backspace=indent,eol,start
set clipboard=unnamed
set pastetoggle=<F12>
set guioptions+=a
command! -nargs=1 -bang -bar -complete=file Rename sav<bang> <args> | call delete(expand('#:p'))

" tab
set tabstop=4    " 画面上でタブ文字が占める幅
set expandtab    " <Tab>の代わりに空白を使う
set smarttab     " <Tab>押すとshiftwidthの数だけ空白を挿入する
set shiftwidth=4 " インデントに使われる空白の数
set shiftround   " インデントをshiftwidthの倍数にする
set nowrap
"set listchars=eol:↲
set listchars=tab:»»,eol:¦,trail:_
set list

" Enable folding.
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
set foldcolumn=3

" diff
set diffopt=filler,vertical

" window
set splitbelow
set splitright
set visualbell
set previewheight=30

" backup
set backup
set swapfile
set backupdir=~/.vim/backup
set directory=~/.vim/swap

if has('persistent_undo')
    set undofile
    set undodir=./.vimundo,~/.vim/undo
    " Below, If only file under the home-directory
    "
    " augroup vimrc-undofile
    "     autocmd!
    "     autocmd BufReadPre ~/* setlocal undofile
    " augroup END
endif

"}}}


" -----------------------------------------------------------------------
" QuickStart: {{{
"  - gundo.vim (https://github.com/sjl/gundo.vim)
"  - jslint.vim(https://github.com/basyura/jslint.vim)
"  - VimFiler  (https: //github.com/Shougo/vimfiler)
"
nnoremap <F2> :IndentGuidesToggle<CR>
nnoremap <F3> :VimFiler<CR>
nnoremap <F4> :SyntasticToggleMode<CR>
nnoremap <F5> :GundoToggle<CR>
"}}}


" -----------------------------------------------------------------------
" Keymap:{{{
" --------------------

" timeout
set timeout
set timeoutlen=3000
set ttimeoutlen=100

" practice
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>

" practice <Esc>
noremap <C-c> <Nop>
inoremap <C-c> <Nop>
inoremap <expr> j getline('.')[col('.') - 2] ==# 'j' ? "\<BS>\<ESC>" : 'j'
"inoremap jj <Esc>
"inoremap <C-j> <Esc>
"nnoremap <C-j> <Esc>

" below, cause error on MacVim-KaoriYa
"inoremap <Left> <Nop>

" help
"nnoremap <C-h> :<C-u>help<Space>
"nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

" move
nnoremap zl zL
nnoremap zh zH
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap gh gT
nnoremap gl gt
nnoremap fe $
vnoremap fe $<LEFT>
nnoremap <tab> %
vnoremap <tab> %

" text-edit
noremap <CR> i<CR><ESC>

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
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

" fix window-size
nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>

" move window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" buffer
nnoremap bb :b#<CR>
nnoremap bp :bprevious<CR>
nnoremap bn :bnext<CR>
nnoremap bd :bdelete<CR>

" re-select 'last edited text'
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>

" vim(rc)
nnoremap <Space>r :<C-u>execute "source " expand("%:p")<CR>
nnoremap <Space>v :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <Space>, :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>. :<C-u>edit $MYGVIMRC<CR>

" Encode
command! -bang -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -nargs=? Sjis edit<bang> ++enc=sjis <args>
command! -bang -nargs=? Euc edit<bang> ++enc=euc-jp <args>

" Other Hacks
noremap ; :
noremap : ;
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Leader><Leader> ~/

" consecutive numbers - 0,1,2,3,4...
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

"}}}


" -----------------------------------------------------------------------
" augroups: {{{
"

" For noexpandtab
augroup MyAutoCmd
    " reset autocmd-list
    autocmd!

    " If open new-buffer, set expandtab
    autocmd BufNewFile,BufRead * set expandtab
    
    " For Quickhl
    "  - if "set nolist" (ex. :Unite file), delete highlight.
    "  - BufNewFile/BufRead not work.
    "  - BufEnter/WinEnter working only move window.
    "
    "autocmd BufEnter unite if &list == "0" | call quickhl#lock() | endif
    "autocmd Syntax unite call quickhl#lock()
    autocmd Filetype unite call quickhl#lock()
    autocmd Filetype vimfiler call quickhl#lock()

    " cursor-line highlight
    "  - when .vimrc reloaded, VimShell-ssh corrupting
    "autocmd WinEnter,BufEnter * setlocal cursorline
    "autocmd WinEnter,BufEnter * setlocal cursorcolumn
    "autocmd WinLeave * setlocal nocursorline
    "autocmd WinLeave * setlocal nocursorcolumn
    
    " closetag
    "autocmd Filetype xml inoremap <buffer> <LT>? <LT>/<C-x><C-o>
    "autocmd Filetype html inoremap <buffer> ?<LT> /<LT>
    "autocmd Filetype html inoremap <buffer> <LT>? <LT>/<C-x><C-o>

    " go to file!
    autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

    " format
    autocmd BufRead *.mkd setlocal wrap
    autocmd BufRead *.txt setlocal textwidth=0
    
    " Custom folding
    "autocmd BufEnter * if &filetype == "javascript" | set foldmarker={,} | set foldlevel=3 | set foldcolumn=7 | endif
    
    " set less-sybtax
    autocmd BufEnter *.less set filetype=scss
augroup END

"inoremap <buffer> <LT>? <LT>/
"inoremap <buffer> ?> />

" if type 'set filetype=xxxxx', reset key-binding
"if !exists('b:undo_ftplugin')
"    let b:undo_ftplugin = ''
"endif
"let b:undo_ftplugin .= '
"\   | execute "iunmap <buffer> <LT>?"
"\   | execute "iunmap <buffer> ?>"
"\'

"}}}


" -----------------------------------------------------------------------
" encoding: {{{
"  - http://www.kawaz.jp/pukiwiki/?vim
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
"}}}


" -----------------------------------------------------------------------
" BufOnly.vim: {{{
"  - Delete all the buffers except the current/named buffer.
"  - http://nanasi.jp/articles/vim/bufonly_vim.html#id4
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"   :Bonly / :BOnly / :Bufonly / :BufOnly [buffer]
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.
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
"}}}


" -----------------------------------------------------------------------
" HTML Key Mappings for Typing Character Codes: {{{
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
"}}}


" -----------------------------------------------------------------------
" snipMate.vim: {{{
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
"}}}


" -----------------------------------------------------------------------
" FontsToggle: {{{
"  - inspired zoom.vim@hokaccha
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
"}}}


" -----------------------------------------------------------------------
" fontzoom.vim: {{{
"nmap <C-Up> <Plug>(fontzoom-larger)
"nmap <C-Down> <Plug>(fontzoom-smaller)
"}}}


" -----------------------------------------------------------------------
" neocomplcache: {{{
"  - https://github.com/Shougo/neocomplcache
"  - https://github.com/Shougo/neocomplcache/blob/998764e1072fa5b183c3da4705b8187658fa0b41/presen/neocomplcache.txt
"
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
"Quick Type, ignore neocomplcache.
let g:NeoComplCache_SkipCompletionTime = '0.3'
let g:NeoComplCache_SkipInputTime = '0.1'

" <CR> : delete popup and hold indent
" <BS> : close popup and delete backword char.
" <C-h>: close popup and delete backword char.
" <C-y>: close popup and delete backword char.
" <C-e>: close popup and delete backword char.
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

"}}}


" -----------------------------------------------------------------------
" neocomplcache-snippets-complete: {{{
"  - https://github.com/Shougo/neocomplcache-snippets-complete
"
let g:neocomplcache_snippets_dir = '~/.vim/snippets'
smap <TAB> <Plug>(neocomplcache_snippets_expand)
smap <TAB> <Plug>(neocomplcache_snippets_expand)
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
                        \ "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
"}}}


" -----------------------------------------------------------------------
" quickrun: {{{
"  - https://github.com/thinca/vim-quickrun/
"
let g:quickrun_config = {}
let g:quickrun_config.haskell = {'command' : 'runhugs'}

" Set shortcut keys.
" \   '<Leader>w' : '>',
for [key, com] in items({
\   '<Leader>x' : '>:',
\   '<Leader>p' : '>!',
\   '<Leader>q' : '>>',
\ })
    execute 'nnoremap <silent>' key ':QuickRun' com '-mode n<CR>'
    execute 'vnoremap <silent>' key ':QuickRun' com '-mode v<CR>'
endfor
"}}}


" -----------------------------------------------------------------------
" smartchr: {{{
"  - http://www.vim.org/scripts/script.php?script_id=2290
"
"inoremap <buffer><expr> + smartchr#one_of(' + ', '++', '+')
"inoremap <buffer><expr> & smartchr#one_of(' & ', ' && ', '&')
"
"inoremap <buffer><expr> = smartchr#one_of('=', ' = ', ' == ')
"inoremap <buffer><expr> - smartchr#one_of('-', ' - ', '--')
"inoremap <buffer><expr> / smartchr#one_of('/', ' / ', '// ')
""inoremap <buffer><expr> % smartchr#one_of(' % ', '%')
""inoremap <buffer><expr> : smartchr#one_of(': ', ':')
"inoremap <buffer><expr> ? smartchr#one_of('? ', '?')
"inoremap <buffer><expr> . smartchr#loop('.', ' -> ', '...')
"
"inoremap <buffer><expr> } smartchr#one_of('}', '}<cr>')
"inoremap <buffer><expr> ; smartchr#one_of(';', ';<cr>')
"}}}


" -----------------------------------------------------------------------
" unite.vim: {{{
"  - https://github.com/Shougo/unite.vim
"
let g:unite_winheight = 10
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_limit = 100

" The prefix key.
nnoremap ff :<C-u>Unite file            -buffer-name=files -no-quit<CR>
nnoremap fu :<C-u>Unite buffer file_mru -buffer-name=mru -no-quit<CR>
nnoremap fb :<C-u>Unite bookmark        -buffer-name=bookmark<CR>
nnoremap fl :<C-u>Unite line            -buffer-name=line<CR>
nnoremap fg :<C-u>Unite grep            -buffer-name=grep -no-quit -auto-preview<CR>
nnoremap f1 :<C-u>Unite file            -buffer-name=files -input=/Users/sigwyg/Dropbox/memo/<CR>

autocmd MyAutoCmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"
    " Overwrite settings.
    imap <buffer> <C-g> <Plug>(unite_input_directory)
endfunction"
"}}}


" -----------------------------------------------------------------------
" unite-grep: {{{
"  - https://github.com/Shougo/vimproc/tree/master
let g:unite_source_grep_command = "grep"
let g:unite_source_grep_default_opts = "-Hn"
"}}}


" -----------------------------------------------------------------------
" VimFiler: {{{
"  - https: //github.com/Shougo/vimfiler
"
let g:vimfiler_split_command = 'vertical rightbelow vsplit'
let g:vimfiler_min_filename_width = 20
"let g:vimfiler_max_filename_width = 50
let g:vimfiler_as_default_explorer = 1

autocmd MyAutoCmd FileType unite call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()"
    " Overwrite settings.
endfunction"
"}}}


" -----------------------------------------------------------------------
" VimShell: {{{
"  - https: //github.com/Shougo/vimshell
"
let g:vimshell_prompt = $USER."% "
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]%p", "(%s)-[%b|%a]%p")'
let g:vimshell_split_command = 'split'
let g:vimshell_editor_command = '/Applications/local/MacVim-kaoriya.app/Contents/MacOS/Vim  --servername=VIM --remote-tab-wait-silent'

autocmd MyAutoCmd FileType vimshell call s:vimshell_settings()
function! s:vimshell_settings()
    "imap <buffer><BS>  <Plug>(vimshell_another_delete_backward_char)
    "imap <buffer><C-h>  <Plug>(vimshell_another_delete_backward_char)

    call vimshell#altercmd#define('i', 'iexe')
    call vimshell#altercmd#define('is', 'iexe ssh')
    call vimshell#altercmd#define('gim', 'git commit -m')
    call vimshell#set_alias('la', 'ls -la')
    call vimshell#set_alias('gis', 'git status')
    call vimshell#set_alias('gid', 'git diff')
    call vimshell#set_alias('gic', 'git commit')

    " for Insert action on VimShell-history
    "call unite#custom_default_action('source/vimshell/history/completion' , 'insert')
    call unite#custom_default_action('vimshell/history' , 'insert')
endfunction
"}}}


" -----------------------------------------------------------------------
" textmanip.vim: {{{
"  - https://github.com/t9md/vim-textmanip
"
xmap <D-d> <Plug>(textmanip-duplicate-down)
nmap <D-d> <Plug>(textmanip-duplicate-down)
xmap <D-D> <Plug>(textmanip-duplicate-up)
nmap <D-D> <Plug>(textmanip-duplicate-up)

xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)
"}}}


" -----------------------------------------------------------------------
" quickhl.vim: {{{
"  - https://github.com/t9md/vim-textmanip
"
nmap <Space>m <Plug>(quickhl-toggle)
xmap <Space>m <Plug>(quickhl-toggle)
nmap <Space>M <Plug>(quickhl-reset)
xmap <Space>M <Plug>(quickhl-reset)
nmap <Space>j <Plug>(quickhl-match)
let g:quickhl_keywords = [
        \ {"pattern": '\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}', "regexp": 1 },
        \ {"pattern": "NOTE"},
        \ {"pattern": "MEMO"},
        \ {"pattern": "aside"},
        \ {"pattern": "　"},
        \ {"pattern": '\(\S\)\@<=\s\+$', "regexp": 1 },
        \ ]
"}}}


" -----------------------------------------------------------------------
" html5.vim: {{{
"  - https://github.com/othree/html5.vim
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1
"}}}


" -----------------------------------------------------------------------
" jslint.vim: {{{
"  - https://github.com/basyura/jslint.vim
"  - :copen -> :cnext ...
"augroup jslint
"    autocmd! jslint
"    autocmd FileType javascript call s:javascript_filetype_settings()
"augroup END
"
"function! s:javascript_filetype_settings()
"  autocmd BufLeave     <buffer> call jslint#clear()
"  autocmd BufWritePost <buffer> call jslint#check()
"  autocmd CursorMoved  <buffer> call jslint#message()
"endfunction

"}}}


" -----------------------------------------------------------------------
" indent-guides: {{{
"  - https://github.com/nathanaelkane/vim-indent-guides
"  - :IndentGuidesToggle
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_indent_levels = 30
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_space_guides = 1

let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 20
  
augroup indentGuide
    autocmd! indentGuide
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#191919 ctermbg=6
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#303030 ctermbg=0*
augroup END

"}}}


" -----------------------------------------------------------------------
" vim-powerline: {{{
"  - https://github.com/Lokaltog/vim-powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'
"}}}


" -----------------------------------------------------------------------
" w3m.vim: {{{
"  - https://github.com/yuratomo/w3m.vim
"let g:w3m#homepage = "http://www.google.co.jp/"
"let g:w3m#search_engine = 'http://www.google.co.jp/search?hl=ja&ie=' . &encoding . '&q='
"    \ 'http://search.yahoo.co.jp/search?search.x=1&fr=top_ga1_sa_124&tid=top_ga1_sa_124&ei=' . &encoding . '&aq=&oq=&p='
"}}}


" -----------------------------------------------------------------------
" syntastic: {{{
"  - https://github.com/scrooloose/syntastic
let g:syntastic_check_on_open=0
let g:syntastic_javascript_checker = 'jshint'
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': [''],
                            \ 'passive_filetypes': ['css'] }
"}}}


" -----------------------------------------------------------------------
" Like :CdCurrent {{{
"  - :CD
"
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
"}}}


" -----------------------------------------------------------------------
" htmlform.vim: {{{
"  - https: //github.com/sigwyg/htmlform.vim
"  - http://archiva.jp/web/sugamo_css/sugamo_vim_01.html
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
" }}}


" -----------------------------------------------------------------------
" for markdown: {{{
"  - http://archiva.jp/web/tool/vim2mkd.html
nnoremap \m :call DisplayMarkdown()<CR>
function! DisplayMarkdown()
    !perl ~/dotfiles/Markdown.pl --html4tags "%" > /tmp/__markdown.html;
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
" }}}


" -----------------------------------------------------------------------
" CSS3PropertyDuplicate(): {{{
"  - Origin: https://gist.github.com/972806
"  - Forked: https://gist.github.com/1901182
"
function! CSS3PropertyDuplicate()
    let l:css3   = getline(".")
    let l:line   = line(".")
    let l:ind    = matchlist(css3, '\v(\s*)(.*)')
    let l:webkit = ind[1] . "-webkit-" . ind[2]
    let l:moz    = ind[1] . "-moz-"    . ind[2]
    let l:ms     = ind[1] . "-ms-"     . ind[2]
    let l:o      = ind[1] . "-o-"      . ind[2]
    call append(line -1, [webkit, moz, ms, o])
    call cursor(line, 1)
endfunction
nnoremap <silent> ,3 :<C-u>call CSS3PropertyDuplicate()<CR>
" }}}



