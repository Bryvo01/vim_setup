" based <mostly> on http://linuxcommand.org/lc3_adv_vimvigor.php
set nocompatible	" required to use Vundle

" default vim setting if there is no extension.vim file in
" ftplugin directory
set number
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set splitright
set encoding=utf-8
set clipboard=unnamed

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding with spacebar
nnoremap <space> za

" Enable folding
set foldmethod=indent
set foldlevel=99

filetype off		" required to use Vundle

" set the runtime path to include Vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimplyFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin

" ...

" All of your Plugins must be added before the following line
call vundle#end()	" required to use Vundle
filetype plugin indent on 	" required to use Vundle

" YouCompleteMe (ycm) customizations 
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_stop_completion=['<C-y>', '<CR>']
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" nerdtree customizations
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" colorscheme logic
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
call togglebg#map("<F5>")

" python with virtualenv support
py3 3
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(projectbase_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
