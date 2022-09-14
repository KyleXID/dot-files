set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Vim에서 Git 사용하게 해주는 플러그인 airline에 연동되어 상태바에 브랜치가 뜸
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else. 충돌로 인하여 비활성화
" Plugin 'ascenator/L9', {'name': 'newL9'}
" cs"'.
Plugin 'surround.vim'
" \adec
Plugin 'Align'
" 상태바 변경플러그인
Plugin 'vim-airline/vim-airline'
" 코드 문법체크
" Plugin 'scrooloose/syntastic'
" PEP 8 문법체크
Plugin 'nvie/vim-flake8'
" Vim Color
Plugin 'ScrollColors'
" NERDtree m누르면 파일추가수정삭제 등 가능
Plugin 'scrooloose/nerdtree'
" ctrl + p 파일 찾기 플러그인
Plugin 'ctrlpvim/ctrlp.vim'
" csv 가독성 플러그인
Plugin 'chrisbra/csv.vim'
" 문자열 끝 공백 삭제/확인
Plugin 'bad-whitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

execute pathogen#infect()
syntax on
filetype plugin indent on

" 80컬럼 넘어갈 시 자동 줄바꿈 및 선표시
highlight ColorColumn ctermbg=blue guibg=NONE
au BufNewFile,BufRead *.py
    \ let python_highlight_all=1 |
    \ syntax on |
    \ set colorcolumn=88 |
    \ set tabstop=4 |
    \ set softtabstop=4 |
"    \ set textwidth=79 |
    \ set expandtab |
    \ set fileformat=unix

" 파이썬 문법체크
autocmd BufWritePost *.py call Flake8()

" set을 이용하여 VIM 기본 설정 지정
set number
set mouse=a
set title
set tabstop=2
set background=dark

" vim 스킨 머스터마이징
colorscheme molokai
set transparency=5
set guifont=D2Coding:h16
set guifontwide=D2Coding:h16

let macvim_skip_colorscheme=1

" NERDTree dot file show
let NERDTreeShowHidden=1

map <F3> :NERDTreeToggle<CR>
map ee :EraseBadWhitespace<CR>

" macvim 탭이동 단축키
if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

" TagList
" vim 열면 자동으로 오픈
" let Tlist_Auto_Open=1
" 분할 창 오른쪽에 배치
let Tlist_Use_Right_Window=1
" 토글
map <F4> :TlistToggle<CR>
" 오픈 너비
let Tlist_winWidth = 40
