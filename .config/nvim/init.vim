
set number
set mouse=a
set inccommand=split
set incsearch ignorecase smartcase hlsearch
set colorcolumn=120  " Muestra la columna límite a 120 caracteres
set cursorline  " Resalta la línea actual
set hidden  " permitir cambiar de buffers sin tener que guardarlos
set spelllang=en,es  " corregir palabras usando diccionarios en inglés y español
set termguicolors  " Activa true colors en la terminal

let mapleader=","

nmap <leader>r :so ~/.config/nvim/init.vim<CR>

" Abrir el archivo init.vim con <líder> + e
  nnoremap <leader>e :e $MYVIMRC<CR>
  nnoremap <leader>t :e ~/.tmux.conf<CR>
  nnoremap <leader>, :e /tmp/fz3temp-2/<CR>

" Save file as sudo on files that require root permission
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

