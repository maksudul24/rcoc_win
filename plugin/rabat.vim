function! RabatGetTerminalBuffer() 
  let term_buffers = term_list()

  if empty(term_buffers)
    call RabatOpenTerminalRight()
    let buf = bufnr('%')
  else
    let buf = term_buffers[0]
  endif
  return buf

endfunction

function! RabatOpenTerminalRight()
    let term_buffers = term_list()
    if empty(term_buffers)
        botright vsplit
        vertical resize 40
        terminal++curwin
    else
        let buf = term_buffers[0]
        call term_sendkeys(buf,"cls\<CR>")
        call term_setkill(buf,"kill")
        call term_sendkeys(buf, "exit\<CR>")
    endif
endfunction


function! RabatRunCodeWithInput()
    let buf = RabatGetTerminalBuffer()
    if has('win32') || has('win64')
        call term_sendkeys(buf,"type input.txt\<CR>")
        call term_sendkeys(buf, "a\<CR>")
    endif
    if has('linux')
        call term_sendkeys(buf,"cat input.txt\<CR>")
        call term_sendkeys(buf, "./a\<CR>")
    endif
endfunction




function! RabatRunCode()
    let buf = RabatGetTerminalBuffer()
    if has('win32') || has('win64')
        call term_sendkeys(buf, "a\<CR>")
    endif
    if has('linux')
        call term_sendkeys(buf, "./a\<CR>")
    endif
endfunction


function! RabatPasteCode(old_word, new_word)
    let codename = expand('%')
    let code = readfile(codename)
    let codestring = join(code,"\n")
    let newcode = substitute(codestring, a:old_word, a:new_word, 'g')
    call setreg('+', newcode)
    echo "Succesfully Copied to Clipboard"

endfunction



function! RabatCopyInput()
    let clipboard_content = split(getreg('+'), '\n')
    call writefile(clipboard_content, "input.txt")
endfunction



function! RabatOpenCode() 
    let buf = RabatGetTerminalBuffer()
    call term_setkill(buf,"kill")
    call term_sendkeys(buf, "exit\<CR>")

    let tabstrings = [getreg('+')]
    let tabname = join(tabstrings,'')
    let tabname = substitute(tabname,'\n','','g')
    let tabname = substitute(tabname,'\v[|\/*"?<>]','','g')
    let tabname = substitute(tabname, '\s\+$','', '') 
    let tabname = tabname . ".cpp"

    if !filereadable(tabname)
        let tempfile = "template.cpp"
        if !filereadable(tempfile)
            call writefile([""],tempfile)
        endif
        let template_code = readfile(tempfile)
        call writefile(template_code,tabname)
    endif

    let insturction = "tabnew " . tabname
    execute insturction
    tabprevious
    tabclose!
endfunction


function! RabatNewTab()
    let tabstrings = [getreg('+')]
    let tabname = join(tabstrings,'')
    let tabname = substitute(tabname,'\n','','g')
    let tabname = substitute(tabname,'\v[|\/*"?<>]','','g')
    let tabname = substitute(tabname, '\s\+$','', '') 
    let tabname = tabname . ".cpp"

    if !filereadable(tabname)
        let tempfile = "template.cpp"
        if !filereadable(tempfile)
            call writefile([""],tempfile)
        endif
        let template_code = readfile(tempfile)
        call writefile(template_code,tabname)
    endif

    let insturction = "tabnew " . tabname
    execute insturction
endfunction


function! RabatCompileCode(compiler_cmd)
        let tabname = expand('%')
        let buf = RabatGetTerminalBuffer()
        let instruction = a:compiler_cmd . " \"" . tabname . "\" -o a\<CR>"
        call term_sendkeys(buf,instruction)
endfunction

function! RabatClearTerminal() 
  let term_buffers = term_list()

  if !empty(term_buffers)
      let buf = term_buffers[0]
      call term_sendkeys(buf,"cls\<CR>")
  endif
endfunction

