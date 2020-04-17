" --------------Denite keybind-------------
nnoremap df :Denite file<CR>
nnoremap db :Denite buffer<CR>
nnoremap dfi :Denite -input= file<Left><Left><Left><Left><Left>
nnoremap dr :Denite file/rec<CR>
nnoremap dri :Denite -input= file/rec<Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap dm :Denite file_mru<CR>
nnoremap dy :Denite neoyank<CR>
nnoremap do :Denite file/old<CR>
nnoremap dg :Denite grep<CR>
nnoremap dgp :Denite grep/py<CR>
nnoremap ddr :Denite defx/drive<CR>
nnoremap dbm :Denite d-bookmark<CR>
"-----------------------------------------

"-------------------------denite Define mappings-------------------------
"
call denite#custom#kind('dirmark/add', 'default_action', 'add')
call denite#custom#kind('buffer', 'default_action', 'open')
"call denite#custom#kind('file', 'default_action', 'split')
"
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> a
  \ denite#do_map('add')
  nnoremap <silent><buffer><expr> o
  \ denite#do_map('open')

endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Change file/rec command.
call denite#custom#var('file/rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Change matchers.
call denite#custom#source(
\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
\ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
call denite#custom#source(
\ 'file/rec', 'sorters', ['sorter/sublime'])

" Change default action.
call denite#custom#kind('file', 'default_action', 'split')

" Add custom menus
let s:menus = {}

let s:menus.zsh = {
	\ 'description': 'Edit your import zsh configuration'
	\ }
let s:menus.zsh.file_candidates = [
	\ ['zshrc', '~/.config/zsh/.zshrc'],
	\ ['zshenv', '~/.zshenv'],
	\ ]

let s:menus.my_commands = {
	\ 'description': 'Example commands'
	\ }
let s:menus.my_commands.command_candidates = [
	\ ['Split the window', 'vnew'],
	\ ['Open zsh menu', 'Denite menu:zsh'],
	\ ['Format code', 'FormatCode', 'go,python'],
	\ ]

call denite#custom#var('menu', 'menus', s:menus)

"" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command',['scantree.py'])

call denite#custom#alias('source', 'grep/py', 'grep')
call denite#custom#var('grep/py', 'command', ['ag'])
call denite#custom#var('grep/py', 'default_opts',['--python'])
call denite#custom#var('grep/py', 'recursive_opts', [])
call denite#custom#var('grep/py', 'pattern_opt', [])
call denite#custom#var('grep/py', 'separator', ['--'])
call denite#custom#var('grep/py', 'final_opts', [])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" Custom action
" Note: lambda function is not supported in Vim8.
call denite#custom#action('file', 'test',
      \ {context -> execute('let g:foo = 1')})
call denite#custom#action('file', 'test2',
      \ {context -> denite#do_action(
      \  context, 'open', context['targets'])})

"for dirmark
call dirmark#set_cache_directory_path(plugin_dir . '/.cache/denite-dirmark')

