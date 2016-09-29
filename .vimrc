"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/natsumi/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/natsumi/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" ファイルをtree表示してくれるやーつ
"NeoBundle 'scrooloose/nerdtree'
"Rubyのendを自動で入れてくれるやーつ
NeoBundle 'tpope/vim-endwise'
"複数行にコメント入れてくれるやーつ
"NeoBundle 'tomtom/tcomment_vim'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------



"タブサイズ
set tabstop=2

"行数表示
set number

"対応括弧の表示と表示時間
set showmatch
set matchtime=1

"自動インデントのスペースサイズ
set shiftwidth=0

"mdのシンタックスハイライト
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

"シンタックスハイライトオン
syntax enable
syntax on


