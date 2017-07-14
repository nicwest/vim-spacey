let s:suite = themis#suite('spacey')
let s:assert = themis#helper('assert')

function! s:clean_up() abort
  norm! gg"_dG
  try
    iunmap <buffer> <space>
  catch /.*/
  endtry
  if exists('b:spacey_to_char')
    unlet b:spacey_to_char
  end
endfunction

function! s:suite.before_each() abort
  call s:clean_up()
endfunction

function! s:suite.after_each() abort
  call s:clean_up()
endfunction

function! s:suite.toggle() abort
  norm ithis is a long var
  call s:assert.equal(getline('.'), 'this is a long var')

  call spacey#toggle('_')
  norm othis is a long var
  call s:assert.equal(getline('.'), 'this_is_a_long_var')

  call spacey#toggle('_')
  norm othis is a long var
  call s:assert.equal(getline('.'), 'this is a long var')

  call spacey#toggle('-')
  norm othis is a long var
  call s:assert.equal(getline('.'), 'this-is-a-long-var')

  call spacey#toggle('')
  norm othis is a long var
  call s:assert.equal(getline('.'), 'this is a long var')
endfunction

