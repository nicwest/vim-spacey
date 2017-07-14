" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development.
"if exists('g:loaded_spacey')
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_spacey= 1

" Maps: {{{1
inoremap <Plug>spacey-underscore <C-O>:call spacey#toggle('_')<CR>
inoremap <Plug>spacey-hyphen <C-O>:call spacey#toggle('-')<CR>
inoremap <Plug>spacey-clear <C-O>:call spacey#toggle('')<CR>


" Commands: {{{1
command! -nargs=* Spacey call spacey#toggle('<args>')


" Teardown: {{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
