let mapleader=","
map ; :
inoremap jj <Esc>

call plug#begin()
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'  " Temas para airline
  Plug 'sheerun/vim-polyglot'  " Languages Packs
  Plug 'dense-analysis/ale'  " Check syntax
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  "themes
  Plug 'joshdick/onedark.vim'
call plug#end()

set mouse=a
set inccommand=split
set incsearch ignorecase smartcase hlsearch
set colorcolumn=120  " Muestra la columna límite a 120 caracteres
set termguicolors  " Activa true colors en la terminal
set cursorline  " Resalta la línea actual
set hidden  " permitir cambiar de buffers sin tener que guardarlos
set spelllang=en,es  " corregir palabras usando diccionarios en inglés y español
set fileencoding=utf-8

set smartindent
set expandtab         "tab to spaces
set tabstop=2         "the width of a tab
set shiftwidth=2      "the width for indent

set wildignore+=**/.git/**,**/__pycache__/**,**/venv/**,**/node_modules/**,**/dist/**,**/build/**,*.o,*.pyc,*.swp

" Abrir el archivo init.vim con <líder> + e
  nnoremap <leader>e :e $MYVIMRC<CR>
  nnoremap <leader>t :e ~/.tmux.conf<CR>
  nnoremap <leader>, :e /tmp/fz3temp-2/<CR> " editar archivos de filezilla
  nnoremap <leader>n :bn<CR> " navegar entre buffers

" Save file as sudo on files that require root permission
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


"set wildmode=longest,list,full

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
  set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

"Persistent undo
set undofile
set undodir =~/.config/nvim/undodir

"Vim-airline

  let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
  let g:airline#extensions#branch#enabled = 1 "branch
  let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

  " Cargar fuente Powerline y símbolos (ver nota)
  let g:airline_powerline_fonts = 1
  set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

"FZF super fuzzy finder
nnoremap <C-p> :Files<CR>

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Automatically deletes all trailing whitespace on save.
  autocmd BufWritePre * %s/\s\+$//e
" Autoreload the vimrc
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
" Autoreload .Xresources and ,Xdefaults after save
    autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
"Refresh vimdiff views if a file is saved in another window
    autocmd BufWritePost * if &diff | diffupdate | endif
