if empty(glob('~/.vim/autoload/plug.vim'))
    silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source '~/.vimrc'
endif

call plug#begin()

Plug 'nordtheme/vim'
Plug 'vim-airline/vim-airline'

call plug#end()
