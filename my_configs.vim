"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Function Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map                  <F2>    :NERDTreeToggle<CR>
map                  <F3>    :set number!<CR>
au FileType go map   <F4>    :GoDef<CR>
au FileType go map   <F5>    :GoCallers<CR>
au FileType go map   <F6>    :GoCallstack<CR>
map                  <F7>    :!more ~/.vim_runtime/my_func_mappings.txt<CR>
nmap                 <F8>    :TagbarToggle<CR>
au FileType go map   <F9>    :!more ~/.vim_runtime/my_snippets.txt<CR>
au FileType go map   <F10>   :!more ~/.vim_runtime/my_mappings.txt<CR>
map                  <F12>   :SCROLLCOLOR<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         Add highlighted cursor line and column 80
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
hi CursorLine cterm=None ctermbg=236 guibg=#2d2d2d
set colorcolumn=80
hi ColorColumn term=reverse ctermbg=236 guibg=#2d2d2d

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               Select Color Scheme
" Scroll through colorscheme options by hitting <F12>.
" Other nice options for colorscheme include darkZ, torte,
" ir_black, and desert.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme foursee

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 Set Map Leader Character
" This defines what is expected to be typed for the <leader>
" field in map, nmap, etc. mappings (see some mappings below).
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader =   ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"              Add some Go keyboard mappings
" Note: Type ',' in place of <leader> to use a mapping,
" since mapleader is set to ',' above.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType go nnoremap <buffer> <silent> K :GoDoc<cr>
au FileType go nmap     gd            <Plug>(go-def)
au FileType go nmap     <leader>r     <Plug>(go-run)
au FileType go nmap     <leader>b     <Plug>(go-build)
au FileType go nmap     <leader>B     :make<CR>
au FileType go nmap     <leader>t     <Plug>(go-test)
au FileType go nmap     <leader>c     <Plug>(go-coverage)
au FileType go nmap     <leader>dd    <Plug>(go-def)
au FileType go nmap     <leader>ds    <Plug>(go-def-split)
au FileType go nmap     <leader>dv    <Plug>(go-def-vertical)
au FileType go nmap     <leader>dt    <Plug>(go-def-tab)
au FileType go nmap     <leader>kk    <Plug>(go-doc)
au FileType go nmap     <leader>kv    <Plug>(go-doc-vertical)
au FileType go map      <leader>kb    <Plug>(go-doc-browser)
au FileType go nmap     <leader>im    <Plug>(go-implements)
au FileType go nmap     <leader>in    <Plug>(go-info)
au FileType go nmap     <leader>e     <Plug>(go-rename)
au FileType go nmap     <leader>P     :GoPlay<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Configure NERDTree Directory Tree Pane
" Toggle directory tree on/off via <F2>, as mapped above, or
" enter ',T' to show the current file in a directory tree.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" After you are comfortable with NERDTree, modify the following
" setting to a '1' to turn off Bookmarks label and help message.
let NERDTreeMinimalUI     = 0
" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif
" Locate file in hierarchy quickly
map <leader>T :NERDTreeFind<cr>

