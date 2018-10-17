syn match undone /.*\-\ \[\ \].*/
syn match done /.*\-\ \[x\].*/
syn match test_undone /.*\-\ \[\ \] Test:.*/
syn match test_done /.*\-\ \[x\] Test:.*/

hi link undone Error
hi link done Statement
hi link test_undone Identifier
hi link test_done Statement
