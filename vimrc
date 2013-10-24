" Required by Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bufkill.vim'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/neocomplete.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'Townk/vim-autoclose.git'
Bundle 'chriskempson/base16-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'sheerun/vim-polyglot'

filetype plugin indent on " Required by Vundle

" don't beep for errors
  set visualbell

" Wildmenu
  set wildmenu
  set wildmode=longest,full

" Search
  set ignorecase " Case insensitive search
  set incsearch  " Makes search act like search in modern browsers
  set hlsearch   " Highlight search results

" Whitespace
  set list                      " Show invisibles by default
  set listchars=tab:▸\ ,trail:· " Show tabs, trailing whitespace and end of lines
  set nowrap                    " Do not wrap lines
  set expandtab                 " Use spaces instead of tabs
  set smarttab                  " Be smart when using tabs ;-)
  set softtabstop=2             " 1 tab is 2 spaces
  set shiftwidth=2
  set tabstop=2
  set foldmethod=indent         " Fold based on indentation.
  set foldlevelstart=99         " Expand all folds by default.

" Disable backup. No swap files.
  set nobackup
  set nowb
  set noswapfile

" Window
  syntax enable       " Syntax highlighting
  set hidden          " Allow hiding buffers with unsaved changes
  set number          " Show line numbers
  set ruler           " Show cursor position
  set spelllang=en_au " Australian English

" make backspace work in insert mode
  set backspace=indent,eol,start "

" pick up external file modifications
  set autoread

" Persistent undo
  set undofile                " Save undo's after file closes
  set undodir=$HOME/.vim/undo " Where to save histories
  set undolevels=1000         " How many undos
  set undoreload=10000        " Number of lines to save

" HTML indent
  let g:html_indent_tags = 'li'

" NetRW
  let g:netrw_list_hide= '^\..*$' " Hide dotfiles
  let g:netrw_banner=0            " Disable banner
  let g:netrw_liststyle=3         " Tree

" Color
  color smyck

" CtrlP
  let g:ctrlp_working_path_mode = 0 " Don't manage. Plays nicely with `bundle open <name>`
  let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$\|node_modules$\|logs$\|tmp$\|source_maps$\|vendor/gems$',
    \ 'file': '',
    \ 'link': '',
    \ }
  let g:ctrlp_buffer_func = { 'enter': 'CtrlPEnter' }                   " Kill buffers in CtrlP with <C-@>
  func! CtrlPEnter()                                                    " https://github.com/kien/ctrlp.vim/issues/280
    nnoremap <buffer> <silent> <C-@> :call <sid>CtrlPDeleteBuffer()<CR>
  endfunc
  func! s:CtrlPDeleteBuffer()
    exec "bd" fnamemodify(getline('.')[2:], ':p')
    exec "norm \<F5>"
  endfunc

" AutoClose
  let g:AutoCloseExpandEnterOn="{"

" Neocomplet
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Nerdtree
  let NERDTreeHijackNetrw = 1
  nmap gt :NERDTreeToggle<CR>

" FUNCTIONS
  " Strip trailing whitespace
  function! <SID>StripTrailingWhitespaces()
      " Preparation: save last search, and cursor position.
      let _s=@/
      let l = line(".")
      let c = col(".")
      " Do the business:
      %s/\s\+$//e
      " Clean up: restore previous search history, and cursor position
      let @/=_s
      call cursor(l, c)
  endfunction
  command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()

" KEYMAPS
  " get out of insert mode with cmd-i
  imap <D-i> <Esc>
  " clean up trailing whitespace
  map <Leader>c :StripTrailingWhitespaces<cr>
  " mapping the jumping between splits. Hold control while using vim nav.
  nmap <C-J> <C-W>j
  nmap <C-K> <C-W>k
  nmap <C-H> <C-W>h
  nmap <C-L> <C-W>l

  nnoremap <ESC> :noh<CR><ESC>|"                    Clear highlights
  nmap <LEADER>l :set list!<CR>|"                   Toggle list characters (Invisibles)
  map <LEADER>s :set spell!<CR>|"                   Toggle spell
  map <LEADER>f :Ack!<Space>|"                      Search
  map <C-B> :CtrlPBuffer<CR>|"                      CtrlP in buffer mode
