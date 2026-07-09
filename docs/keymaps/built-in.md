## Built-in Vim/Neovim Keybindings

### Navigation & Movement

#### Basic Character Motion

- [normal] h : Move cursor one character left
- [normal] j : Move cursor one line down (display line in wrap mode)
- [normal] k : Move cursor one line up (display line in wrap mode)
- [normal] l : Move cursor one character right
- [normal] gj : Move cursor one display line down (useful in wrapped lines)
- [normal] gk : Move cursor one display line up (useful in wrapped lines)
- [visual] h : Move cursor left and extend selection
- [visual] j : Move cursor down and extend selection
- [visual] k : Move cursor up and extend selection
- [visual] l : Move cursor right and extend selection

#### Word Motion

- [normal] w : Move cursor forward to the beginning of the next word (words separated by whitespace or punctuation)
- [normal] W : Move cursor forward to the beginning of the next WORD (WORDs separated only by whitespace)
- [normal] b : Move cursor backward to the beginning of the previous word
- [normal] B : Move cursor backward to the beginning of the previous WORD
- [normal] e : Move cursor forward to the end of the current/next word
- [normal] E : Move cursor forward to the end of the current/next WORD
- [normal] ge : Move cursor backward to the end of the previous word
- [normal] gE : Move cursor backward to the end of the previous WORD
- [visual] w : Move forward to next word and extend selection
- [visual] W : Move forward to next WORD and extend selection
- [visual] b : Move backward to previous word and extend selection
- [visual] B : Move backward to previous WORD and extend selection
- [visual] e : Move to end of word and extend selection
- [visual] E : Move to end of WORD and extend selection
- [visual] ge : Move to end of previous word and extend selection
- [visual] gE : Move to end of previous WORD and extend selection
- [operator-pending] w : Operate on text from cursor to beginning of next word
- [operator-pending] W : Operate on text from cursor to beginning of next WORD
- [operator-pending] b : Operate on text from cursor to beginning of previous word
- [operator-pending] B : Operate on text from cursor to beginning of previous WORD
- [operator-pending] e : Operate on text from cursor to end of word
- [operator-pending] E : Operate on text from cursor to end of WORD
- [operator-pending] ge : Operate on text from cursor to end of previous word
- [operator-pending] gE : Operate on text from cursor to end of previous WORD

#### Line Motion

- [normal] 0 : Move cursor to the first character of the line (column 0)
- [normal] ^ : Move cursor to the first non-whitespace character of the line
- [normal] $ : Move cursor to the end of the line (last character)
- [normal] g_ : Move cursor to the last non-whitespace character of the line
- [normal] g0 : Move cursor to the first character of the display line (useful in wrapped lines)
- [normal] g$ : Move cursor to the last character of the display line (useful in wrapped lines)
- [normal] g^ : Move cursor to the first non-whitespace character of the display line
- [normal] gm : Move cursor to the middle of the screen line
- [normal] | : Move cursor to the column specified by count (e.g., 5| goes to column 5)
- [visual] 0 : Move to first character and extend selection
- [visual] ^ : Move to first non-whitespace character and extend selection
- [visual] $ : Move to end of line and extend selection
- [visual] g_ : Move to last non-whitespace character and extend selection
- [visual] g0 : Move to first character of display line and extend selection
- [visual] g$ : Move to last character of display line and extend selection
- [visual] g^ : Move to first non-whitespace of display line and extend selection
- [visual] gm : Move to middle of screen line and extend selection
- [visual] | : Move to column and extend selection

#### Line Number Motion

- [normal] gg : Go to the first line of the file
- [normal] G : Go to the last line of the file
- [normal] [count]G : Go to line number [count] (e.g., 50G goes to line 50)
- [normal] [count]gg : Go to line number [count]
- [normal] :[line] : Go to specified line number using command mode (e.g., :42 goes to line 42)
- [visual] gg : Extend selection to first line of file
- [visual] G : Extend selection to last line of file
- [visual] [count]G : Extend selection to line [count]
- [visual] [count]gg : Extend selection to line [count]

#### Screen Position Motion

- [normal] H : Move cursor to the top of the screen (Home)
- [normal] M : Move cursor to the middle of the screen
- [normal] L : Move cursor to the bottom of the screen (Low)
- [normal] [count]H : Move cursor to [count] lines from the top of the screen
- [normal] [count]L : Move cursor to [count] lines from the bottom of the screen

#### Jump Navigation

- [normal] Ctrl-o : Jump backward to the previous location in the jump list (older position)
- [normal] Ctrl-i : Jump forward to the next location in the jump list (newer position, same as Tab)
- [normal] g; : Go to the position of the previous change in the change list (older change)
- [normal] g, : Go to the position of the next change in the change list (newer change)
- [normal] `` : Jump back to the position before the last jump
- [normal] '' : Jump back to the line before the last jump (first non-whitespace character)
- [normal] `. : Jump to the position of the last change in current buffer
- [normal] '. : Jump to the line of the last change in current buffer
- [normal] :jumps : Display the jump list
- [normal] :changes : Display the change list

#### Scrolling

- [normal] Ctrl-f : Scroll forward one full screen (page down)
- [normal] Ctrl-b : Scroll backward one full screen (page up)
- [normal] Ctrl-d : Scroll down half a screen (deleted lines move up) - **CUSTOM: also centers cursor**
- [normal] Ctrl-u : Scroll up half a screen (lines move down) - **CUSTOM: also centers cursor**
- [normal] Ctrl-e : Scroll the window down one line (exposing lines below)
- [normal] Ctrl-y : Scroll the window up one line (exposing lines above)
- [normal] zz : Center the current line in the window
- [normal] zt : Move current line to the top of the window
- [normal] zb : Move current line to the bottom of the window
- [normal] z. : Center current line and move cursor to first non-whitespace character
- [normal] z+ : Move cursor to first non-whitespace of line below window and scroll
- [normal] z^ : Move cursor to first non-whitespace of line above window and scroll
- [normal] z- : Move current line to bottom and move cursor to first non-whitespace character

#### Character Search in Line

- [normal] f{char} : Move cursor forward to the next occurrence of {char} in the current line
- [normal] F{char} : Move cursor backward to the previous occurrence of {char} in the current line
- [normal] t{char} : Move cursor forward to just before the next occurrence of {char} in the current line (till)
- [normal] T{char} : Move cursor backward to just after the previous occurrence of {char} in the current line
- [normal] ; : Repeat the last f, F, t, or T motion in the same direction
- [normal] , : Repeat the last f, F, t, or T motion in the opposite direction
- [visual] f{char} : Move to next {char} and extend selection
- [visual] F{char} : Move to previous {char} and extend selection
- [visual] t{char} : Move to before next {char} and extend selection
- [visual] T{char} : Move to after previous {char} and extend selection
- [visual] ; : Repeat last f/F/t/T and extend selection
- [visual] , : Reverse repeat last f/F/t/T and extend selection
- [operator-pending] f{char} : Operate from cursor to next {char}
- [operator-pending] F{char} : Operate from cursor to previous {char}
- [operator-pending] t{char} : Operate from cursor to before next {char}
- [operator-pending] T{char} : Operate from cursor to after previous {char}
- [operator-pending] ; : Repeat last f/F/t/T motion for operation
- [operator-pending] , : Reverse repeat last f/F/t/T motion for operation

#### Paragraph & Block Motion

- [normal] { : Move cursor to the beginning of the previous paragraph (blank line separated)
- [normal] } : Move cursor to the beginning of the next paragraph
- [normal] ( : Move cursor to the beginning of the previous sentence
- [normal] ) : Move cursor to the beginning of the next sentence
- [normal] [[ : Move cursor to the previous section (or beginning of previous function in some filetypes)
- [normal] ]] : Move cursor to the next section (or beginning of next function)
- [normal] [] : Move cursor to the end of the previous section
- [normal] ][ : Move cursor to the end of the next section
- [normal] [{ : Move cursor to the beginning of the previous code block (unmatched {)
- [normal] ]} : Move cursor to the end of the next code block (unmatched })
- [normal] [( : Move cursor to the beginning of the previous parenthesis block (unmatched ()
- [normal] ]) : Move cursor to the end of the next parenthesis block (unmatched ))
- [visual] { : Move to previous paragraph and extend selection
- [visual] } : Move to next paragraph and extend selection
- [visual] ( : Move to previous sentence and extend selection
- [visual] ) : Move to next sentence and extend selection
- [visual] [[ : Move to previous section and extend selection
- [visual] ]] : Move to next section and extend selection
- [visual] [] : Move to end of previous section and extend selection
- [visual] ][ : Move to end of next section and extend selection
- [visual] [{ : Move to previous code block and extend selection
- [visual] ]} : Move to next code block and extend selection
- [visual] [( : Move to previous parenthesis block and extend selection
- [visual] ]) : Move to next parenthesis block and extend selection

#### Matching Pair Motion

- [normal] % : Jump to the matching bracket, parenthesis, or brace (or matching HTML/XML tag with matchit plugin)
- [visual] % : Extend selection to matching bracket/parenthesis/brace

---

### Editing

#### Entering Insert Mode

- [normal] i : Enter insert mode before the cursor
- [normal] I : Enter insert mode at the first non-whitespace character of the line
- [normal] a : Enter insert mode after the cursor (append)
- [normal] A : Enter insert mode at the end of the line
- [normal] o : Open a new line below the current line and enter insert mode
- [normal] O : Open a new line above the current line and enter insert mode
- [normal] gi : Enter insert mode at the position of the last insert mode exit (restores insert position) - **OVERRIDDEN: by LSP go to implementation**
- [normal] gI : Enter insert mode at column 1 of the current line (before any indentation)

#### Exiting Insert Mode

- [insert] Esc : Exit insert mode and return to normal mode
- [insert] Ctrl-c : Exit insert mode and return to normal mode - **CUSTOM: mapped to act like Escape**
- [insert] Ctrl-[ : Exit insert mode and return to normal mode (built-in alternative to Esc)

#### Delete Operations

- [normal] x : Delete the character under the cursor (cuts to default register)
- [normal] X : Delete the character before the cursor (backspace in normal mode)
- [normal] d{motion} : Delete text specified by motion (e.g., dw deletes word, d$ deletes to end of line)
- [normal] dd : Delete the entire current line (cuts to default register)
- [normal] D : Delete from cursor to the end of the line (equivalent to d$)
- [normal] [count]dd : Delete [count] lines (e.g., 3dd deletes 3 lines)
- [visual] d : Delete the selected text (cuts to default register)
- [visual] x : Delete the selected text (same as d in visual mode)
- [operator-pending] d : Used with motions to delete text (e.g., diw deletes inner word)

#### Change Operations

- [normal] c{motion} : Delete text specified by motion and enter insert mode (e.g., cw changes word)
- [normal] cc : Delete the entire current line and enter insert mode (preserving indentation)
- [normal] C : Delete from cursor to end of line and enter insert mode (equivalent to c$)
- [normal] s : Delete character under cursor and enter insert mode (substitute character)
- [normal] S : Delete entire line and enter insert mode (equivalent to cc)
- [normal] r{char} : Replace the character under cursor with {char} (stays in normal mode)
- [normal] R : Enter replace mode, where each character typed replaces existing characters
- [normal] ~ : Toggle case of character under cursor and move cursor right
- [normal] g~{motion} : Toggle case of text specified by motion (e.g., g~iw toggles case of word)
- [normal] gu{motion} : Change text specified by motion to lowercase (e.g., guiw lowercases word)
- [normal] gU{motion} : Change text specified by motion to uppercase (e.g., gUiw uppercases word)
- [visual] c : Delete selected text and enter insert mode
- [visual] C : Delete selected lines and enter insert mode
- [visual] s : Delete selected text and enter insert mode (same as c)
- [visual] r{char} : Replace all selected characters with {char}
- [visual] ~ : Toggle case of all selected characters
- [visual] u : Change selected text to lowercase
- [visual] U : Change selected text to uppercase

#### Yank (Copy) Operations

- [normal] y{motion} : Yank (copy) text specified by motion (e.g., yw yanks word)
- [normal] yy : Yank the entire current line
- [normal] Y : Yank from cursor to end of line (equivalent to y$)
- [normal] [count]yy : Yank [count] lines
- [visual] y : Yank the selected text
- [operator-pending] y : Used with motions to yank text

#### Put (Paste) Operations

- [normal] p : Put (paste) the text from register after the cursor (or below current line for line-wise yanks)
- [normal] P : Put (paste) the text from register before the cursor (or above current line for line-wise yanks)
- [normal] gp : Put text after cursor and move cursor to after the pasted text
- [normal] gP : Put text before cursor and move cursor to after the pasted text
- [normal] ]p : Put text after cursor with indent adjusted to match current line
- [normal] [p : Put text before cursor with indent adjusted to match current line
- [visual] p : Put text, replacing selected text - **NOTE: overwrites clipboard, use <leader>p to preserve**
- [visual] P : Put text before selection

#### Undo & Redo

- [normal] u : Undo the last change
- [normal] U : Undo all changes to the current line since the cursor moved to it
- [normal] Ctrl-r : Redo the last undone change
- [normal] g- : Go to older text state (time-based undo, can undo beyond branches)
- [normal] g+ : Go to newer text state (time-based redo)
- [normal] :earlier [time] : Go to text state [time] ago (e.g., :earlier 5m goes back 5 minutes)
- [normal] :later [time] : Go to text state [time] forward

#### Join Lines

- [normal] J : Join current line with the line below, inserting a space between them - **CUSTOM OVERRIDE: keeps cursor position**
- [normal] gJ : Join current line with the line below without inserting a space
- [normal] [count]J : Join [count] lines together
- [visual] J : Join all selected lines together with spaces - **CUSTOM OVERRIDE: moves lines down**
- [visual] gJ : Join all selected lines together without spaces

#### Repeat & Macros

- [normal] . : Repeat the last change (extremely powerful for repetitive edits)
- [normal] @{register} : Execute the macro stored in {register} (e.g., @a executes macro in register a)
- [normal] @@ : Re-execute the last executed macro
- [normal] q{register} : Start recording a macro into {register} (e.g., qa starts recording into register a)
- [normal] q : Stop recording the current macro (when already recording)
- [normal] [count]@{register} : Execute macro [count] times

#### Increment & Decrement

- [normal] Ctrl-a : Increment the number under or after the cursor
- [normal] Ctrl-x : Decrement the number under or after the cursor
- [normal] g Ctrl-a : In visual block mode, increment numbers with increasing values (1, 2, 3, etc.)
- [normal] g Ctrl-x : In visual block mode, decrement numbers with decreasing values
- [visual] Ctrl-a : Increment all numbers in selection
- [visual] Ctrl-x : Decrement all numbers in selection

#### Indentation

- [normal] >> : Indent current line right by one 'shiftwidth'
- [normal] << : Indent current line left by one 'shiftwidth'
- [normal] >{motion} : Indent lines specified by motion right
- [normal] <{motion} : Indent lines specified by motion left
- [normal] == : Auto-indent current line
- [normal] ={motion} : Auto-indent lines specified by motion
- [visual] > : Indent selected lines right (can repeat with . or by re-pressing >)
- [visual] < : Indent selected lines left
- [visual] = : Auto-indent selected lines

#### Formatting

- [normal] gq{motion} : Format (wrap) lines specified by motion according to 'textwidth'
- [normal] gqq : Format current line
- [normal] gw{motion} : Format lines like gq but keep cursor position
- [visual] gq : Format selected lines

---

### Visual Mode

#### Entering Visual Mode

- [normal] v : Enter character-wise visual mode (select by character)
- [normal] V : Enter line-wise visual mode (select full lines)
- [normal] Ctrl-v : Enter visual block mode (select rectangular blocks of text)
- [normal] gv : Re-select the previous visual selection
- [visual] v : Return to normal mode (from character-wise visual) or switch to character-wise (from other modes)
- [visual] V : Return to normal mode (from line-wise visual) or switch to line-wise (from other modes)
- [visual] Ctrl-v : Return to normal mode (from block visual) or switch to block mode (from other modes)
- [visual] Esc : Exit visual mode and return to normal mode

#### Visual Mode Navigation

- [visual] o : Move cursor to the other end of the selection (toggles which end is active)
- [visual] O : In block visual mode, move to the other corner on the same line

#### Visual Mode Operations

- [visual] d, c, y, p, r, ~, u, U : All normal mode operators work in visual mode on selected text
- [visual] : : Enter command-line mode with range automatically set to selection (e.g., :'<,'>s/old/new/)
- [visual] I : In block visual mode, insert text at the beginning of each line in the block
- [visual] A : In block visual mode, append text at the end of each line in the block

---

### Search & Replace

#### Search

- [normal] /{pattern} : Search forward for {pattern}
- [normal] ?{pattern} : Search backward for {pattern}
- [normal] n : Jump to the next search match in the same direction - **CUSTOM: also centers and unfolds**
- [normal] N : Jump to the previous search match (opposite direction) - **CUSTOM: also centers and unfolds**
- [normal] * : Search forward for the word under the cursor (exact word match)
- [normal] # : Search backward for the word under the cursor (exact word match)
- [normal] g* : Search forward for the word under the cursor (partial match)
- [normal] g# : Search backward for the word under the cursor (partial match)
- [normal] gd : Go to local declaration of variable under cursor (built-in, not LSP) - **OVERRIDDEN: by LSP to go to definition**
- [normal] gD : Go to global declaration of variable under cursor
- [normal] :noh : Clear search highlighting (shorthand for :nohlsearch)
- [normal] :set hlsearch : Enable search highlighting
- [normal] :set nohlsearch : Disable search highlighting

#### Search & Replace (Substitute)

- [normal] :s/{pattern}/{replacement}/ : Substitute first occurrence of {pattern} with {replacement} on current line
- [normal] :s/{pattern}/{replacement}/g : Substitute all occurrences on current line
- [normal] :%s/{pattern}/{replacement}/g : Substitute all occurrences in entire file
- [normal] :%s/{pattern}/{replacement}/gc : Substitute all occurrences with confirmation for each
- [normal] :'<,'>s/{pattern}/{replacement}/g : Substitute in visual selection (automatically inserted when selecting and typing :)
- [normal] :s/{pattern}/{replacement}/gi : Case-insensitive substitution
- [visual] :s/{pattern}/{replacement}/ : In visual mode, : automatically prefixes with '<,'> for visual range

---

### Marks & Registers

#### Marks

- [normal] m{a-z} : Set a local mark at the current position (lowercase marks are buffer-local)
- [normal] m{A-Z} : Set a global mark at the current position (uppercase marks work across files)
- [normal] '{mark} : Jump to the line of {mark} (first non-whitespace character)
- [normal] `{mark} : Jump to the exact position (line and column) of {mark}
- [normal] '' : Jump back to the line of the position before the last jump
- [normal] `` : Jump back to the exact position before the last jump
- [normal] '[ : Jump to the first line of the last changed or yanked text
- [normal] '] : Jump to the last line of the last changed or yanked text
- [normal] '< : Jump to the first line of the last visual selection
- [normal] '> : Jump to the last line of the last visual selection
- [normal] '^ : Jump to the position where insert mode was last exited
- [normal] '. : Jump to the position of the last change
- [normal] :marks : Display all marks
- [normal] :delmarks {marks} : Delete specified marks (e.g., :delmarks abc deletes marks a, b, c)
- [normal] :delmarks! : Delete all lowercase marks (a-z) in current buffer

#### Registers

- [normal] "{register} : Prefix to specify which register to use for next delete, yank, or put operation
- [normal] "" : The unnamed register (default register for delete, yank, put operations)
- [normal] "0 : The yank register (contains last yanked text, not affected by deletes)
- [normal] "1-"9 : Delete registers (numbered history, "1 is most recent delete)
- [normal] "- : Small delete register (deletes less than one line)
- [normal] "a-"z : Named registers (lowercase appends when using uppercase "A-"Z)
- [normal] "+ : System clipboard register (integrates with OS clipboard)
- [normal] "* : Selection register (X11 primary selection, middle-click paste on Linux)
- [normal] "_ : Black hole register (deletes don't affect other registers)
- [normal] "/ : Last search pattern register
- [normal] ": : Last command register (last executed command-line)
- [normal] ". : Last inserted text register
- [normal] "% : Current file name register
- [normal] "# : Alternate file name register
- [normal] :registers : Display contents of all registers
- [normal] :reg {registers} : Display specific registers (e.g., :reg abc shows registers a, b, c)

---

### Text Objects

#### Word Text Objects

- [operator-pending] iw : Inner word (word under cursor, excluding surrounding whitespace)
- [operator-pending] aw : A word (word under cursor, including one trailing whitespace)
- [operator-pending] iW : Inner WORD (WORD under cursor, excluding whitespace)
- [operator-pending] aW : A WORD (WORD under cursor, including trailing whitespace)
- [visual] iw : Select inner word
- [visual] aw : Select a word
- [visual] iW : Select inner WORD
- [visual] aW : Select a WORD

#### Sentence & Paragraph Text Objects

- [operator-pending] is : Inner sentence (sentence without surrounding whitespace)
- [operator-pending] as : A sentence (sentence including trailing whitespace)
- [operator-pending] ip : Inner paragraph (paragraph without surrounding blank lines)
- [operator-pending] ap : A paragraph (paragraph including surrounding blank lines)
- [visual] is : Select inner sentence
- [visual] as : Select a sentence
- [visual] ip : Select inner paragraph
- [visual] ap : Select a paragraph

#### Quote Text Objects

- [operator-pending] i" : Inner double quotes (text inside double quotes, excluding quotes)
- [operator-pending] a" : A double quoted string (text inside double quotes, including quotes)
- [operator-pending] i' : Inner single quotes (text inside single quotes, excluding quotes)
- [operator-pending] a' : A single quoted string (text inside single quotes, including quotes)
- [operator-pending] i` : Inner backticks (text inside backticks, excluding backticks)
- [operator-pending] a` : A backtick string (text inside backticks, including backticks)
- [visual] i" : Select inner double quoted string
- [visual] a" : Select a double quoted string (including quotes)
- [visual] i' : Select inner single quoted string
- [visual] a' : Select a single quoted string (including quotes)
- [visual] i` : Select inner backtick string
- [visual] a` : Select a backtick string (including backticks)

#### Bracket & Parenthesis Text Objects

- [operator-pending] i( or i) or ib : Inner parentheses (text inside parentheses, excluding parentheses)
- [operator-pending] a( or a) or ab : A parenthesized block (text inside parentheses, including parentheses)
- [operator-pending] i[ or i] : Inner square brackets (text inside brackets, excluding brackets)
- [operator-pending] a[ or a] : A bracketed block (text inside brackets, including brackets)
- [operator-pending] i{ or i} or iB : Inner curly braces (text inside braces, excluding braces)
- [operator-pending] a{ or a} or aB : A braced block (text inside braces, including braces)
- [operator-pending] i< or i> : Inner angle brackets (text inside angle brackets, excluding brackets)
- [operator-pending] a< or a> : An angle bracketed block (text inside angle brackets, including brackets)
- [visual] i( or i) or ib : Select inner parentheses
- [visual] a( or a) or ab : Select a parenthesized block (including parentheses)
- [visual] i[ or i] : Select inner square brackets
- [visual] a[ or a] : Select a bracketed block (including brackets)
- [visual] i{ or i} or iB : Select inner curly braces
- [visual] a{ or a} or aB : Select a braced block (including braces)
- [visual] i< or i> : Select inner angle brackets
- [visual] a< or a> : Select an angle bracketed block (including brackets)

#### Tag Text Objects

- [operator-pending] it : Inner tag (text inside HTML/XML tags, excluding tags themselves)
- [operator-pending] at : A tag block (text inside tags, including the opening and closing tags)
- [visual] it : Select inner tag
- [visual] at : Select a tag block (including tags)

---

### Window Management

#### Creating & Closing Windows

- [normal] Ctrl-w s : Split window horizontally (creates new window with same buffer)
- [normal] Ctrl-w v : Split window vertically (creates new window with same buffer)
- [normal] Ctrl-w n : Create new window with empty buffer (horizontal split)
- [normal] Ctrl-w c : Close current window (fails if it's the last window)
- [normal] Ctrl-w q : Quit current window (same as :q)
- [normal] Ctrl-w o : Close all windows except current one (only)
- [normal] :sp [file] : Split window horizontally and optionally open [file]
- [normal] :vs [file] : Split window vertically and optionally open [file]
- [normal] :new : Create new horizontal split with empty buffer
- [normal] :vnew : Create new vertical split with empty buffer

#### Navigating Between Windows

- [normal] Ctrl-w h : Move cursor to the window on the left
- [normal] Ctrl-w j : Move cursor to the window below
- [normal] Ctrl-w k : Move cursor to the window above
- [normal] Ctrl-w l : Move cursor to the window on the right
- [normal] Ctrl-w w : Cycle cursor to the next window (wraps around)
- [normal] Ctrl-w W : Cycle cursor to the previous window (reverse order)
- [normal] Ctrl-w p : Move cursor to the previous (last accessed) window
- [normal] Ctrl-w t : Move cursor to the top-left window
- [normal] Ctrl-w b : Move cursor to the bottom-right window

#### Moving Windows

- [normal] Ctrl-w H : Move current window to far left (full height)
- [normal] Ctrl-w J : Move current window to bottom (full width)
- [normal] Ctrl-w K : Move current window to top (full width)
- [normal] Ctrl-w L : Move current window to far right (full height)
- [normal] Ctrl-w r : Rotate windows downward/rightward
- [normal] Ctrl-w R : Rotate windows upward/leftward
- [normal] Ctrl-w x : Exchange current window with next window
- [normal] Ctrl-w T : Move current window to a new tab page

#### Resizing Windows

- [normal] Ctrl-w = : Make all windows equal size
- [normal] Ctrl-w + : Increase current window height by 1 line
- [normal] Ctrl-w - : Decrease current window height by 1 line
- [normal] Ctrl-w > : Increase current window width by 1 column
- [normal] Ctrl-w < : Decrease current window width by 1 column
- [normal] Ctrl-w _ : Maximize current window height
- [normal] Ctrl-w | : Maximize current window width
- [normal] [count]Ctrl-w + : Increase height by [count] lines
- [normal] [count]Ctrl-w - : Decrease height by [count] lines
- [normal] [count]Ctrl-w > : Increase width by [count] columns
- [normal] [count]Ctrl-w < : Decrease width by [count] columns
- [normal] :resize [height] : Set window height to [height] lines
- [normal] :vertical resize [width] : Set window width to [width] columns

---

### Buffer Management

#### Buffer Navigation

- [normal] :buffers or :ls : List all buffers
- [normal] :buffer [n] or :b [n] : Switch to buffer number [n]
- [normal] :buffer [name] : Switch to buffer matching [name] (supports partial matching)
- [normal] :bnext or :bn : Switch to next buffer in buffer list
- [normal] :bprevious or :bp : Switch to previous buffer in buffer list
- [normal] :bfirst or :bf : Switch to first buffer in buffer list
- [normal] :blast or :bl : Switch to last buffer in buffer list
- [normal] :badd [file] : Add [file] to buffer list without opening it
- [normal] Ctrl-^ or Ctrl-6 : Switch to alternate buffer (last accessed buffer)

#### Buffer Management

- [normal] :bdelete or :bd : Delete current buffer (unload from memory)
- [normal] :bdelete [n] : Delete buffer number [n]
- [normal] :bwipeout or :bw : Completely remove buffer from buffer list (including marks and jumps)
- [normal] :%bdelete or :%bd : Delete all buffers
- [normal] :ball : Open all buffers in windows
- [normal] :unhide : Open a window for each loaded buffer

---

### Tab Management

#### Creating & Closing Tabs

- [normal] :tabnew [file] : Create new tab and optionally open [file]
- [normal] :tabedit [file] or :tabe [file] : Same as :tabnew
- [normal] :tabclose or :tabc : Close current tab
- [normal] :tabonly or :tabo : Close all tabs except current one
- [normal] Ctrl-w T : Move current window to new tab page

#### Navigating Tabs

- [normal] gt : Go to next tab
- [normal] gT : Go to previous tab
- [normal] [count]gt : Go to tab number [count] (e.g., 3gt goes to tab 3)
- [normal] :tabn or :tabnext : Go to next tab
- [normal] :tabp or :tabprevious : Go to previous tab
- [normal] :tabfirst or :tabfir : Go to first tab
- [normal] :tablast or :tabl : Go to last tab
- [normal] :tabs : List all tabs

#### Moving Tabs

- [normal] :tabmove [n] : Move current tab to position [n] (0 for first position)
- [normal] :tabmove : Move current tab to last position
- [normal] :tabmove +[n] : Move current tab [n] positions to the right
- [normal] :tabmove -[n] : Move current tab [n] positions to the left

---

### Folding

#### Creating Folds

- [normal] zf{motion} : Create fold for text specified by motion
- [visual] zf : Create fold for selected text
- [normal] zF : Create fold for [count] lines (default: current line)
- [normal] :fold : Create fold for range (e.g., :10,20fold creates fold from line 10-20)

#### Opening & Closing Folds

- [normal] zo : Open fold under cursor (one level)
- [normal] zO : Open all folds under cursor recursively
- [normal] zc : Close fold under cursor (one level)
- [normal] zC : Close all folds under cursor recursively
- [normal] za : Toggle fold under cursor (open if closed, close if open)
- [normal] zA : Toggle all folds under cursor recursively

#### Fold Navigation

- [normal] zj : Move cursor to start of next fold
- [normal] zk : Move cursor to end of previous fold
- [normal] [z : Move cursor to start of current open fold
- [normal] ]z : Move cursor to end of current open fold

#### Fold Level Operations

- [normal] zm : Fold more (decrease fold level by one, closing folds)
- [normal] zM : Close all folds (set fold level to 0)
- [normal] zr : Reduce folding (increase fold level by one, opening folds)
- [normal] zR : Open all folds (set fold level to maximum)
- [normal] zn : Disable folding (fold none)
- [normal] zN : Enable folding (restore folding)
- [normal] zi : Toggle folding on/off

#### Deleting Folds

- [normal] zd : Delete fold under cursor
- [normal] zD : Delete all folds under cursor recursively
- [normal] zE : Eliminate all folds in window

---

### Command-Line & Ex Commands

#### Entering Command Mode

- [normal] : : Enter command-line mode for Ex commands
- [normal] / : Enter command-line mode for forward search
- [normal] ? : Enter command-line mode for backward search
- [visual] : : Enter command-line mode with range set to visual selection (automatically inserts '<,'>)

#### Command-Line Editing

- [command] Ctrl-b : Move cursor to beginning of command line
- [command] Ctrl-e : Move cursor to end of command line
- [command] Ctrl-w : Delete word before cursor
- [command] Ctrl-u : Delete all characters before cursor
- [command] Ctrl-r {register} : Insert contents of {register}
- [command] Ctrl-r Ctrl-w : Insert word under cursor
- [command] Ctrl-r Ctrl-a : Insert WORD under cursor
- [command] Ctrl-f : Open command-line window (full editing of command history)
- [command] Up arrow or Ctrl-p : Recall previous command from history
- [command] Down arrow or Ctrl-n : Recall next command from history

#### Common Ex Commands

- [normal] :w : Write (save) current buffer to file
- [normal] :w [file] : Write current buffer to [file]
- [normal] :q : Quit current window (fails if unsaved changes)
- [normal] :q! : Quit without saving changes (force quit)
- [normal] :wq or :x : Write and quit
- [normal] :qa : Quit all windows (fails if unsaved changes)
- [normal] :qa! : Quit all windows without saving
- [normal] :wqa : Write all changed buffers and quit
- [normal] :e [file] : Edit [file] (open file in current buffer)
- [normal] :e! : Reload current file, discarding unsaved changes
- [normal] :e# : Edit alternate file (same as Ctrl-^)
- [normal] :saveas [file] : Save current buffer as [file] and start editing [file]
- [normal] :r [file] : Read [file] and insert contents below cursor
- [normal] :r! [command] : Execute shell [command] and insert output below cursor

#### Shell Commands

- [normal] :! [command] : Execute shell [command] and display output
- [normal] :!! : Repeat last shell command
- [normal] :[range]! [command] : Filter [range] lines through shell [command]
- [visual] ! [command] : Filter selected lines through shell [command]
- [normal] Ctrl-z : Suspend Vim (return to shell, use 'fg' to resume)

---

### Miscellaneous

#### Information Commands

- [normal] Ctrl-g : Display file information (file name, line count, cursor position)
- [normal] g Ctrl-g : Display detailed position information (column, line, word, character, byte count)
- [normal] ga : Display ASCII value of character under cursor
- [normal] g8 : Display UTF-8 byte sequence of character under cursor
- [normal] :file or :f : Display current file information

#### Display & Redraw

- [normal] Ctrl-l : Redraw screen (useful if display gets corrupted)
- [normal] :redraw : Redraw screen
- [normal] :redraw! : Clear and redraw screen

#### Help System

- [normal] :help or :h : Open help
- [normal] :help [topic] : Open help for specific topic
- [normal] Ctrl-] : In help, jump to tag under cursor (follow link)
- [normal] Ctrl-t : In help, jump back to previous location

---

