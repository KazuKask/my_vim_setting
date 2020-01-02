" inoremap <silent><expr> <C-Space>
inoremap <silent><expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

call deoplete#custom#buffer_option('auto_complete', v:false)
"call deoplete#custom#buffer_option('auto_complete', v:true)
"call deoplete#custom#buffer_option('auto_complete', v:false)
call deoplete#custom#buffer_option('manual_complete', v:true)
"autocmd FileType python call deoplete#custom#buffer_option('auto_complete', v:false)
"
"inoremap <expr> <Tab> deoplete#manual_complete()

let g:deoplete#enable_yarp = 0
let g:deoplete#auto_complete =0
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete= 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 100
"let g:deoplete#omni_patterns = {}
let g:deoplete#sources#jedi#statement_length=100
let g:deoplete#sources#jedi#enable_typeinfo=0
let g:deoplete#sources#jedi#show_docstring = 0
let g:deoplete#sources#jedi#server_timeout=200
"let g:deoplete#sources#jedi#extra_path
"let g:deoplete#sources#jedi#ignore_errors  

"autocmd FileType python setlocal completeopt-=preview
