" vim plug
  " installation:
  " curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  "     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


  call plug#begin('~/.vim/plugged')

    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'bufkill.vim'
    Plug 'vim-scripts/ZoomWin'
    Plug 'rking/ag.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-surround'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    Plug 'tmhedberg/matchit'
    Plug 'Raimondi/delimitMate'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'scrooloose/syntastic'
    Plug 'sheerun/vim-polyglot'
    Plug 'marijnh/tern_for_vim', { 'do': './npm i'}

    if has('nvim')
      Plug 'kassio/neoterm'
    endif

    if !has('nvim')
      Plug 'kien/ctrlp.vim'
    endif

    Plug 'junegunn/seoul256.vim'

    Plug 'junegunn/rainbow_parentheses.vim'

    Plug 'junegunn/vim-emoji'

    Plug 'heavenshell/vim-jsdoc'

    Plug 'christoomey/vim-tmux-navigator'

    " Plug 'bling/vim-airline'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Colors
    Plug 'chriskempson/base16-vim'

    Plug 'editorconfig/editorconfig-vim'

    " Multiple Cursors
    Plug 'terryma/vim-multiple-cursors'

    " Snippets
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'


  call plug#end()

let mapleader      = "\<Space>"
let localmapleader = "\<Space>"

" statusline
  " %< Where to truncate
  " %n buffer number
  " %F Full path
  " %m Modified flag: [+], [-]
  " %r Readonly flag: [RO]
  " %y Type:          [vim]
  " fugitive#statusline()
  " %= Separator
  " %-14.(...)
  " %l Line
  " %c Column
  " %V Virtual column
  " %P Percentage
  " %#HighlightGroup#
  set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P
  silent! if emoji#available()
    let s:ft_emoji = map({
      \ 'c':          'baby_chick',
      \ 'clojure':    'lollipop',
      \ 'coffee':     'coffee',
      \ 'cpp':        'chicken',
      \ 'css':        'art',
      \ 'eruby':      'ring',
      \ 'gitcommit':  'soon',
      \ 'haml':       'hammer',
      \ 'help':       'angel',
      \ 'html':       'herb',
      \ 'java':       'older_man',
      \ 'javascript': 'fist',
      \ 'make':       'seedling',
      \ 'markdown':   'book',
      \ 'perl':       'camel',
      \ 'python':     'snake',
      \ 'ruby':       'gem',
      \ 'scala':      'barber',
      \ 'sh':         'shell',
      \ 'slim':       'dancer',
      \ 'text':       'books',
      \ 'vim':        'poop',
      \ 'vim-plug':   'electric_plug',
      \ 'yaml':       'yum',
      \ 'yaml.jinja': 'yum'
    \ }, 'emoji#for(v:val)')

    function! S_filetype()
      if empty(&filetype)
        return emoji#for('grey_question')
      else
        return get(s:ft_emoji, &filetype, '['.&filetype.']')
      endif
    endfunction

    function! S_modified()
      if &modified
        return emoji#for('kiss').' '
      elseif !&modifiable
        return emoji#for('construction').' '
      else
        return ''
      endif
    endfunction

    function! S_fugitive()
      if !exists('g:loaded_fugitive')
        return ''
      endif
      let head = fugitive#head()
      if empty(head)
        return ''
      else
        return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
      endif
    endfunction

    let s:braille = split('"⠉⠒⠤⣀', '\zs')
    function! Braille()
      let len = len(s:braille)
      let [cur, max] = [line('.'), line('$')]
      let pos  = min([len * (cur - 1) / max([1, max - 1]), len - 1])
      return s:braille[pos]
    endfunction

    hi def link User1 TablineFill
    let s:start = emoji#for('rocket')
    let s:end = emoji#for('rocket')
    function! MyStatusLine()
      let mod = '%{S_modified()}'
      let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
      let ft  = '%{S_filetype()}'
      let fug = ' %{S_fugitive()}'
      let sep = ' %= '
      let pos = ' %l,%c%V '
      let pct = ' %P '

      return s:start.' [%n] %F %<'.mod.ro.ft.fug.sep.pos.'%{Braille()}%*'.pct.s:end
    endfunction

    " Note that the "%!" expression is evaluated in the context of the
    " current window and buffer, while %{} items are evaluated in the
    " context of the window that the statusline belongs to.
    set statusline=%!MyStatusLine()
  endif


" Do not display tilde
  hi NonText ctermfg=black guifg=bg

" Speed things up
  set lazyredraw

" YCM
  " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

  " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" syntastic
  let g:syntastic_javascript_checkers=['eslint']

" easy align
  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

" for airline
  " set laststatus=2
  " let g:airline_powerline_fonts=1
  " set guifont=Inconsolata\ for\ Powerline:h15
  " set encoding=utf-8
  "
  set t_Co=256
  set fillchars+=vert:\|
  set termencoding=utf-8
  hi vertsplit guifg=fg guibg=bg

  "
  " filetype plugin indent on
  "
  if !has('nvim')
    set term=xterm-256color
  endif

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

" CtrlP
  if !has('nvim')
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
  endif

" AutoClose
  let g:AutoCloseExpandEnterOn="{"

" Css Comb
  autocmd FileType css,scss nmap cc :CSScomb<CR>

" Nerdtree
  let NERDTreeHijackNetrw = 1
  nmap gt :NERDTreeToggle<CR>

" Snippets
  let g:UltiSnipsExpandTrigger="<S-tab>"
  let g:UltiSnipsListSnippets="<c-l>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/dotfiles/vimsnippets']

" Gitgutter
  silent! if emoji#available()
    let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
    let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
    let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
    let g:gitgutter_sign_modified_removed = emoji#for('collision')
  endif

" Rainbows
  let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
  " List of colors that you do not want. ANSI code or #RRGGBB
  let g:rainbow#blacklist = [233, 234]


" fzf
  if has('nvim')
      let $FZF_DEFAULT_OPTS .= ' --inline-info'
  endif

  nnoremap <silent> <C-P> :Files<CR>
  nnoremap <silent> <Leader>C :Colors<CR>
  nnoremap <silent> <C-B> :Buffers<CR>
  nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>

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

  if !has('nvim')
    map <C-B> :CtrlPBuffer<CR>|"                      CtrlP in buffer mode
    map <C-T> :CtrlPTag<CR>|"
  end

" FILETYPES
  au FileType javascript setl sw=4 sts=4 et

" Move visual block
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv

" Ctags
  set tags=tags,./tags

" 80 chars/line
  set textwidth=0
  if exists('&colorcolumn')
    set colorcolumn=80
  endif

" Colors
  if has('gui_running')
    set guifont=Monaco:h14 columns=80 lines=40
    silent! color seoul256-light
  else
    silent! color base16-flat
  endif

  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
