"""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8          " The encoding displayed
scriptencoding uft-8
set fileencoding=utf-8      " The encoding written to file
syntax on                   " Enable syntax highlight
set ttyfast                 " Faster redrawing
set lazyredraw              " Only redraw when necessary
set cursorline              " Find the current line quickly.



"""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins List
"""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'unblevable/quick-scope'
Plug 'tmhedberg/SimpylFold'
Plug 'Shougo/neocomplete.vim'
Plug 'prettier/vim-prettier', {'do': 'npm install', 'for': ['javascript', 'typescript', 'less', 'scss'] }
Plug 'christoomey/vim-tmux-navigator'
" neomake
Plug 'neomake/neomake'
" JavaScript Highlight & Improved Indentation
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" Async FuzzyFind
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" .editorconfig
Plug 'editorconfig/editorconfig-vim'
" emmet
Plug 'mattn/emmet-vim'
" semantic-based completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" linting engine
Plug 'w0rp/ale'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Related Configs
"""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" Neomake async hooks
call neomake#configure#automake('w')

" disable auto_triggering ycm suggestions pane and instead
" use semantic completion only on Ctrl+n
let ycm_trigger_key = '<C-n>'
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = ycm_trigger_key

" this is some arcane magic to allow cycling through the YCM options
" with the same key that opened it.
" See http://vim.wikia.com/wiki/Improve_completion_popup_menu for more info.
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
inoremap <expr> ycm_trigger_key pumvisible() ? "<C-j>" : ycm_trigger_key;

" show autocomplete suggestions only when typing more than 2 characters
let g:ycm_min_num_of_chars_for_completion = 2

" show at most 20 completion candidates at a time (more than this would be
" ridiculous, you'd press TAB so many times it would be better to simply type
" the entire thing lol)
" this applies only to the semantic-based engine
let g:ycm_max_num_candidates = 20

" this is the same as above, but only for the identifier-based engine
let g:ycm_max_num_identifier_candidates = 10

" blacklist of filetypes in which autocomplete should be disabled
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'qf': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'mail': 1
      \}

" blacklist of filepaths in which autocomplete should be disabled
let g:ycm_filepath_blacklist = {
      \ 'html': 1,
      \ 'jsx': 1,
      \ 'xml': 1,
      \}

" fix files on save
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" make FZF respect gitignore if `ag` is installed
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif


"""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Related Configs
"""""""""""""""""""""""""""""""""""""""""""""""

" 256 colors
set t_Co=256

" set colorscheme
colorscheme solarized
set background=light

" long lines as just one line (have to scroll horizontally)
set nowrap

" line numbers
set relativenumber
set number

" toggle invisible characters
set invlist
set list
set listchars=tab:¦\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" disable scrollbars (real hackers don't use scrollbars)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L


"""""""""""""""""""""""""""""""""""""""""""""""
" => Keymappings
"""""""""""""""""""""""""""""""""""""""""""""""

" dont use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just dont
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" copy and paste to/from vIM and the clipboard
nnoremap <C-y> +y
vnoremap <C-y> +y
nnoremap <C-p> +P
vnoremap <C-p> +P

" access system clipboard
set clipboard=unnamed

" swapfiles location
set backupdir=/tmp//
set directory=/tmp//

" map fzf to ctrl+p
nnoremap <C-P> :Files<CR>

" YouCompleteMeMappings
nnoremap ,dl    :YcmCompleter GoToDeclaration<CR>
nnoremap ,df    :YcmCompleter GoToDefinition<CR>
nnoremap ,#     :YcmCompleter GoToReferences<CR>



"""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Smart indent
" Automatically inserts one extra level of indentation in some cases, and works for C-like files
set si



"""""""""""""""""""""""""""""""""""""""""""""""
" => Utils (a.k.a. mess I can't categorize)
"""""""""""""""""""""""""""""""""""""""""""""""

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""
"misc
""""""""""""""""""""""""""""
" Makes CTRL+jkhl move to the next split in that direction
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
inoremap <C-k> <ESC><C-w>k
inoremap <C-j> <ESC><C-w>j
inoremap <C-h> <ESC><C-w>h
inoremap <C-l> <ESC><C-w>l

" Makes backslash-movement resize the current split in that direction
nnoremap <leader>j :resize +5<CR>
nnoremap <leader>k :resize -5<CR>
nnoremap <leader>h :vertical resize -5<CR>
nnoremap <leader>l :vertical resize +5<CR>

" By having both of these binds, you can press j and k simultaneously to exit
" insert mode
inoremap jk <ESC>
inoremap kj <ESC>

" Open/close folds with spacebar
nnoremap <space> za

" sudo write hack, for when you forget to sudo vim the file
cmap w!! w !sudo tee > /dev/null %
