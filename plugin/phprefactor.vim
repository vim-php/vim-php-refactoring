let g:php_refactor_command='php ~/bin/refactor.phar'
let g:php_refactor_patch_command='patch -p1'

func! PhpRefactorExtractMethod()
    " check the file has been saved
    if &modified
        echom 'Cannot refactor; file contains unsaved changes'
        return
    endif

    let startLine = line('v')
    let endLine = line('.')
    let method = input('Enter extracted method name: ')

    " check line numbers are the right way around
    if startLine > endLine
        let temp = startLine
        let startLine = endLine
        let endLine = temp
    endif

    let range = startLine . '-' . endLine

    let args = [range, method]

    call PhpRefactorRunCommand('extract-method', args)

    " todo : exit visual mode
endfunc

func! PhpRefactorLocalVariableToInstanceVariable()
    " check the file has been saved
    if &modified
        echom 'Cannot refactor; file contains unsaved changes'
        return
    endif

    let variable = expand('<cword>')
    let lineNo = line('.')

    let args = [lineNo, variable]

    call PhpRefactorRunCommand('convert-local-to-instance-variable', args)
endfunc

func! PhpRefactorRenameLocalVariable()
    " check the file has been saved
    if &modified
        echom 'Cannot refactor; file contains unsaved changes'
        return
    endif

    let oldName = expand('<cword>')
    let lineNo = line('.')
    let newName = input('Enter new variable name: ')

    let args = [lineNo, oldName, newName]

    call PhpRefactorRunCommand('rename-local-variable', args)
endfunc

func! PhpRefactorOptimizeUse()
    " check the file has been saved
    if &modified
        echom 'Cannot refactor; file contains unsaved changes'
        return
    endif

    call PhpRefactorRunCommand('optimize-use', [])
endfunc

func! PhpRefactorRunCommand(refactoring, args)
    " Enable autoread to stop prompting for reload
    setlocal autoread

    let command = ':!' . g:php_refactor_command
        \ . ' ' . a:refactoring . ' %'

    for arg in a:args
        let command = command . ' ' . arg
    endfor

    exec command .' | '.g:php_refactor_patch_command

    setlocal noautoread
endfunc
