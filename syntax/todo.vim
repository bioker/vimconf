syn match undone /.*\-\ \[\ \].*/
syn match done /.*\-\ \[x\].*/

hi link undone Error
hi link done Statement
