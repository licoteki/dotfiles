" 行番号を表示
set number
" 改行時自動インデント
set autoindent
" タブを空白*2に設定
set tabstop=2
" 自動インデント時のタブを空白*2に設定
set shiftwidth=2
" タブを空白に変換
set expandtab
" 画面水平分割時に右に開く
set splitright
" yankデータをクリップボードに転送
set clipboard=unnamed
" 検索にヒットした文字列をハイライト
set hls


" Grafics config
set pumblend=10
set termguicolors
colorscheme molokai

let g:python3_host_prog='C:/Users/Administrator/AppData/Local/Programs/Python/Python310/python.exe'

call plug#begin('~/.config/nvim/plugged')
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'junegunn/fzf', { 'dir': '~/.config/nvim/plugged/.fzf', 'do': './install --all' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'rust-lang/rust.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'tpope/vim-fugitive'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
  Plug 'mattn/vim-sonictemplate'
call plug#end()

" NERDTREE config
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" vim-airline config
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" vim-sonictemplate config
let g:sonictemplate_vim_template_dir = [
  \ '$XDG_CONFIG_HOME/nvim/template'
  \]
