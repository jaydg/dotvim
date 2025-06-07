# My vim configuration

Install with

    git clone https://github.com/jaydg/dotvim.git ~/.vim

Install the plugins with

    :PlugInstall

For the full Go support, run `:GoUpdateBinaries` afterwards.
As this installs _a lot_ of things, it is not done automatically.

## Key Bindings

| Key    | Function                          |
| ------ | --------------------------------- |
| F7     | task list                         |
| F8     | toggle ctags tag bar              |
| F12    | toggle dark/light background      |
| TAB    | next buffer                       |
| S-TAB  | previous buffer                   |
| CTRL-b | CtrlP buffer list                 |
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
