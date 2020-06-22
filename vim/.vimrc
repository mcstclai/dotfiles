set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'valloric/youcompleteme'
" Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'csliu/a.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mileszs/ack.vim'
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'Conque-GDB'
Plugin 'chrisbra/csv.vim'
Plugin 'moll/vim-bbye'
Plugin 'rdnetto/YCM-Generator'
" Plugin 'jeaye/color_coded'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'
Plugin 'DoxygenToolkit.vim'
Plugin 'vhdirk/vim-cmake'
" Plugin 'dense-analysis/ale'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'airblade/vim-gitgutter'
" Plugin 'gauteh/vim-cppman' " screws up c++ iskeyword
Plugin 'aklt/plantuml-syntax'

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

let g:limelight_conceal_ctermfg = 'black'

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

if &term =~ '^screen'
	" tmux knows the extended mouse mode
	set ttymouse=xterm2
endif

if &t_Co > 2 || has("gui_running")
	" Switch on highlighting the last used search pattern.
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	augroup numbertoggle
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
		autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
	augroup END

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
	augroup END

	augroup rusty_tags
		autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
		autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
	augroup END
else
	" always set autoindenting on
	set autoindent
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
	packadd matchit
endif

" line numbering
set number relativenumber

" YouCompleteMe
let g:ycm_always_populate_location_list = 1

" Airline
" set t_Co=256
let g:airline_solarized_bg = 'dark'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#mixed_indent_algo = 2

" a.vim
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../include/b10'

" Solarized
syntax enable
if has('gui_running')
	set background=light
else
	set background=dark
endif
let g:solarized_termtrans = 1
colorscheme solarized

" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Tag Support
set tags=./md_tags;,./tags,tags;

" NERDTree
let g:NERDTreeIgnore=['cscope', 'CTAGS', '^tags$', '\.o$', '\.vim$', '\~$']

" Function Key Mappings
map <F2> :mksession! ./Session.vim <cr>
map <F3> :source ./Session.vim <cr>
set pastetoggle=<F4>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <silent> <F6> :NERDTreeToggle<CR>
map <F7> mzgg=G`z
nmap <F4> :TagbarToggle<CR>
nnoremap <silent> <F10> :YcmCompleter FixIt<CR>
" Camel Case to underscores
nnoremap <silent> <F11> :s#\C\(\<\u[a-z0-9]\+\\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g<CR>
vnoremap <F11> :s#\%V\C\(\<\u[a-z0-9]\+\\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g<CR>
nnoremap <silent> <F12> :%s#\C\(\<\u[a-z0-9]\+\\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g<CR>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Bbye map
:nnoremap <Leader>q :Bdelete<CR>

" Cycle buffers with Tab
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Ctrl-p
let g:ctrlp_extensions=['tag', 'buffertag']

" Style Options
" set expandtab
" set shiftwidth=4
" set softtabstop=4
" set equalprg=/usr/bin/astyle\ -n\ -z2\ --style=1tbs

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

"Pandoc settings
let g:pandoc#folding#level=1
let g:c_curly_error=1

"Pandoc related keymaps
nnoremap <leader>gq :%!pandoc -f html -t markdown<CR>
vnoremap <leader>gq : !pandoc -f html -t markdown<CR>

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" Vim man page support
runtime ftplugin/man.vim

"allow per=project .vimrc
set exrc
set secure

let g:pandoc#syntax#codeblocks#embeds#langs = ["c", "cpp", "js=javascript", "python", "bash=sh", "shell=sh", "sh", "vim", "help"]
let g:markdown_fenced_languages = ["c", "cpp", "js=javascript", "python", "bash=sh", "shell=sh", "sh", "vim", "help"]

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist = {}

if !isdirectory($HOME."/.vim")
	call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
	call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" pull in saved regexes
source ~/.regexlist.vim

" add cscope mappings
source ~/.cscope_maps.vim
let g:alternateNoDefaultAlternate = 1

" don't indent namespaces
set cino+=N-s

" update faster (for gitgutter, especially)
set updatetime=100
