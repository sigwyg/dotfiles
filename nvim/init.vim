" for Python
" pyenv + pyenv-virtualenv
let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/3.7.1/envs/neovim3/bin/python'

" -----------------------------------------------------------------------
" Basis:{{{
"

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
syntax on
set cursorline
highlight CursorLine cterm=bold
"colorscheme jellybeans
"colorscheme h2u_black
"set cursorcolumn
"highlight CursorColumn cterm=bold ctermbg=0
"highlight LineNr ctermfg=0


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
"set clipboard+=unnamedplus
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
endif

"}}}


" -----------------------------------------------------------------------
" QuickStart: {{{
"  - gundo.vim (https://github.com/sjl/gundo.vim)
"  - jslint.vim(https://github.com/basyura/jslint.vim)
"  - VimFiler  (https: //github.com/Shougo/vimfiler)
"
nnoremap <F1> <Nop>
nnoremap <F2> :<C-u>IndentGuidesToggle<CR>
nnoremap <F3> :<C-u>VimFiler<CR>
nnoremap <F4> :<C-u>SyntasticToggleMode<CR>
nnoremap <F5> :<C-u>GundoToggle<CR>
"}}}


" -----------------------------------------------------------------------
" Keymap:{{{
" --------------------

" timeout
"set timeout
"set timeoutlen=3000
"set ttimeoutlen=100

" effective keymap
vnoremap y ygV
vnoremap d dgV
onoremap y ygV
onoremap d dgV

" alter <Esc>
"inoremap <expr> j getline('.')[col('.') - 2] ==# 'j' ? "\<BS>\<ESC>" : 'j'
inoremap jj <Esc>

" killed
nnoremap <F1> <Nop>
nnoremap Q <Nop>
nnoremap m <Nop>
nnoremap gh <Nop>

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
nnoremap fs ^
vnoremap fs ^
nnoremap fe $
vnoremap fe $<LEFT>
nnoremap <Leader><Space> %
vnoremap <Leader><Space> %

" move Tab
" - "gh" is often desabled (go select-mode)
nnoremap gh gT
onoremap gh gT
nnoremap gt gT
onoremap gt gT
nnoremap gl gt

" text-edit
noremap <CR> i<CR><ESC>
vnoremap <C-h> <
vnoremap <C-l> >
inoremap <C-l> <Right>

" brackets"
" - use smart-input???
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
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

" Change window-size
nnoremap <silent> <Left>  :<C-u>5wincmd <<CR>
nnoremap <silent> <Right> :<C-u>5wincmd ><CR>
nnoremap <silent> <Down>  :<C-u>resize -3<CR>
nnoremap <silent> <Up>    :<C-u>resize +3<CR>

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

" Terminal-mode
tnoremap <silent> <ESC> <C-\><C-n>

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

    " enable colorscheme
    au MyAutoCmd VimEnter * nested colorscheme jellybeans

    " If open new-buffer, set expandtab
    autocmd BufNewFile,BufRead * set expandtab

    " go to file!
    autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

    " format
    autocmd FileType markdown setlocal wrap
    autocmd FileType text setlocal textwidth=0

    " set less-syntax
    autocmd BufEnter *.less set filetype=scss
    autocmd BufEnter *.scss set filetype=scss

augroup END

" delete last-line, if only blank text
autocmd MyAutoCmd BufWritePre * call s:remove_line_in_last_line()
function! s:remove_line_in_last_line()
  if getline('$') == ""
     $delete _
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
autocmd! BufEnter * if &filetype == "html" | call MapHTMLKeys() | endif
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
" NoTrailingSpaces: {{{
"
function! NoTrailingSpaces() range
    let l:count = a:firstline

    while l:count <= a:lastline
        let l:str = getline(l:count)
        let l:out = substitute(l:str, '\s\+$', '', '')
        call setline(l:count, l:out)
        let l:count = l:count + 1
    endwhile
endfunction
vnoremap \n :call NoTrailingSpaces()<CR>
" }}}


" -----------------------------------------------------------------------
" htmlform.vim: {{{
"  - https://github.com/sigwyg/htmlform.vim
"  - http://archiva.jp/web/sugamo_css/sugamo_vim_01.html
"

" ChangeUL
vnoremap \u :call ChangeUL()<CR>
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
vnoremap \t :call ChangeTable()<CR>
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


" Dein.vim: {{{
"  - https://github.com/Shougo/dein.vim
"
if &compatible
  set nocompatible
endif

" set path
"  - '~/.cache/dein'
"  - '~/.cache/dein/repos/github.com/Shougo/dein.vim'
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" auto-install for dein.vim
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" Load plugins & Make cache
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " load toml
  let s:toml_dir = fnamemodify(expand('<sfile>'), ':h')
  let s:toml = s:toml_dir . '/dein.toml'
  let s:toml_lazy = s:toml_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})
  " required
  call dein#end()
  call dein#save_state()
endif

" auto install for plugins of lacked
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
" }}}
