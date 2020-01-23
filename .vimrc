" Forget being compatible with good ol' vi
set nocompatible
filetype off
if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
    set rtp+=~/.config/nvim/bundle/Vundle.vim
else
    let s:editor_root=expand("~/.vim")
    set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" plugins
Plugin 'itchyny/lightline.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/a.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'moll/vim-node'
Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'vim-scripts/taglist.vim'

" Golang
Plugin 'fatih/vim-go'
" Python PEP8
Plugin 'nvie/vim-flake8'

Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Valloric/YouCompleteMe'
" Code Folding
Plugin 'tmhedberg/SimpylFold'
" see the docstrings for folded code
let g:SimpylFold_docstring_preview=0

" colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'sjl/badwolf'
Plugin 'sainnhe/vim-color-forest-night'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on
" set omnicompletion on (Use you complete me instead)
" set ofu=syntaxcomplete#Complete
" Why is this not a default
set hidden
" Don't update the display while executing macros
set lazyredraw
" At least let yourself know what mode you're in
set showmode
" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu
" Settings for tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
aug python
  au FileType python setlocal ts=2 sts=2 sw=2 expandtab
aug end
" Set the search scan to wrap around the file
set wrapscan
" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase
" set visual bell -- I hate that damned beeping
set vb
" Allow backspacing over indent, eol, and the start of an insert
set backspace=2
" Set the status line the way I like it
" set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2
" Hide the mouse pointer while typing
set mousehide
" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
set guioptions=ac
" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
set timeoutlen=500
" Keep some stuff in the history
set history=100
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8
" For how *I* code these are the best types of settings for
" completion but I get rid of some neat things that you might
" like
set complete=.,w,b,t
" Incrementally match the search.  I orignally hated this
" but someone forced me to live with it for a while and told
" me that I would grow to love it after getting used to it...
" turns out he was right :)
set incsearch
" show line numbers
set number
" turn on
set hlsearch
" use ant to build
"set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set makeprg=make
" remap esc key to jj to exit insert mode
inoremap jj <ESC>
" Toggle paste mode
nmap <silent> ,pp :set invpaste<CR>:set paste?<CR>
" Toggle word wrap
nmap <silent> ,tw :set nowrap! <CR>
" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>
" Maps to make handling windows a bit easier
noremap <silent> <C-h> :wincmd h<CR>
noremap <silent> <C-j> :wincmd j<CR>
noremap <silent> <C-k> :wincmd k<CR>
noremap <silent> <C-l> :wincmd l<CR>
noremap <silent> ,sb :wincmd p<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>
" Make mappings
nmap <silent> ,mi :make install<CR>
nmap <silent> ,mr :make<CR>
nmap <silent> ,mc :make check<CR>
" Toggle on/off highlight search
nnoremap <silent> ,/ :set invhlsearch<CR>:set hlsearch?<CR>
nmap <silent> ,pa :make check<CR>
" System default for mappings is now the "," character
let mapleader = ","
" set the colorscheme
syntax enable
colorscheme gruvbox 
set background=dark
let g:lightline = {'colorscheme' : 'gruvbox'}
" Workaround to stop make/quickfix from creating a new file
" set errorformat^=%-GIn\ file\ included\ %.%# 
" Fix for C++11 lambdas
let c_no_curly_error=1

"-----------------------------------------------------------------------------
" YCM Settings
"-----------------------------------------------------------------------------
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_whitelist = { 'cpp' : 1, 'py' : 1, 'go' : 1, 'h': 1 }
let g:ycm_server_python_interpreter = '/usr/bin/python3'
"" turn on completion in comments
let g:ycm_complete_in_comments=1
"" load ycm conf by default
let g:ycm_confirm_extra_conf=0
"" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
"" only show completion as a list instead of a sub-window
set completeopt-=preview
"" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=1
"" don't cache completion items
let g:ycm_cache_omnifunc=0
"" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1
nmap <silent> ,gf :YcmCompleter GoToDeclaration<CR>
nmap <silent> ,gc :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-]> :YcmCompleter GoToDeclaration<CR>
nnoremap <C-[> :YcmCompleter GoToDefinition<CR>
"-----------------------------------------------------------------------------
" Unite Settings
"-----------------------------------------------------------------------------
" Like ctrlp.vim settings.
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
let g:unite_source_grep_max_candidates = 100
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_default_opts = '-I --line-numbers --hidden'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent> <Leader>mm :Unite -buffer-name=recent file_mru<cr>
nnoremap <silent> <Leader>bb :Unite -buffer-name=buffers buffer<cr>
nnoremap <silent> <Leader>gw :Unite -no-quit -buffer-name=grep1 grep:%:-i:<C-r><C-w><CR>
nnoremap <silent> <Leader>gW :Unite -no-quit -buffer-name=grep2 grep:.:-iR:<C-r><C-w><CR>
nnoremap <silent> <Leader>pa :Unite file_rec:~/src/ems/<CR>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-c>   <Plug>(unite_exit)
  nmap <buffer> <C-c>   <Plug>(unite_exit)
endfunction
"-----------------------------------------------------------------------------
" ctrlp Settings
"-----------------------------------------------------------------------------
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.deps/*,*.o,*.so*,*.vcproj,*.d,*.swp
" Search by filename not full path as default
let g:ctrlp_by_filename = 1
" Don't manage working directory
let g:ctrlp_working_path_mode = 0
"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>
" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.CUTLERGROUP', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$', '\.o$', '\.vcproj$', '\.so$', '\.so.1$', '\.so.1.0$']
"-----------------------------------------------------------------------------
" Python Configurations
"-----------------------------------------------------------------------------
" Autoindent
au BufNewFile,BufRead *.py
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |
  \ set textwidth=129 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix

" Flag Whitespace
:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" YCM DEBUG INFO
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

" Golang Linting
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

" Javascript Linting/Formatting
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufWritePre *.js :normal gggqG
