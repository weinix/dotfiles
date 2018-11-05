" Colors {{{
syntax enable           " enable syntax processing
colorscheme  xoria256 "Options: badwolf xoria256 CandyPaper Dark2 Dark Darksea
set termguicolors

" "Colorcolumn
set textwidth=80
set colorcolumn=+1
" }}}
" Misc {{{
set backspace=indent,eol,start                  "http://vim.wikia.com/wiki/Backspace_and_delete_problems
set clipboard=unnamed                           "http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4        " To change the number of space characters inserted for indentation
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline        " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " higlight matching parenthesis
let python_highlight_all = 1 " enable all Python syntax highlighting features
set fillchars+=vert:┃
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 1
" }}}
" Line Shortcuts {{{
nmap j gj
nmap k gk
nmap gV `[v`]
nnoremap <space> za   " Folding
nnoremap <F5> :MundoToggle<CR> 
autocmd FileType python nnoremap <buffer> <F6> :call Flake8()<CR>
" vim-test
" nmap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> tf :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>
nnoremap <leader>rc :Coveragepy refresh<cr>
nnoremap <leader>sc :Coveragepy show<cr>
" }}}
" " Leader Shortcuts {{{
" let mapleader=","
" nmap <leader>m :silent make\|redraw!\|cw<CR>
" nmap <leader>h :A<CR>
" nmap <leader>sv :source $MYVIMRC<CR>
nmap <leader>l :call <SID>ToggleNumber()<CR>
nmap <leader><space> :noh<CR>
" nmap <leader>s :mksession<CR>
" nmap <leader>a :Ag
" nmap <leader>c :SyntasticCheck<CR>:Errors<CR>
" nmap <leader>1 :set number!<CR>
" nmap <leader>d :GoDoc
" nmap <leader>t :TestFile<CR>
" nmap <leader>r :call <SID>RunFile()<CR>
" nmap <leader>b :call <SID>BuildFile()<CR>
" vnoremap <leader>y "+y
" " graphviz
" map <silent> <leader>lv :silent GraphvizCompile<CR>:silent GraphvizShow<CR>:redraw!<CR>
" map <leader>ll :GraphvizCompile<CR>:redraw!<CR>
" map <leader>li :GraphvizInteractive<CR>
" 
" " }}}
" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" }}}
" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
let g:syntastic_python_python_exec = 'python3'
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
    autocmd BufEnter *.go setlocal noexpandtab
    autocmd BufEnter *.avsc setlocal ft=json
augroup END
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Vim Plugin's {{{
call plug#begin('~/.vim/plugged')
Plug 'weinix/vim-colorschemes'
Plug 'bling/vim-airline' " Lean and mean status/tabline https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes'
Plug 'janko-m/vim-test'     " Wrapper for running tests on different granularities. https://github.com/janko-m/vim-test, https://adamweidner.com/posts/python-dev-env/
Plug 'Vigemus/nvimux'       " https://github.com/Vigemus/nvimux
Plug 'vimlab/split-term.vim'
Plug 'alfredodeza/coveragepy.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround
Plug 'ctrlpvim/ctrlp.vim' " Full path fuzzy file, buffer, mru, tag, ... finder for Vim. https://github.com/ctrlpvim/ctrlp.vim
" Plug 'kassio/neoterm' " https://github.com/kassio/neoterm
Plug 'bronson/vim-trailing-whitespace' "Tailing white space in red
Plug 'tmhedberg/matchit'   " enhance matching
Plug 'ervandew/supertab' " https://github.com/ervandew/supertab
Plug 'dhruvasagar/vim-zoom' " https://github.com/dhruvasagar/vim-zoom <C-W>m
Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary
Plug 'christoomey/vim-sort-motion'
Plug 'tmhedberg/SimpylFold' " https://github.com/tmhedberg/SimpylFold 


Plug 'wannesm/wmgraphviz.vim' "https://github.com/wannesm/wmgraphviz.vim <leader>ll, lv, li

" Launguage tools
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp' " Dependency of ncm2
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern'  " javascript
Plug 'ncm2/ncm2-jedi'   " Python
Plug 'ncm2/ncm2-pyclang' " C/C++
Plug 'ncm2/ncm2-vim'    " vimscript
Plug 'phpactor/ncm2-phpactor' " php
Plug 'ObserverOfTime/ncm2-jc2' " Java
Plug 'nvie/vim-flake8'

" https://github.com/moll/vim-node
Plug 'moll/vim-node' " Tools and environment to make Vim superb for developing with Node.js

Plug 'scrooloose/syntastic' " Syntax checking  https://github.com/vim-syntastic/syntastic
Plug 'simnalamburt/vim-mundo' " vim undo tree: https://simnalamburt.github.io/vim-mundo/#usage
Plug 'tpope/vim-fugitive' " Git http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
Plug 'vimwiki/vimwiki' " https://github.com/vimwiki/vimwiki

call plug#end()
" }}}
" Plugin settings {{{
" vim-test
let test#python#pytest#executable = '~/.local/bin/ptw --'
let test#python#pytest#options = '-vv --cov module_to_cover --cov-report html'
let g:test#preserve_screen = 1 " disable clear screen before exec

" airline
set laststatus=2
let g:airline_theme = 'zenburn'
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
" split_term
set splitright
set splitbelow

" vim-mudo
set undofile
set undodir=~/.vim/undo

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/'}]     "https://github.com/vimwiki/vimwiki
set nocompatible
filetype plugin on

" SimpyFold
let g:SimpylFold_docstring_preview = 1

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()     " enable ncm2 for all buffers
set completeopt=noinsert,menuone,noselect  " IMPORTANTE: :help Ncm2PopupOpen for more information

" graphviz
let g:WMGraphviz_dot = "dot"
let g:wmgraphviz_output = "png"
let g:WMGraphviz_viewer = "open"
let g:WMGraphviz_shelloptions = ""

" ctrlp
" let g:ctrlp_cmd = 'CtrlPMRU'

" nvimux
lua << EOF
local nvimux = require('nvimux')

-- Nvimux configuration
nvimux.config.set_all{
  prefix = '<C-a>',
  new_window = 'enew', -- Use 'term' if you want to open a new term for every new window
  new_tab = nil, -- Defaults to new_window. Set to 'term' if you want a new term for every new tab
  new_window_buffer = 'single',
  quickterm_direction = 'botright',
  quickterm_orientation = 'vertical',
  quickterm_scope = 't', -- Use 'g' for global quickterm
  quickterm_size = '80',
}

-- Nvimux custom bindings
nvimux.bindings.bind_all{
  {'s', ':NvimuxHorizontalSplit', {'n', 'v', 'i', 't'}},
  {'v', ':NvimuxVerticalSplit', {'n', 'v', 'i', 't'}},
}

-- Required so nvimux sets the mappings correctly
nvimux.bootstrap()
EOF

" }}}
" Custom Functions {{{
function! <SID>ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunc

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunc

function! <SID>RunFile()
    let ext = expand("%:e")
    if(ext == "go")
        :GoRun
    endif
endfunc

function! <SID>BuildFile()
    let ext = expand("%:e")
    if(ext == "go")
        :GoBuild
    endif
endfunc

" vim-test
function! TermStrategy(cmd)
    execute ":Term " . a:cmd
    call feedkeys("\<esc>\<C-A>k")
endfunction
let g:test#custom_strategies = {'term': function('TermStrategy')}
let test#strategy = 'term'
" }}}
"
" Make sure below line is the last line
" vim:foldmethod=marker:foldlevel=0
