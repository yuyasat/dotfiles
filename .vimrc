" _/_/_/_/ Initialization  _/_/_/_/
filetype off " 一時的にファイルタイプ関連を無効化

" _/_/_/_/ Common settings _/_/_/_/
syntax enable

set background=dark
colorscheme elflord

set encoding=utf-8
set fileencodings=utf-8,sjis,euc
set fileformats=unix,dos,mac

highlight ColorColumn ctermbg=236
execute "set colorcolumn=" . join(range(81,100), ',')

" vimdiff用の設定
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

set nobackup " バックアップを無効化
set number " 行番号を表示
set incsearch " インクリメンタルサーチ
set ignorecase smartcase " 小文字のみの検索時に大文字小文字を無視
set showmatch " 対応する括弧のハイライト表示
set showmode " モード表示
set title " 編集中のファイル名を表示
set ruler " ルーラーを表示
set expandtab " タブ入力を複数の空白入力に置き換え
set tabstop=2 " 画面上でタブ文字が占める幅
set shiftwidth=2 " 自動インデントの幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを増減
set scrolloff=10 " スクロール時に表示を10行確保
set whichwrap+=hl<>[] " 行頭行末から次の行へ移動
set backspace=indent,eol,start " バックスペース有効化
set ambiwidth=double " 曖昧幅の文字幅をダブルにする
set nofoldenable " 折りたたみ無効化
set clipboard=unnamed,autoselect " ヤンク時にクリップボードにコピー
"set mouse=a " マウス有効化
set vb t_vb= "ビープ音無効化
set hlsearch " 検索文字をハイライト

au BufWritePost * mkview
autocmd BufReadPost * loadview
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

" 不可視文字の表示
set list
"set listchars=tab:»-,trail:-,eol:,extends:»,precedes:«,nbsp:%

" キーワード補完を常時起動
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor

" undofileの設定
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

"-----ここからTaki-----"
source $VIMRUNTIME/macros/matchit.vim "%で移動できる"

"-----resence（ruby保管)-----"
" dein
" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" 各プラグインをインストールするディレクトリ
let s:plugin_dir = expand('~/.vim/')

" dein.vimをインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

" dein.vimがまだ入ってなければ 最初に git clone
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

"dein plugin settings
if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)
endif

" ここからインストールするプラグイン
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/neocomplcache-rsense.vim')


" neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1


" Rsense用の設定
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"rsenseのインストールフォルダがデフォルトと異なるので設定
let g:rsenseHome = expand("*Rsenseのインストールパスをここにペースト*")
let g:rsenseUseOmniFunc = 1

"-----NeoBundle prepare-----"
set nocompatible
filetype plugin indent off            " for NeoBundle
set whichwrap=b,s,<,>,[,] " 行末で右矢印で次の行の先頭へ等
set ttymouse=xterm2

filetype plugin indent on       " ファイルタイプ関連を再度有効化

