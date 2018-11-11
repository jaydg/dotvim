" This requires dscanner - build and install with:
"
" dub fetch dscanner
" dub build --build=release --compiler=ldc2 dscanner
" - and copy the resulting binary from
"   ~/.dub/packages/dscanner-n.n/dscanner/bin to /usr/local/bin
let g:tagbar_type_d = {
            \ 'ctagstype' : 'd',
            \ 'kinds'     : [
            \ 'c:classes:1:1',
            \ 'f:functions:1:1',
            \ 'T:template:1:1',
            \ 'g:enums:1:1',
            \ 'e:enumerators:0:0',
            \ 'u:unions:1:1',
            \ 's:structs:1:1',
            \ 'v:variables:1:0',
            \ 'i:interfaces:1:1',
            \ 'm:members',
            \ 'a:alias'
            \ ],
            \'sro': '.',
            \ 'kind2scope' : {
            \ 'c' : 'class',
            \ 'g' : 'enum',
            \ 's' : 'struct',
            \ 'u' : 'union',
            \ 'T' : 'template'
            \},
            \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u',
            \ 'template'  : 'T'
            \ },
            \ 'ctagsbin' : 'dscanner',
            \ 'ctagsargs' : ['--ctags']
            \ }

