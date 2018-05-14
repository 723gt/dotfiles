"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/natsumi/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/natsumi/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
"Rubyのendを自動で入れてくれるやーつ
NeoBundle 'tpope/vim-endwise'
"Twitterやる
NeoBundle 'twitvim/TwitVim'

"YAML
NeoBundle 'mrk21/yaml-vim'

"Rubyのシンタックスハイライト  
NeoBundle 'todesking/ruby_hl_lvar.vim'

"Rails開発を便利にするやつ
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'https://github.com/leafgarland/typescript-vim.git'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------



"行数表示
set number

"対応括弧の表示と表示時間
set showmatch
set matchtime=1

"自動インデントのスペースサイズ
set expandtab
set tabstop=2
set shiftwidth=2

"mdのシンタックスハイライト
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

"シンタックスハイライトオン
syntax enable
syntax on

"カッコ入れてくれるかっこいいやつ  
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
"クォーテーションを入れてくれるやつ
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"バックスペースを有効化
set backspace=indent,eol,start

if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"
            
  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction
                                       
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

let twitvim_count = 40
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tn :<C-u>NextTwitter<CR>
autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
    set nowrap
endfunction

:command Ft FriendsTwitter
:command PT PosttoTwitter

nnoremap nt :<C-u>tabnew<CR>
nnoremap T gt

"tabnewした後エクスプローラー
:command Et call TabnewEx()
:command Nt call TabnewEx()

function TabnewEx()
  tabnew
  e .
endfunction

":command Rinit :r ~/dotfiles/vim/template/init.rb
autocmd BufNewFile *.rb 0r ~/dotfiles/vim/template/init.rb
autocmd BufNewFile *.html 0r ~/dotfiles/vim/template/tamplate.html

:source /Users/natsumi/program/rubocop/main.vim

"vim-railsのalias
:command Ec Econtroller
:command Em Emodel
:command Ev Eview
:command Ej Ejavascript

" TypeScript
"Bundle 'typescript-vim'
"autocmd BufRead,BufNewFile *.ts set filetype=typescript
