if has('gui_macvim')
"    set imdisable       " IMを無効化
"    set iminsert=0      " 日本語入力を抑制
    set guioptions-=T   " 上部のアイコンを消す
    set showtabline=2   " タブを常に表示
    set transparency=12 " 透明度を指定
    
    set sessionoptions+=resize " 行・列を設定する
    set lines=40               " 行数
    set columns=140            " 横幅
    set cmdheight=1            " コマンドラインの高さ
    set previewheight=5        " プレビューウィンドウの高さ
    set splitbelow             " 横分割したら新しいウィンドウは下に
    set splitright             " 縦分割したら新しいウィンドウは右に
    set visualbell
 
    set antialias
    set guifont=Courier\ New:h14
    colorscheme ir_black
    "highlight Normal guibg=#0000ff
    highlight CursorLine term=underline cterm=underline gui=underline guisp=#555566
    highlight CursorColumn guibg=#222233
    
endif


