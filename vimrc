" set the runtime path to include Vundle and initialize
if has("win32") || has("win16")
    set rtp+=C:\Users\Eero\.vim\bundle\Vundle.vim\
    call vundle#begin('C:\Users/Eero/.vim/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin('~/.vim/bundle/')
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'rdnetto/YCM-Generator'
Plugin 'lrvick/Conque-Shell'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-scripts/L9'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'tpope/vim-commentary'
Plugin 'itchyny/lightline.vim'
"javascriptii
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mtscout6/syntastic-local-eslint.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required


"""""""""""""""""""""""""""
" !!! END OF VUNDLE !!!!!
"""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Eclim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
if has("win32") || has("win16")
    set directory=C:\Local\Temp\vim
    set backupdir=C:\Local\Temp\vim
else
    set directory=~/.vim/backup
    set backupdir=~/.vim/backup
endif
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface     (gui lightline)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                 
if has("gui_running")
  set guioptions-=T "toolbar
  set guioptions-=m "menu bar
endif

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
set lines=53 columns=135
filetype plugin indent on    " required
filetype plugin on
set nocompatible              " be iMproved, required
set hlsearch incsearch
set lazyredraw
set magic
set showmatch
"No need to show 'INSERT' with lightline
set noshowmode

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
syntax on

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
  colorscheme onedark
  " colorscheme default
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h13:cANSI
  endif
else 
    colorscheme torte
    set t_Co=256
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                 
" => Keyboard shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                 
if has("win32") || has("win16")
    nmap <leader>v :e C:\Users/Eero/vimfiles/vimrc<CR>
else 
    nmap <leader>v :e $HOME/.vimrc<CR>
endif

"highlight toggle 
let hlstate=0
nnoremap <leader>h :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"Kääntäjä (currently in after/ftplugin/)
" map <F6> :w <CR> :!g++ -O2 -std=c++11 % -o %< && %< <CR>

"normaali backspace
set backspace=indent,eol,start

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"AutpairsShortCutToggle conflicts with yankstack plugin 
let g:AutoPairsShortcutToggle = '<M-a>'
let g:AutoPairsMultilineClose = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text and tab related               (text, tabs)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 
map <C-left> <Esc>:tabprev<CR>
map <C-right> <Esc>:tabnext<CR>
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


"Linebreaker on 500 characters
set lbr
set tw=500
set wrap

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set fileencoding=utf-8

if has("win32") || has("win16")
    set ffs=dos,unix
else
    set ffs=unix,dos,mac
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indents
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"pdf
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'CWD', 'lineandcolumn'] ],
      \   'right': [ [ 'percent' ],
      \              [ 'fileformat' ], 
      \              ['fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'CWD': 'CWD: %r%{getcwd()}%h',
      \   'lineandcolumn': 'Line: %l  Column: %c'
      \ },
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,jsx EmmetInstall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                 
" => YCM aka youcompleteme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                 
if has("win32") || has("win16")
    let g:ycm_global_ycm_extra_conf = 'C:\Users\Eero\Vim\ycm\.ycm_extra_conf.py'
else
    let g:ycm_global_ycm_extra_conf = '~/.vim/ycm/.ycm_extra_conf.py'
endif
let g:ycm_extra_conf_vim_data = [ '&filetype' ]
let g:ycm_confirm_extra_conf = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
