"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Function Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map                  <F2>    :NERDTreeToggle<CR>
map                  <F3>    :set number!<CR>
au FileType go map   <F4>    :GoDef<CR>
au FileType go map   <F5>    :GoCallers<CR>
au FileType go map   <F6>    :GoCallstack<CR>
map                  <F7>    :echo g:FunctionKeyMapList<CR>
nmap                 <F8>    :TagbarToggle<CR>
au FileType go map   <F9>    :echo g:GoSnippetsList<CR>
au FileType go map   <F10>   :echo g:GoKeyMapList<CR>
map                  <F12>   :SCROLLCOLOR<CR>

let g:FunctionKeyMapList = "
    \         Function Key Mappings \n
    \ =================================================== \n
    \  <F2>      Directory tree window (open/close) \n
    \  <F3>      Line numbering (on/off) \n
    \  <F4>      Go to definition for a Go function, struct, etc. \n
    \  <F5>      Show callers for a Go function \n
    \ <S-F5>     Set scope (top directory) for Go callers search\n
    \  <F6>      Show callstack(s) for a Go function \n
    \  <F7>      Show this function key mapping info \n
    \  <F8>      Tag bar window (open/close) \n
    \  <F9>      Show Go snippets \n
    \  <F10>     Show Go key mappings \n
    \  <F11>     Maximize/minimize window \n
    \  <F12>     Scroll through installed Vim colorschemes \n"


let g:GoSnippetsList = "
    \      Sequence \n
    \ (Follow with <Tab>)       Snippet Inserted \n
    \ ===================   ======================== \n
    \         :             v := value \n
    \         anon          fn := func() { ... } \n
    \         ap            append(slice, value) \n
    \         ap=           a = append(a, value) \n
    \         br            break \n
    \         ch            chan Type \n
    \         case          case ...: \n
    \         con           const XXX Type = ... \n
    \         cons          const ( ... ) \n
    \         iota          const ( ... = iota ) \n
    \         cn            continue \n
    \         default       default: ... \n
    \         df            defer someFunction() \n
    \         def           defer func() { ... } \n
    \         defr          defer with recover \n
    \         gpl           GNU Public License \n
    \         import        import ( ... ) \n
    \         interface     interface I { ... } \n
    \         if            if ... { ... } \n
    \         else          else { ... } \n
    \         errn          Error return  !b \n
    \         errn,         Error return with two return values !b \n
    \         errp          Error panic !b \n
    \         errt          Error test fatal  !b \n
    \         errh          Error handle and return !b \n
    \         json          \`json:key\` \n
    \         yaml          \`yaml:key\` \n
    \         ft            fallthrough \n
    \         for           for ... { ... } \n
    \         fori          for 0..N-1 { ... } \n
    \         forr          for k, v := range items { ... } \n
    \         func          func Function(...) [error] { ... } \n
    \         ff            fmt.Printf(...) \n
    \         fn            fmt.Println(...) \n
    \         lf            log.Printf(...) \n
    \         ln            log.Println(...) \n
    \         make          make(Type, size) \n
    \         map           map[Type]Type \n
    \         main          func main() { ... } \n
    \         meth          func (self Type) Method(...) [error] { ... } \n
    \         ok            if !ok { ... } \n
    \         package       package ... \n
    \         pn            panic() \n
    \         rt            return \n
    \         select        select { case a := <-chan: ... } \n
    \         st            type T struct { ... } \n
    \         switch        switch x { ... } \n
    \         sp            fmt.Sprintf(...) \n
    \         go            go someFunc(...) \n
    \         gof           go func() { ... }() \n
    \         test          func TestXYZ(t *testing.T) { ... } \n
    \         hf            http.HandlerFunc !b \n
    \         hhf           mux.HandleFunc !b \n
    \         tsrv          httptest.NewServer \n
    \         ter           if err != nil { t.Errorf(...) } \n
    \         terf          if err != nil { t.Fatalf(...) } \n
    \         example       func ExampleXYZ() { ... } \n
    \         benchmark     func BenchmarkXYZ(b *testing.B) { ... } \n
    \         var           var x Type [= ...] \n
    \         vars          var ( ... ) \n
    \         eq            equals: test two identifiers with DeepEqual \n"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"              Add some Go keyboard mappings
" Note: Type ',' in place of <leader> to use a mapping,
" since mapleader is set to ',' above.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = ","
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

let g:GoKeyMapList = "
    \ Sequence  Function       Description \n
    \ ========  ========       =========== \n
    \    K       doc           Show documentation for item under the cursor \n
    \    gd      def           Jump to Go definition/declaration \n
    \   ,r       run           Runs 'go run' \n
    \   ,b       build         Runs 'go build', does not create result file \n
    \   ,B       make          Runs 'go build', creates result file \n
    \   ,t       test          Runs 'go test' \n
    \   ,c       coverage      Runs 'go test -coverprofile-temp.out' \n
    \   ,dd      def           Jump to definition \n
    \   ,ds      def-split     Jump to definition in a split window \n
    \   ,dv      def-vertical  Jump to definition in a vertical split window \n
    \   ,dt      def-tab       Jump to definition in a tab window \n
    \   ,kk      doc           Show documentation for item under cursor \n
    \   ,kv      doc-vertical  Show documentation in vertical split window \n
    \   ,kb      doc-browser   Show documentation in a browser \n
    \   ,im      implements    Show interfaces that a type implements \n
    \   ,in      info          Show type info for item under the cursor \n
    \   ,e       rename        Rename item at cursor (throughout package) \n
    \   ,P       GoPlay        Share to play.golang.org and open browser \n
    \   ,T       Find-in-Tree  Display current file in a directory tree \n"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add NERDTree window key for setting GoCallers and GoCallStack
" scope to directory that is selected in directory tree.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set default key for setting Go Guru Scope to <S-F5>
if !exists("g:NERDTreeGoGuruScope")
    let g:NERDTreeGoGuruScope = '<S-F5>'
endif

" Add keybindings for setting Go Guru Scope for directory nodes
" and for bookmarks.
source ~/.vim_runtime/sources_non_forked/nerdtree/plugin/NERD_tree.vim
call NERDTreeAddKeyMap({ 'key': g:NERDTreeGoGuruScope, 'scope': "DirNode", 'callback': 'SetGuruScopeDir' })
call NERDTreeAddKeyMap({ 'key': g:NERDTreeGoGuruScope, 'scope': "Bookmark", 'callback': 'SetGuruScopeBookmark' })

" Handler function for setting Go scope to a directory node's path
function! SetGuruScopeDir(dirnode)
    "let path = a:dirnode.path.str()
    if exists(':GoGuruScope')
        exec "GoGuruScope" . a:dirnode.path.str()
    endif
endfunction

" Handler function for setting Go scope to a bookmark node's path
function! SetGuruScopeBookmark(bm)
    if exists(':GoGuruScope')
        exec "GoGuruScope" . a:bm.path.str()
    endif
endfunction

