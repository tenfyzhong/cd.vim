"==============================================================
"    file: cd.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2015-12-26 22:48:37
"==============================================================

if exists("g:plugin_cd_vim")
    finish
endif

let g:plugin_cd_vim = 1

command! -complete=file -nargs=? CD call <SID>CdFile('cd', <f-args>)
command! -complete=file -nargs=? LCD call <SID>CdFile('lcd', <f-args>)

" cd to path {{{
function! s:CdFile(cmd, ...)
    if a:cmd != 'cd' && 
                \a:cmd != 'lcd'
        call vimlog#Errlog("cmd [" . a:cmd . "] is error")
        return
    endif

    let l:file = '%'
    if a:0 != 0
        let l:file = a:1
    endif

    let l:path = file#ExecFilePath(a:cmd, l:file)
    if l:path != ''
        echo a:cmd . " to " . l:path
    endif

endfunction
" }}}
