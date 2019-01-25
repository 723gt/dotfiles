"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/natsumi/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/natsumi/.vim/bundle')
  call dein#begin('/Users/natsumi/.vim/bundle')

 " Let dein manage dein
 " Required:
  call dein#add('/Users/natsumi/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " My plugin's

  call dein#add('tpope/vim-endwise')
  call dein#add('twitvim/TwitVim')
  call dein#add('mrk21/yaml-vim')
  call dein#add('todesking/ruby_hl_lvar.vim')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-surround')
  call dein#add('723gt/vitter')

  call dein#add('vim-jp/vimdoc-ja')
  call dein#add('slim-template/vim-slim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on
" startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


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
""syntax enable
""syntax on

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

"タブの移動
nnoremap nt :<C-u>tabnew<CR>
nnoremap T gT
nnoremap " gt

"tabnewした後エクスプローラー
:command Et call TabnewEx()
:command E call TabnewEx()
:command Ee e .

function TabnewEx()
  tabnew
  e .
endfunction

":command Rinit :r ~/dotfiles/vim/template/init.rb
autocmd BufNewFile *.rb 0r ~/dotfiles/vim/template/init.rb
autocmd BufNewFile *.html 0r ~/dotfiles/vim/template/tamplate.html

:source /Users/natsumi/program/rubocop/main.vim
"source /Users/natsumi/program/vitter/plugin/vitter.vim

"vim-railsのalias
:command Ec Econtroller
:command Em Emodel
:command Ev Eview
:command Ej Ejavascript

" vsprit
:command Ss split
" TypeScript
"Bundle 'typescript-vim'
"autocmd BufRead,BufNewFile *.ts set filetype=typescript
inoremap <C-c> <ESC>

set statusline=%F
set laststatus=2
set statusline+=%=
""set statusline+=%{g:this_branch}

highlight statusline   term=NONE cterm=NONE guifg=cyan ctermfg=white ctermbg=lightblue

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

set spelllang=en,cjk

set clipboard+=unnamed
set clipboard+=autoselect
