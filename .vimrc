" Encoding --> UTF8
set encoding=utf-8
set fileencoding=utf-8

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.

" Le thème et la coloration synthaxique
colorscheme minimalist
set t_Co=256

if has("syntax")
	 syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch hlsearch	" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set number
set noshowmode 		" Retire le insert en insertion

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" On configure la touche leader
" Pour savoir quel touche y est assignée : ':echo mapleader'
let mapleader = "\\"

" Raccourcis d'enregistrement
noremap <leader>w :w<cr>
nnoremap <leader>a :wqall<cr>
nnoremap <leader>q :qall!<cr>

" Retirer les flèches directionnelle en mode normal (n)
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>

" Retirer les flèches directionnelles en mode insertion (i)
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

" Ajout abréviation (Quand on veut écrire l'abréviation sans mettre le truc on
" fait CRTL-V)

" JAVA
autocmd FileType java ab psvm public static void main(String[] args) { } <Esc>hi<Return><Esc>O<Tab>
autocmd FileType java ab sysout System.out.println(); <Esc>hhi
autocmd FileType java ab syserr System.err.println(); <Esc>hhi

" Abréviation pour coder en C
autocmd FileType c ab fp fprintf(fres, ""); <Esc>hhhi
autocmd FileType c ab fs fscanf(); <Esc>hhi
autocmd FileType c ab ""<Esc>i
autocmd FileType c ab main int main() {}<Esc>hi<Return><Esc>li<Enter><Esc>O
autocmd FileType c ab [ []<Esc>i

" Abréviation html 
autocmd FileType html imap <c-c> <Esc>diwi<<Esc>pa></<Esc>pa><Esc>bba
autocmd FileType html ab <! <!----><Esc>hhi

" Permet utilisation de plugins dans vim
execute pathogen#infect()

" **** Option pour switcher entre relative number ****
" Il faut appuyer sur Ctrl + Shift + n (Ctrl - N) pour switcher entre relative et normal number
nnoremap <c-N> :call ToggleRNU()<cr>

function! ToggleRNU()
	set rnu!
endfunction

" Ouvrir explorateur de projets avec CTRL - P
nnoremap <c-P> :NERDTreeToggle<cr>

" BUFFERLINE SETTINGS
let g:bufferline_echo = 1
nmap <leader>t :bn<cr>
nmap <leader>T :bp<cr>
nmap <leader>l :buffers<cr>
nmap <leader>d :bd<cr>
nmap <leader>e :enew<cr>
