"""""""""""""""""""""""""
" プラグインのセットアップ
"""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'
" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'
" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'
" インデントに色をつけて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
" Vimを立ち上げ時に、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" colorschemeのダウンロード
Plug 'karoliskoncevicius/moonshine-vim', {'do': 'cp colors/* ~/.vim/colors/'}

call plug#end()



"""""""""""""""""""""""""
" 各種オプションの設定
"""""""""""""""""""""""""

" 行番号を追加する
set number
" シンタックハイライトを有効にする
syntax enable
"ファイルタイプの自動検出、ファイルタイプ用のプラグインとインデント設定を自動読み込みするようになる。
filetype plugin indent on
" 検索結果のハイライト
set hlsearch
"検索パターンで大文字と小文字を区別しない
set ignorecase
" 検索コマンド入力中から検索が始まる
set incsearch
" 最下ウィンドウのステータス行を常に表示する
set laststatus=2
"検索時、小文字で検索した場合は、大文字小文字の違いは無視、大文字を含む文字列で検索した場合は無視しない
set smartcase
" hi Comment ctermfg=7
" タブ文字の表示幅
set tabstop=2
"改行時にインデントを揃える
set autoindent
"テキストの折り返し
set wrap
"Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
"set clipboard=unnamedplus
" エディタ画面の色調整を最適化する
set background=dark
" カラースキーマ設定
" colorscheme moonshine
colorscheme alduin
" 行番号の色
highlight LineNr ctermfg=darkyellow
" カーソルのあるカレントの行に下線
set cursorline
" 行のハイライトの色指定
highlight CursorLine ctermfg=Green
" カーソルのあるカレントの列にハイライト
set cursorcolumn
" 列のハイライトの色指定
highlight CursorColumn ctermfg=Green
" EscをCtrl + jにする
imap <C-j> <esc>
noremap! <C-j> <esc>

" NERDTreeのエイリアス設定
nnoremap <C-b> :NERDTreeToggle<CR>


" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
				autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
"""""""""""""""""""""""""""""""
