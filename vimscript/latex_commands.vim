function! CalculateWaste()
    normal 3k02f{lyiw3j02f{
    let l:arg1 = @"

    normal 4k02f{lyiw4j02f{l
    let l:arg2 = @"

    let @" = l:arg1 - l:arg2
    normal P
endfunction


function! CalculateUsage()
    normal mm
    normal 0f{lyi{
    let l:arg1= @"
    let arg1 = str2float(arg1)

    normal 02f{lyi{
    let l:arg2 = @"
    let arg2 = str2float(arg2)

    let l:arg3 = arg1 - arg2
    let @" = string(arg3)

    normal `m
    normal P
endfunction

function! TestFunc()
    let l:a = 30.5
    let l:b = 12.0
    let l:c = a-b
    let @" = string(c)
    normal P
endfunction

function! s:Visual()
    return visualmode() == 'V'
endfunction

function! s:Insert()
    return insertmode() == 'I'
endfunction

function! Move_up() abort range
    let l:at_top=a:firstline == 1
    if s:Visual() && !l:at_top
        '<,'>move '<-2
        call feedkeys('gv=gv', 'n')
    endif
    call feedkeys('gv=gv', 'n')
endfunction

function! Move_down() abort range
    let l:at_bottom=a:lastline == line('$')
    if s:Visual() && !l:at_bottom
        '<,'>move '>+1
        call feedkeys('gv=gv', 'n')
    endif
    call feedkeys('gv=gv', 'n')
endfunction

function! Move_up_insertMode() abort range
    let l:at_top=a:firstline == 1
    if s:Insert() && !l:at_top
        '<,'><ESC>move .-2
        call feedkeys('<CR>==', 'i')
    endif
    call feedkeys('<CR>==', 'i')
endfunction


"autocmd BufEnter * lua require'completion'.on_attach()


" autocmd Filetype tex inoremap ;u <esc> :call CalculateWaste()<cr> i
" autocmd Filetype tex inoremap ;w <esc> :call CalculateUsage()<cr> i
autocmd Filetype tex setlocal makeprg=compiler\ %
setlocal errorformat=%f:%l:%c:\ %t%n\ %m
