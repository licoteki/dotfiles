"行番号表示
set number
"シンタックスハイライト
syntax on
"マウススクロール
set mouse=a 
"ヤンクでクリップボード使用
set clipboard=unnamed,autoselect
"colorschmeにmolokai
colorscheme molokai
" Tab入力時にをスペース挿入
set expandtab
" Tabの幅を設定
set shiftwidth=2
set softtabstop=2
set tabstop=2
"自動インデントを無効化
set noautoindent
" netrwを有効化
filetype plugin on
"折り返さない
set nowrap

" plugin manager
call plug#begin()

call plug#end()
