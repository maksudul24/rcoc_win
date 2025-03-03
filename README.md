Requirments:
vim editor and g++ compiler enabled windows command line. <br>

Opertation:<br>
Just copy and paste the "_vimrc" to _vimrc windows


*Vim integration

1.'Alt + n' will copy the filename from clipboard and open new file tab <br>
2.'Alt + b' will compile the code in current tab and genrate 'a'<br>
3.'Alt + r' will run a<br>
4.'Alt + e' will run the code with input<br>
5.'Alt + i' will copy input from clipboard<br>
6.'Alt + p' will paste the code in current tab with added //open_file <br>

Copy this code to you _vimrc

"this portion will compile code<br>
nnoremap <M-b> :call RabatCompileCode()<CR><br>
<br>
"open the terminal right<br>
<p>nnoremap <M-t> :call RabatOpenTerminalRight()<CR></p><br>
<br>
"this will run code with input<br>
nnoremap <M-e> :call RabatRunCodeWithInput()<CR><br>
<br>
"this will paste input.txt from clipboard use Alt + i<br>
nnoremap <M-i> :call RabatCopyInput()<CR><br>
<br>
"this will just run the code binary, use Alt + r<br>
nnoremap <M-r> :call RabatRunCode()<CR><br>
<br>
"this will paste the code with added '//open_file'<br>
nnoremap <M-p> :call RabatPasteCode()<CR><br>
<br>
"Open Code with the given filename, use Alt + o<br>
nnoremap <M-o> :call RabatOpenCode()<CR><br>
<br>
"Create new filename by just copying(it sets the file name from clipboard),
"use Alt + n<br>
nnoremap <M-n> :call RabatNewTab()<CR><br>

"optional the last window will not be a terminal<br>
"autocmd BufEnter * if winnr('$') == 1 && &buftype == 'terminal' | quit! | endif<br>
