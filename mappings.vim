" Global leader key for shortcuts
let mapleader='\'

" Tab and shift-tab loop through the completion possibilities
"inoremap <S-tab> <c-r>=InsertTabWrapper ("backward")<cr>
"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
let g:SuperTabMappingForward = '<c-n>'
let g:SuperTabMappingBackward = '<s-c-n>'
" Project plugin options
let g:proj_flags = 'gcsi'
let g:proj_window_width=30

" Suppress the no-ruby warning from Lusty Explorer
let g:LustyJugglerSuppressRubyWarning = 1

" -------------
" Function keys
" -------------

" Toggle search highlighting
map <silent> <F1> :call ToggleListchars()<CR>
" ToggleCommentify in both normal & insert mod
nmap <F2> <leader>c<space>j
imap <F2> <ESC><leader>c<space>ji
" Toggle line numbers
nmap <silent> <F3> :set invnumber<CR>

" NERDTree
map <F8> :NERDTreeToggle<CR>
" Toggle highlighting lines over 80 characters
map <F9> :call Toggle80CharacterHighlight()<CR>
" Quick quit all
map <F10> :qa
" Syntax check PHP
map <F11> :w !php -l<CR>
" CTags

" ----------
" Other keys
" ----------

" Use jj to exit insert mode
imap jj <Esc>

" Switch amongst splits
map , <C-w><C-w>

" backtick goes to the exact mark location, single-quote just the line; swap 'em
nnoremap ' `
nnoremap ` '

" Use CamelCaseWords motion instead of vim's defaults
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$

" After opening multiple files, < and > will browse through them all
"map < :bn<CR>
"map > :bp<CR>

" Use Mark.vim via ctrl+m
nmap  \m

" Move around windows with ctrl key!
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Switch tabs easily
nmap <Tab> gt
nmap <S-Tab> gT

" CTags
nmap <leader>t 
nmap <leader>p :pop<CR>
" Open definition in new vsplit, hsplit, or tab
"map <leader>v :vsp <CR>:exec("tag ".expand("<cword"))<CR>
"map <leader>h :split <CR>:exec("tag ".expand("<cword"))<CR>
"map <leader>t :tab split<CR>:exec("tag ".expand("<cword"))<CR>

" FuzzyFinder
nmap <leader>f :FufFile<CR>
nmap <leader>d :FufDir<CR>
nmap <leader>T :FufTag<CR>

" PDV (phpDocumentor for Vim)
" http://www.vim.org/scripts/script.php?script_id=1355
"inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
"nnoremap <C-P> :call PhpDocSingle()<CR>

" Make new tabs easily
nnoremap <C-t>t :tabnew<CR>

" Switch tabs quickly
function! OpenTab(tabNumber)
    execute ":tabn " . a:tabNumber
endfunction

command! -nargs=1 Tabnum :call OpenTab("<args>")
nnoremap <C-t>1 :Tabnum 1<CR>
nnoremap <C-t>2 :Tabnum 2<CR>
nnoremap <C-t>3 :Tabnum 3<CR>
nnoremap <C-t>4 :Tabnum 4<CR>
nnoremap <C-t>5 :Tabnum 5<CR>
nnoremap <C-t>6 :Tabnum 6<CR>
nnoremap <C-t>7 :Tabnum 7<CR>
nnoremap <C-t>8 :Tabnum 8<CR>
nnoremap <C-t>9 :Tabnum 9<CR>

" Use Find to open things in new tabs & splits
nnoremap <C-o>o :Find
nnoremap <C-o>t :TabFind
nnoremap <C-o>v :VSplitFind
nnoremap <C-o>s :SplitFind
