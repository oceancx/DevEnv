set shell=bash
set nocompatible


" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS—Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
call vundle#end()
filetype plugin indent on


noremap h i
noremap i k
noremap k j
noremap j h

set number
set tabstop=4
" 定义快捷键的前缀，即<Leader>
let mapleader=";"





syntax enable
set background=dark
colorscheme solarized

autocmd BufWritePost $MYVIMRC source $MYVIMRC

"开始实时搜索
set incsearch
"搜索时大小写不敏感
set ignorecase
"关闭兼容模式
set nocompatible
" vim 自身命令行智能补全
set wildmenu

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T


" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

" 全屏开/关快捷键

map <silent> <F11> :call ToggleFullscreen()<CR>

" 启动 vim 时自动全屏

autocmd VimEnter * call ToggleFullscreen()


" 总是显示状态栏

set laststatus=2
" 显示光标当前位置
 set ruler
" 开启行号显示
 set number
" 高亮显示当前行/列
 set cursorline
 set cursorcolumn
" 高亮显示搜索结果
 set hlsearch


let g:Powerline_colorscheme='solarized256'


" 开启语法高亮功能
 syntax enable
" " 允许用指定语法高亮配色方案替换默认方案
 syntax on

 
" 自适应不同语言的智能缩进
 filetype indent on

 " 将制表符扩展为空格
  set expandtab
"  设置编辑时制表符占用空格数
  set tabstop=4
 " " 设置格式化时制表符占用空格数
  set shiftwidth=4
 " " 让 vim 把连续数量的空格视为一个制表符
  set softtabstop=4


" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle


"基于缩进或语法进行代码折叠
" set foldmethod=indent
 set foldmethod=syntax
" " 启动 vim 时关闭折叠代码
 set nofoldenable


 nmap <silent> <Leader>sw :FSHere<cr>


 let tagbar_left=1 
 nnoremap <Leader>ilt :TagbarToggle<CR> 

 let tagbar_width=32 
 let g:tagbar_compact=1
 let g:tagbar_type_cpp = {
  \ 'kinds' : [
          \ 'c:classes:0:1',
          \ 'd:macros:0:1',
          \ 'e:enumerators:0:0', 
          \ 'f:functions:0:1',
          \ 'g:enumeration:0:1',
          \ 'l:local:0:1',
          \ 'm:members:0:1',
          \ 'n:namespaces:0:1',
          \ 'p:functions_prototypes:0:1',
          \ 's:structs:0:1',
          \ 't:typedefs:0:1',
          \ 'u:unions:0:1',
          \ 'v:global:0:1',
          \ 'x:external:0:1'
      \ ],
      \ 'sro'        : '::',
      \ 'kind2scope' : {
          \ 'g' : 'enum',
          \ 'n' : 'namespace',
          \ 'c' : 'class',
          \ 's' : 'struct',
          \ 'u' : 'union'
      \ },
      \ 'scope2kind' : {
          \ 'enum'      : 'g',
          \ 'namespace' : 'n',
          \ 'class'     : 'c',
          \ 'struct'    : 's',
          \ 'union'     : 'u'
      \ }
      \ }

