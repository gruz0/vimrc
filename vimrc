" Необходимо для корректной работы в El Capitan с zsh
set shell=bash

set nocompatible
filetype off

" Автоматическое считывание конфига Vim после его перезаписи
" au BufWritePost .vimrc so $MYVIMRC

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

call vundle#begin()

Plugin 'gmarik/vundle'

" Сканирует файл на наличие todo, fixme-директив, включается через <Leader>t
let mapleader=','
Plugin 'vim-scripts/TaskList.vim'

" Поддержка RuboCop
Plugin 'ngmy/vim-rubocop'

" Поддержка Git
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
let g:Gitv_OpenHorizontal = 1

" Неплохая реализация Git Diff, запуск по ,gd
Plugin 'int3/vim-extradite'
nmap <Leader>gd :Extradite<CR>

" Добавляет в левый сайдбар маркеры +/-/~ для вывода статуса строк из git diff
Plugin 'airblade/vim-gitgutter'

" Изменяет строку статуса на более функциональную
Plugin 'bling/vim-airline'

" Поддержка CoffeeScript
" В файле *.coffee запускать как :CoffeeCompile vert для тестовой компиляции в JS
Plugin 'kchmck/vim-coffee-script'

" Отправка существующего буфера или куска кода в gist.github.com
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" По gS/gJ разворачивает/сворачивает однострочное постфиксное условие в многострочное и наоборот
" Например, puts "foo" if bar? развернёт в:
" if bar?
"   puts "foo"
"   puts "baz"
" end
Plugin 'AndrewRadev/splitjoin.vim'

" Позволяет выравнивать код по нужному знаку, например, все "=" отбить с единым отступом в коде
" Пример: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" Использовать в VisualMode:
" :Tab /=
" :Tab /:\zs
Plugin 'godlygeek/tabular'
let mapleader=','
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Подсвечивает HEX-значения в CSS/HTML
Plugin 'ap/vim-css-color'

" Дерево файлов и директорий, включается по Ctrl+N
Plugin 'scrooloose/nerdtree'
let g:NERDTreeWinPos = "right"
map <C-N> :NERDTreeToggle<CR>
nmap <C-J> :tabprevious<CR>
nmap <C-K> :tabnext<CR>
"au VimEnter * :NERDTreeToggle

" I close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Подсветка синтаксиса
" FIXME: Не заработал
Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" По <Leader>ig визуально выделяет уровни вложенности кода
Plugin 'nathanaelkane/vim-indent-guides.git'
let g:indent_guides_auto_colors=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#5f5f5f ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=lightgrey

" Автозапуск плагина при старте Vim
autocmd VimEnter * :IndentGuidesEnable

" vim-scripts repos

" Комментирование по //
Plugin 'tComment'
nnoremap <silent> // :TComment<CR>
vnoremap <silent> // :TComment<CR>

" Поддержка EditorConfig (единый конфиг для всех редакторов и IDE)
Plugin 'editorconfig/editorconfig-vim'

" CommandT (файловый навигатор)
Plugin 'wincent/command-t'
let g:CommandTMaxHeight = 20
let g:CommandTMaxFiles = 1000
let g:CommandTMaxDepth = 5

nnoremap <silent> <C-T> :CommandT<CR>
nnoremap <silent> <C-B> :CommandTBuffer<CR>

" TagBar для отображения структуры файлов
Plugin 'majutsushi/tagbar'
let g:tagbar_left = 1
let g:tagbar_width = 35
nmap <F7> :TagbarToggle<CR>
au BufNew *.rb :TagbarOpen

colorscheme desert
set t_Co=256

" Multiple Cursors
Plugin 'terryma/vim-multiple-cursors.git'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-g>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plugin 'slim-template/vim-slim.git'

call vundle#end()

"-------------------------------------------------------
" После этой строки не вставлять никаких Bundle/Plugin!
"-------------------------------------------------------

" Other plugins

filetype plugin indent on

" -------------------
" Vim settings
" -------------------

syntax on

" Tabstops
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" Automatically indent
set autoindent

" Set the search scan to wrap lines
set wrapscan

" Makes command line two lines high
set ch=2

" Make the 'cw' and like commands put a $ at the end instead of just deleting the text and replacing it
" set cpoptions=cesB$

" Show invisibles
set list

" Set the status line
set statusline=%<%f%h%m%r%=\ %l,%c%V
set laststatus=2

" Оставляем курсор при прокрутке экрана всегда по центру
set scrolloff=8

" Всегда показываем курсор
set ruler

" Добавляет подчёркивание текущей строки, в которой находится курсор
set cursorline

" Показывает незавершённые команды в статусной строке
set showcmd

" Не удалять буфер когда переключаемся в следующий
set hidden

" Показывает текущий режим в последней строке
set showmode

" Позволяет выделять квадратные области в визуальном режиме
" set virtualedit=all

" Make the command-line completion better
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Incrementally match the search
set incsearch

" Stop searching at the end of file
set nowrapscan

" add some line space for easy reading
set linespace=1

" Highlight 120 column
if exists('+colorcolumn')
	highlight ColorColumn ctermbg=235 guibg=#2c2d27
	highlight CursorLine ctermbg=235 guibg=#2c2d27
	highlight CursorColumn ctermbg=235 guibg=#2c2d27
	let &colorcolumn=join(range(121,999),",")
else
	autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
end

set textwidth=120

set wrap
set linebreak

" Encodings
set termencoding=utf-8
set encoding=utf8

" Подсветка искомой строки, соответствие скобок и время мигания
set hlsearch
set showmatch
set matchtime=5

set number

" Отключаем шум и звуки
set novisualbell
set noerrorbells
set vb t_vb=

" Folding
set foldenable
set foldmethod=marker
set foldlevel=100
set foldopen=block,hor,mark,percent,quickfix,tag
set foldlevel=0

" Turn off backup files and swap
set nobackup
set noswapfile

" Write swap file to disk after every 50 characters
set updatecount=50

" Ignore certain types of files on completion
set wildignore+=*.o,*.obj,*.pyc,.git

" Tab at the end of line
if has('multi_byte')
	highlight NonText guifg=#4a4a59
	highlight SpecialKey guifg=#4a4a59

	if version >= 700
		set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
	else
		set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
	endif
endif

" Symbol before wrapped line
if has("linebreak")
    let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
endif

" Set up the GVim window colors and size
if has("gui_running")
	set guifont=Monaco:h14
	if !exists("g:vimrcloaded")
		winpos 0 0
		winsize 270 90
		let g:vimrcloaded = 1
endif

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar"
endif

" Creates a session
function! MakeSession()
	let b:sessionfile = 'project.vim'
	exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
	if argc()==0
		let b:sessionfile = "project.vim"
		if (filereadable(b:sessionfile))
			exe "mksession! " . b:sessionfile
			echo "updating session"
		endif
	endif
endfunction

" Loads a session if it exists
function! LoadSession()
	if argc() == 0
		let b:sessionfile = "project.vim"
		if (filereadable(b:sessionfile))
			exe 'source ' b:sessionfile
		else
			echo "No session loaded."
		endif
	else
		let b:sessionfile = ""
		let b:sessiondir = ""
	endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call UpdateSession()

" Save cursor position when changing split
if v:version >= 700"{{{
	au BufLeave * let b:winview = winsaveview()
	au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif"}}}

" Remove whitespaces from all file
function! TrimWhitespace()
	%s/\s\+$//e
endfunction
command! TrimWhitespace call TrimWhitespace()

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Fix my <Backspace> key (in Mac OS X Terminal)
set t_kb=
fixdel

" ----------------------------------------------------------
" Mappings
" ----------------------------------------------------------

" pressing ; will go into command mode
nnoremap ; :

" Leader key
let mapleader = ","

" Disable the F1 key (which normally opens help)
" coz I hit it accidentally.
noremap <F1> <nop>

" Space for open/close folds if exist
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" use CTRL-F for omni completion
imap <C-F> 

" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>

map <F8> :set list<CR>
map <F9> :set nolist<CR>

" Rubycop gem for Ruby
let g:vimrubocop_config = '/Users/gruz0/rubocop.yml'
let g:vimrubocop_keymap = 0
nmap <C-R> :RuboCop<CR>

" Настройки табов и вызов RuboCop для Ruby-файлов
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab cinoptions=:0,p0,t0 cinwords=if,else,while,do,for,switch,case

" Открывать сплиты окон справа и снизу
set splitright
set splitbelow

autocmd Filetype gitcommit setlocal spell textwidth=72

" Snippets
"iabbrev ddate <C-r>=strftime("%F")<CR>

" Browsing by tags like a RubyMine
nnoremap <C-[> <C-]>
nnoremap <C-]> :pop<CR>
