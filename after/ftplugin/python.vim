nnoremap <buffer> <leader>af :%!autopep8 -<cr>
vnoremap <buffer> <leader>af :!autopep8 -<cr>

iabbrev <buffer> pmain if __main__ == "__main__":<cr>
iabbrev <buffer> ipdbreak import ipdb; ipdb.set_trace()
