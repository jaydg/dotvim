# My vim configuration

Install with

    git clone https://github.com/jaydg/dotvim.git ~/.vim

Install the plugins with

	:PlugInstall

## Key Bindings

| Key    | Function                          |
| ------ | --------------------------------- |
| F7     | task list                         |
| F8     | toggle ctags tag bar              |
| F9     | previous buffer                   |
| F10    | next buffer                       |
| CTRL-f | CtrlSF (find in files) prefix     |
|      f | CtrlSF prompt (with selection)    |
|      F | CtrlSF search (with selection)    |
|      n | CtrlSF prompt (word under cursor) |
|      p | CtrlSF prompt, last vim search    |
|      o | reopen CtrlSF window              |
|      t | toggle CtrlSF window              |
| CTRL-j | ALE: jump to next error           |
| CTRL-k | jump to previous error            |
| CTRL-n | focus current file in NERDTree    |
| CTRL-t | toggle NERDTree                   |
| CTRL-p | open ctrlp                        |

## Miscellaneous

Read manpages with e.g. ``:SuperMan mkdir`` or ``:SuperMan 2 mkdir`` to
get the manpage from section 2.

## Useful Documentation

 * [Splitting](https://linuxhandbook.com/split-vim-workspace/)
