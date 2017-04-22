PHP Refactoring Support for VIM
===============================

PHP Refactoring support for VIM using [php-refactorings-browser https://github.com/QafooLabs/php-refactoring-browser]

Installation
------------

### Using Vundle
Add `Bundle 'vim-php/vim-php-refactoring'` to your `.vimrc` file and then:
* either run `:BundleInstall` within vim
* or run `vim +BundleInstall +qall` from your shell

### Configuring

You also need to Download `refactor.phar` from
https://github.com/QafooLabs/php-refactoring-browser and add

`let g:php_refactor_command='php /path/to/refactor.phar'`

to your `.vimrc` file.

Usage
-----

When inside a PHP file the following mappings work

### EXTRACT METHOD
Go into visual mode and select the code you want to extract to a new
method the press `<Leader>rem`

You will be prompted for the name of the new method.

If you want to bypass the menu:

    vnoremap <leader>em :call PhpRefactorExtractMethodDirectly()<cr>

### RENAME LOCAL VARIABLE
In normal mode move the cursor so it's inside the name of the variable
which you want to rename. Press `<Leader>rlv`

You will be prompted for the new name of the variable.

### LOCAL VARIABLE TO INSTANCE VARIABLE
In normal mode move the cursor so it's inside the name of the variable
which you want to rename. Press `<Leader>rli`

### OPTIMIZE USE
Simple press `<Leader>rou` to run the optimize use refactoring.
