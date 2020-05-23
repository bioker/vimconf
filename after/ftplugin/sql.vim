vmap <buffer> <leader>dt yodescribe <c-r>"<esc>V,ec
vmap <buffer> <leader>ct yoselect count(*) from <c-r>"<esc>V,ec
vmap <buffer> <leader>saf yoselect * from <c-r>"<esc>V,ec
nmap <buffer> <leader>st oshow tables<esc>v2b,ec
nmap <buffer> <leader>sd oshow databases<esc>v2b,ec
nnoremap <buffer> <leader>gc oselect <c-r>c, count(*) from <c-r>t group by <c-r>c<esc>

iabbrev <buffer> selal select * from
iabbrev <buffer> innj inner join
iabbrev <buffer> desct describe table
