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

function! s:suite.command() abort
  norm ithis is a long var
  call s:assert.equal(getline('.'), 'this is a long var')

  Spacey _

  norm othis is a long var
  call s:assert.equal(getline('.'), 'this_is_a_long_var')

  Spacey

  norm othis is a long var
  call s:assert.equal(getline('.'), 'this is a long var')
endfunction

function! s:suite.maps() abort
  imap <C-_> <Plug>spacey-underscore
  imap <C--> <Plug>spacey-hyphen<CR>
  imap <C-space> <Plug>spacey-clear<CR>

  norm ithis is a long var
  call s:assert.equal(getline('.'), 'this is a long var')

  execute "norm o\<C-_>this is a long var"
  call s:assert.equal(getline('.'), 'this_is_a_long_var')

  execute "norm o\<C-_>this is a long var"
  call s:assert.equal(getline('.'), 'this is a long var')

  execute "norm o\<C-->this is a long var"
  call s:assert.equal(getline('.'), 'this-is-a-long-var')

  execute "norm o\<C-space>this is a long var"
  call s:assert.equal(getline('.'), 'this is a long var')

endfunction


