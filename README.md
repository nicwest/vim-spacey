[![Build Status](https://travis-ci.org/nicwest/vim-spacey.svg?branch=master)](https://travis-ci.org/nicwest/vim-spacey)

vim-spacey
==========

temporarily binds the space bar to a character

Usage
-----

```viml
:Spacey <char>      " binds the space bar to the given <char> in insert mode
:Spacey             " clears space bar binds

<Plug>spacey-underscore  " toggles the space bar to `_` in insert mode
<Plug>spacey-hyphen      " toggles the space bar to `-` in insert mode
<Plug>spacey-clear       " space bar will be space bar again
```

Suggested Mappings
------------------

spacey doesn't bind anything by default. These are the mappings I use.

```viml
imap <C-_> <Plug>spacey-underscore
imap <C--> <Plug>spacey-hyphen<CR>
imap <C-space> <Plug>spacey-clear<CR>
```
__Doesn't work :(__

Tests
-----

To run the tests pull the [themis test
suite](https://github.com/thinca/vim-themis) (you don't have to install it but
you can if you want). I normally just dump it in the plugin directory.

```
git clone git@github.com:thinca/vim-themis.git
./vim-themis/bin/themis --reporter dot test
```

alternatively you can use the Makefile in the root dir

```
make init
make test
make lint
```
