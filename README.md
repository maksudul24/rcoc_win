rcoc
==========
#### Requirments:
- vim editor 8+ with terminal and g++ compiler enabled in windows command line.
- Check typing ```g++ --version``` on command line

#### Opertation:
- Just copy and paste the mapping in "_vimrc" in windows


Vim integration
---------------

- 'Alt + n' will copy the filename from clipboard and open new file tab
- 'Alt + b' will compile the code in current tab and genrate 'a'
- 'Alt + r' will run a
- 'Alt + e' will run the code with input
- 'Alt + i' will copy input from clipboard
- 'Alt + p' will paste the code in current tab with added '//' to your chosen line or word (Example: it replaces "open_file;" to "//open_file;" from template.)
- 'Alt + m' will clear the terminal screen
  
Installation
------------
* Manual
  * Copy `plugin/rabat.vim` to `$HOME/vimfiles/plugin`
* VimPlug
  * `Plug "maksudul24/rcoc_win"`


Mappings
---------
Copy this to your _vimrc
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

"Clears the terminal screen, use Alt + m
nnoremap <M-m> :call RabatClearTerminal()<CR>

"optional the last window will not be a terminal
"autocmd BufEnter * if winnr('$') == 1 && &buftype == 'terminal' | quit! | endif
```
