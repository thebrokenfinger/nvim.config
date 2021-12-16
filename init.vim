" ---------------------------------- Plugins (VimPlug) -----------------------
call plug#begin()
" Tools
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
  Plug 'airblade/vim-gitgutter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/goyo.vim'
  Plug 'vifm/vifm.vim'
  Plug 'rust-lang/rust.vim'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Syntax
  Plug 'tpope/vim-markdown'
  Plug 'ap/vim-css-color'
" Color-schemes
  Plug 'dracula/vim', { 'name': 'dracula' }
  Plug 'morhetz/gruvbox'
  Plug 'rakr/vim-one'
call plug#end()

" ---------------------------------- General Settings ------------------------
set encoding=UTF-8
filetype plugin indent on "Enable plugin and indent
syntax on
set autoread
set wildmenu
set number
set spelllang=en_us
set spell
set backspace=indent,eol,start "Making sure backspace works
set noruler "Setting up rulers and spacing, tabs
set confirm
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set hls is "Highlight words as we type them 
set ic
set laststatus=2 "Setting the size for command area, and airline status bar
set cmdheight=1
set noemoji
set showcmd "Show (partial) command in status line
set mouse=a "Enable mouse usage (all modes) in terminal
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffi
set shortmess+=c " don't give |ins-completion-menu| messages.
set termguicolors

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•
set cursorline
set background=dark
colorscheme one

" settings only for neovim
if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:block-Cursor/rCursor-blinkon1,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

" ----------------------------------------- Key maps -------------------------------
map <SPACE> :EditVifm .<CR>
map <ENTER> :Goyo<CR>
map <C-l> :set background=light<CR>
map <C-d> :set background=dark<CR>
map <C-s> :source ~/.config/nvim/init.vim<CR>

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" --------------------------------------- Variable setup ----------------------------
" rust config
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" go config
" Golang
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_bin_path = expand("~/dev/go/bin")

" other global config
let g:airline_theme='dark'
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-css', 'coc-emmet', 'coc-html', 'coc-graphql', 'coc-prettier', 'coc-tsserver', 'coc-rust-analyzer', 'coc-toml', 'coc-yaml', 'coc-tailwindcss', 'coc-eslint']
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Function to setup command alias
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Alias for config commands
call SetupCommandAbbrs('cc', 'CocConfig')
call SetupCommandAbbrs('vc', 'e ~/.config/nvim/init.vim')
" Shortcuts for Rust projects
call SetupCommandAbbrs('cr', '! cargo run')

