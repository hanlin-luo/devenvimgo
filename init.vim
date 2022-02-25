" general setting
set number
set nobackup
set noundofile
set virtualedit=block
set background=dark

" tab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" keybind
let mapleader="\ "
map ' `

" control shortcut
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <C-W>n :bnext<CR>
nnoremap <C-W>p :bprevious<CR>
nnoremap <C-t>c :tabedit<CR>
nnoremap <C-t>n :tabnext<CR>
nnoremap <C-t>p :tabprevious<CR>

" re-select area
vnoremap < <gv
vnoremap > >gv

if &compatible
  set nocompatible
endif

let s:nvim_home = expand('~/.nvim')
let s:dein_path = s:nvim_home . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_path
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_path, ':p')
endif

if dein#load_state(s:nvim_home)
  call dein#begin(s:nvim_home)

  " develop
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('scrooloose/nerdcommenter')

  " golang
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('fatih/vim-go')

  " python
  call dein#add('neovim/python-client')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

""" deoplete
set completeopt=menuone
set completeopt+=noinsert
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

""" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode.exe'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

""" vim-go
let g:go_fmt_command = "goimports"

" vim:ft=vim foldmethod=marker tw=78