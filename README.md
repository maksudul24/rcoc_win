rcoc
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/AnotherProksY/ez-window/blob/master/LICENSE)
==========
Requirments:
vim editor 8+ with terminal and g++ compiler enabled windows command line. <br>

Opertation:<br>
Just copy and paste the "_vimrc" to _vimrc windows


*Vim integration
----------------

- 1.'Alt + n' will copy the filename from clipboard and open new file tab <br>
- 2.'Alt + b' will compile the code in current tab and genrate 'a'<br>
- 3.'Alt + r' will run a<br>
- 4.'Alt + e' will run the code with input<br>
- 5.'Alt + i' will copy input from clipboard<br>
- 6.'Alt + p' will paste the code in current tab with added '//' to your chosen line or word (Example: it replaces "open_file;" to "//open_file;" from template.)<br>

Installation
------------
* Manual
  * Copy `plugin/rabat.vim` to `~/.vim/plugin`


Mappings
---------
Copy this to you _vimrc
```vim
"this portion will compile code
nnoremap <M-b> :call RabatCompileCode()<CR>

"open the terminal right
nnoremap <M-t> :call RabatOpenTerminalRight()<CR>

"this will run code with input
nnoremap <M-e> :call RabatRunCodeWithInput()<CR>

"this will paste input.txt from clipboard use Alt + i
nnoremap <M-i> :call RabatCopyInput()<CR>

"this will just run the code binary, use Alt + r
nnoremap <M-r> :call RabatRunCode()<CR>

"this will paste the code to clipboard with added with replace with 'open_file;' to '//open_file;' 
nnoremap <M-p> :call RabatPasteCode("open_file;","//open_file;")<CR>

"Open Code with the given filename, use Alt + o
nnoremap <M-o> :call RabatOpenCode()<CR>

"Create new filename by just copying(it sets the file name from clipboard),
"use Alt + n
nnoremap <M-n> :call RabatNewTab()<CR>

"optional the last window will not be a terminal
"autocmd BufEnter * if winnr('$') == 1 && &buftype == 'terminal' | quit! | endif
```
