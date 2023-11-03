" With help from Nicolo Chapiolo: https://github.com/nchiapol/vim-config

set history=50		    " keep 50 lines of command line history
set ruler		        " show the cursor position all the time
set lsp=0               " space it out a little more (easier to read)
set wildmenu            " turn on wild menu
set showcmd		        " display incomplete commands
set cmdheight=2         " the command bar is 2 high
set number              " turn on line numbers
set lz                  " do not redraw while running macros (much faster) (LazyRedraw)
set hidden              " you can change buffer without saving
set backspace=2         " make backspace work normal
set report=0            " tell us when anything is changed via :...
set noerrorbells        " don't make noise
set softtabstop=4       " pressing tab indents by 4 columns
set shiftwidth=4        " automtic indent is 4 columns
set tabstop=4           " \t is displayed as 4 spaces
set expandtab           " replace \t with spaces when saving
set ignorecase          " search is case insensitive
set smartcase           " UNLESS it cointains an uppercase char
set encoding=utf-8      " set encoding used when displaying
set scrolloff=3         " scroll offset: leave n lines below/above when scrolling
set showmode            " show mode at bottom
set ttyfast             " indicate fast terminal connection
" set undofile            " create .<filename>.un~ to allow undo after close+open

" highlighting
set showmatch     " show matching brackets
set hlsearch      " do highlight searched for phrases (cleared with `<leader><space>` see below)
set incsearch     " BUT do highlight as you type you search phrase

" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\

" configs statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{FugitiveStatusline()}
set laststatus=2    " always show the status line


" call vim plugin file
if filereadable(expand("~/.vimrc.plug"))
 source ~/.vimrc.plug
endif

filetype plugin indent on
" source ~/.vim/syntastic.vimrc

" Pyhton-Jedi configs

" Do not lust attributes while typing
let g:jedi#popup_on_dot=0
" Do (not) show call hints
let g:jedi#show_call_signatures=1
" When jumping to definition use new window
let g:jedi#use_splits_not_buffers='winwidth'


" Plugin section:
"call plug#begin()
"    Plug 'nordtheme/vim'
"call plug#end()


" Fix un-readable comments:
if (has("termguicolors"))
set termguicolors
endif

" Make customications
let g:nord_italic = 1
let g:nord_italic_comments = 1

colorscheme nord


