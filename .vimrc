colorscheme darkblue
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set backspace=2
set cindent shiftwidth=4
set smartindent
set autoindent!
set number!
"set showmatch
set mouse=a
set ruler
set incsearch
set ignorecase
set hlsearch
set nowrapscan
set nocompatible
set vb t_vb=
set cursorline
set hidden
set list
set listchars=tab:\|\ 
set wildmenu

syntax enable
syntax on
filetype indent on
filetype plugin on
filetype plugin indent on

set writebackup
set nobackup
set autochdir
set nowrap
set foldmethod=syntax
set foldlevel=100

set laststatus=2
set cmdheight=2

set fenc=utf-8
set encoding=utf-8

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" " vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'tomasr/molokai'
" Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
" Plugin 'kshenoy/vim-signature'
" Plugin 'vim-scripts/BOOKMARKS—Mark-and-Highlight-Full-Lines'
" Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
" Plugin 'dyng/ctrlsf.vim'
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'vim-scripts/DrawIt'
" Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'derekwyatt/vim-protodef'
" Plugin 'scrooloose/nerdtree'
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'gcmt/wildfire.vim'
" Plugin 'sjl/gundo.vim'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'lilydjwg/fcitx.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'will133/vim-dirdiff'
" " 插件列表结束
call vundle#end()
filetype plugin indent on

" 设置插件 indexer 调用 ctags 的参数
" " 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" " 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions = "--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
let g:indexer_dontUpdateTagsIfFileExists = 1

autocmd BufNewFile *.py call SetPythonHeader()
function SetPythonHeader()
    0read ~/.vim/templates/python_header
    normal! G
endfunction

