" Startup Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible                " Ditch strict vi compatibility
"set hidden
" Clear existing autocommands
autocmd!
set backspace=indent,eol,start    " More powerful backspacing

set autoindent              " always set autoindenting on
set autowrite               " Autosave before commands like :next and :make
set textwidth=0             " Don't wrap words by default
set showcmd                 " Show (partial) command in status line.
set encoding=utf-8          " This being the 21st century, I use Unicode
set fileencoding=utf-8

set showmatch               " Show matching brackets.
set ignorecase              " Case insensitive matching
set smartcase               " Case sensitive matching if caps in search string
set hlsearch                " Highlight search matches
"set incsearch              " Incremental search

set wildmenu                " Use BASH style completion
set wildmode=list:longest

set complete=.,w,b,u,t,],s{*.pm}
set nobackup                " Don't keep a backup file
set history=5000            " Keep 5000 lines of command line history
set viminfo='20,\"50        " Read/write a .viminfo file, don't store more than
                            " 50 lines of registers
set shortmess=atI           " Less interrupting prompts

" Visual stuff
set showcmd                 " Show information about ranges in the ruler
set laststatus=2
set ruler                   " Show the cursor position all the time
set title                   " Show title in title bar
set scrolloff=3             " Show some context when scrolling at edge of buffer
"set cursorline             " Highlight the current line
"
" Show tabs as ▷⋅ and trailing spaces as⋅
" http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
function ToggleListchars()
    if &listchars =~ "eol"
        set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
    else
        set listchars=tab:▷⋅,trail:⋅,nbsp:⋅,eol:$
    endif
endfunction

" Make tabs be spaces instead
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

" Python folks like two spaces :-/
"autocmd FileType python set tabstop=2|set shiftwidth=2
" CSS two space indent
autocmd FileType css setlocal tabstop=2|setlocal shiftwidth=2
" CSS two space indent
autocmd FileType javascript setlocal tabstop=4|setlocal shiftwidth=4
" make requires real tabs
autocmd FileType make set noexpandtab shiftwidth=8

" Make function keys work within screen
if !has("gui_running")
    set term=xterm-256color
endif

" Turn off the button bar in gvim
set guioptions-=T
set guioptions-=m
" No scrollbars
set guioptions-=r
set guioptions-=l
set guioptions-=R
set guioptions-=L
set guifont=monospace\ 8
set mousehide

" Syntastic settings
let g:syntastic_enable_signs=0
let g:syntastic_auto_loc_list=0

" sessionman.vim mucks up Mark
function! ForceMarkReload()
    unlet g:loaded_mark
    source ~/.vim/bundle/Mark/plugin/mark.vim
endfunction

syntax on
set background=dark
colors peachpuff-drew
"colors koehler-drew
"colors drew
"colors contrasty
"colors koehler
"colors ir_black
"colors murphy
"colors torte
"colors elflord
"colors ron

filetype plugin indent on
" Extra filetypes
autocmd BufNewFile,BufRead *.jst set filetype=javascript
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.t set filetype=perl

" For Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent
autocmd FileType perl set keywordprg=perldoc\ -f
" For C-like programming, cindent is the way to go
autocmd FileType c,cpp,slang set cindent
" Keep comments indented
inoremap # #
" Check for file changes (svn ci, etc.) periodically and on window & buffer
" switches
autocmd CursorHold * checktime
autocmd WinEnter * checktime
autocmd BufWinEnter * checktime

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
"http://structurallysoundtreehouse.com/my-almost-perfect-vim-files
"http://github.com/fredlee/mydotfiles/tree/master
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c' && &filetype !~ 'svn\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
     exe "normal g`\""
    endif
  end
endfunction

" Omni Completion
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Auto destroy Fugitive buffers
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete

" Setup folding, but don't enable it
set foldmethod=indent
set nofoldenable
function ToggleFolding()
    if &foldenable
        set nofoldenable
    else
        set foldenable
    endif
endfunction

" Toggleable paste mode
let paste_mode = 0
function TogglePaste()
    if g:paste_mode == 0
        set paste
        let g:paste_mode = 1
    else
        set nopaste
        let g:paste_mode = 0
    endif
    return
endfunction

let writing_mode = 0
function ToggleWriting()
    if g:writing_mode == 0
        set formatoptions+=a
        set tw=120
        let g:writing_mode = 1
    else
        set formatoptions-=a
        set tw=0
        let g:writing_mode = 0
    endif
    return
endfunction

" Highlight lines over 80 characters long
hi LineTooLong cterm=bold ctermbg=darkgreen gui=bold guibg=darkgreen
let hl80char = 0
function Toggle80CharacterHighlight()
    if g:hl80char == 0
        match LineTooLong /\%>80v.\+/
        let g:hl80char = 1
    else
        match
        let g:hl80char = 0
    endif
    return
endfunction

function ToggleProseMode()
    if g:proseMode == 0
        set textwidth=80
        set spelllang=en
        set spell
        let g:proseMode = 1
    else
        match
        let g:proseMode = 0
    endif
    return
endfunction

command! -nargs=* Only call CloseUnloadedBuffers()
function! CloseUnloadedBuffers()
    let lastBuffer = bufnr('$')

    let currentBuffer = 1
    while currentBuffer <= lastBuffer
        " If buffer exists, is shown in :ls output, and isn't loaded
        if bufexists(currentBuffer) && buflisted(currentBuffer) && bufloaded(currentBuffer) == 0
            execute 'bdelete' currentBuffer
        endif

        let currentBuffer = currentBuffer + 1
    endwhile
endfunction

""" Correct misspellings
"abbreviate foo foobar

source $HOME/.vim/statusline.vim
source $HOME/.vim/mappings.vim
