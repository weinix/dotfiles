set go-=T
set bg=dark
if has("gui_running")
    "set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
endif

if &background == "dark"
    hi normal guibg=black
endif
set guifont=Inconsolata:h18
colorscheme mac_classic
if exists('*HexHighlight()')
  " http://www.vim.org/scripts/script.php?script_id=2937
  nmap <leader>h :call HexHighlight()<Return>
endif

" Do not use modal alert dialogs! (Prefer Vim style prompt.)
" http://stackoverflow.com/questions/4193654/using-vim-warning-style-in-gvim
set guioptions+=c
