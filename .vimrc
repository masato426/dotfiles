"""""""""""""""""""""""""
:" プラグインのセットアップ
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
Plug 'karoliskoncevicius/moonshine-vim', {'do': 'cp colors/* ~/.vim/colors/'}

call plug#end()



"""""""""""""""""""""""""
" 各種オプションの設定
"""""""""""""""""""""""""

" 行番号を追加する
set number
" シンタックハイライトを有効にする
syntax enable
filetype plugin indent on
" hi Comment ctermfg=7
" タブ文字の表示幅
set tabstop=2
"Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
set clipboard=unnamedplus
set background=dark
" カラースキーマ設定
" colorscheme moonshine
colorscheme alduin

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
