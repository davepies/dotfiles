" GUI
if has("gui_running")
  colorscheme base16-eighties
  set background=dark
  set guifont=Monaco:h14
  set guioptions=-t " Hide toolbar
  set guioptions=+c " Disable dialogues
endif

" MacVim
if has("gui_macvim")
  autocmd FocusLost * nested :silent! wall " Save all buffers when focus is lost
  macmenu &File.New\ Tab key=<nop>|"         Disable ⌘+t
endif
