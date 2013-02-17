" Customized by Dalang
" http://dalang.tk
" donGuoxing@gmail.com
" --------------------------------------------------------------------
" My currently working version Vimrc
" I kept all other settings in plugins/settings directory
"
" Eddie Kao
" http://blog.eddie.com.tw
" eddie@digik.com.tw

runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
call pathogen#infect()
call pathogen#helptags()

" hit enter to cancel searched highlight
noremap <CR> :nohlsearch<CR>

" select ALL
map <C-A> ggVG

" ******** the following is added by dalang ********
" modify tab to 4 space
set expandtab
set tabstop=4

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %
command -nargs=? Sudow :w !sudo tee %

" Set vim to remember the latest position
autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
			\	exe "normal g'\"" |
			\ endif
" set *.md to Markdown filetype
au BufNewFile,BufRead *.md  set filetype=markdown

set history=1000
" let delimitMate_autoclose = 0
let delimitMate_offByDefault = 1
set titleold=Terminal
set mouse=a
imap <C-A> &#12288;&#12288;<CR>
