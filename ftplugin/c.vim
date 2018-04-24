" C files specific configuration
let b:ale_linters = ['clang', 'cppcheck', 'gcc']
let g:ale_c_parse_makefile = 1
let b:ale_c_clang_options = '-std=c99 -Wall -Wextra'
let b:ale_c_gcc_options = '-std=c99 -Wall -Wextra'
