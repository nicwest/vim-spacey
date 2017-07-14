" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

" Private Functions: {{{1
function! s:clear() abort
  try
    iunmap <buffer> <space>
  catch /.*/
  endtry
endfunction


" Library Interface: {{{1
function! spacey#toggle(to_char) abort
  if a:to_char == ''
    call s:clear()
    return
  end

  if exists('b:spacey_to_char')
    if b:spacey_to_char == a:to_char
      call s:clear()
      return
    end
  end
  let b:spacey_to_char = a:to_char
  execute 'inoremap <buffer> <space> ' . a:to_char
endfunction

" Teardown:{{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
