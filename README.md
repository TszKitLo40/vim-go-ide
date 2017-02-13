# The Ultimate vimrc, tailored for Go Development

This project is an IDE for the Go language based on amix's most excellent [Ultimate Vimrc](https://github.com/amix/vimrc). In addition to the [terrific Vim plugins](https://github.com/amix/vimrc#included-plugins) that were included in [Ultimate Vimrc](https://github.com/amix/vimrc), the following packages were added:

* [neocomplete](https://github.com/Shougo/neocomplete.vim): Next generation completion framework
* [UltiSnips](https://github.com/SirVer/ultisnips): The ultimate snippet solution for Vim
* [Tagbar](https://github.com/majutsushi/tagbar): Displays tags in a window, ordered by scope
* [CSApprox](https://github.com/vim-scripts/CSApprox): Makes gvim-only colorschemes work transparently in terminal vim
* [Colour-Sampler-Pack](https://github.com/vim-scripts/Colour-Sampler-Pack): Top 100(ish) Vim colorschemes
* [ScrollColors](https://github.com/vim-scripts/ScrollColors): Colorsheme Scroller, Chooser, and Browser


## Installation Instructions
To install, run the following commands:

    git clone https://github.com/diverdane/vimrc.git ~/.vim_runtime
    ~/.vim_runtime/install.sh

and then to make sure your Go development environment includes the necessary binaries, run/open vim, and type:

    :GoInstallBinaries


## The vim-go Plugin
Since this project started with [Ultimate Vimrc]((https://github.com/amix/vimrc) as a foundation, it includes the [vim-go](https://github.com/fatih/vim-go) Go development plugin for Vim. Please check out the [vim-go documentation](https://github.com/fatih/vim-go#vim-go-) for documentation of this plugin's powerful features.


## Function Key Mapping
The **~/.vim_runtime/my_configs.vim** file contains some function key mappings that should be helpful for Go development. These mappings are listed in the [my_func_mappings.txt](https://github.com/diverdane/vimrc/blob/master/my_func_mappings.txt) file.


## Go-Specific Key Mappings
The **~/.vim_runtime/my_configs.vim** file contains some Go-language-specific key mappings. These mappings are listed in the [my_mappings.txt](https://github.com/diverdane/vimrc/blob/master/my_mappings.txt) file.


## Go-Specific Snippets
Several helpful Go-specific snippets are included. These are described in the [my_snippets](https://github.com/diverdane/vimrc/blob/master/my_snippets.txt) file. These can be used to insert snippets, which are like templates of code blocks. For example, if the key sequence "errp<Tab>" is entered while in insert mode in a Go file, then a snippet of code is inserted which checks an error value and calls panic if there has been an error.


## How to Modify Mappings, Colors, Behavior, etc.
If you'd like to make changes to key mappings, colorschemes, or any behavior, you can modify or append to the **~/.vim_runtime/my_configs.vim** file. You can also install your own plugins by cloning the plugins to the **~/.vim_runtime/sources_non_forked directory (pathogen will automatically detect and install the new plugins.


## Navigating in the NERDTree Directory Tree Window:
The <F2> function key can be used to toggle the NERDTree directory tree window open/closed. (The NERDTree window can also be opened to a tree for the current file by entering ",T" while editing the file.) Please see the [NERDTree documentation](https://github.com/scrooloose/nerdtree#the-nerd-tree) for information on navigating in the NERDTree window.


## Navigating in the Tagbar
The <F8> function key can be used to toggle the Tagbar window open/closed. For more information on navigating/using the tagbar window, see the [Tagbar documentation](https://github.com/majutsushi/tagbar#tagbar-a-class-outline-viewer-for-vim).


## Other Mappings and Navigation Tips
Please see the [vimrc documentation](https://github.com/amix/vimrc#the-ultimate-vimrc) for more information on using the various plugins included with Ultimate vimrc.


## How to uninstall
Do the following:
* Remove `~/.vim_runtime`
* Remove any lines that refernce `.vim_runtime` in your `~/.vimrc`

