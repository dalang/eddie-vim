" Customized by Dalang
" http://dalang.im
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
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ["snipmate"]
"call pathogen#runtime_append_all_bundles()
call pathogen#incubate()
filetype plugin indent on
call pathogen#infect()
call pathogen#helptags()

" hit enter to cancel searched highlight
noremap <CR> :nohlsearch<CR>

" select ALL
map <C-A> ggVG

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
au BufNewFile,BufRead *.mk  set filetype=markdown
"augroup markdown
    "au!
    "au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
"augroup END

set history=1000
"let delimitMate_autoclose = 0
"let delimitMate_offByDefault = 1

set titleold=Terminal
imap <C-A> &#12288;&#12288;

let os = substitute(system('uname'), "\n", "", "")
if has("win32")
    autocmd WinEnter,FileType c,cpp,java        colorscheme desert
elseif os == "Darwin"
    autocmd WinEnter,FileType c,cpp,java        colorscheme slate
    map "+y :w !pbcopy<CR><CR>
    map "+p :r !pbpaste<CR><CR>

    " ctrl-x for cut
    vmap <C-x> :!pbcopy<cr>
    " ctrl-c for copy
    vmap <C-c> :w !pbcopy<cr><cr>
    " ctrl-v for paste
    "nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
    imap <C-v> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
elseif os == "Linux"
    autocmd WinEnter,FileType c,cpp,java        colorscheme torte
endif
" vimdiff shortcuts
map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>

" Goyo
nnoremap <silent> <leader>g :Goyo<cr>
function! g:goyo_before()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  colorscheme seoul256
endfunction

function! g:goyo_after()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  colorscheme rails_envy
endfunction

let g:goyo_callbacks = [function('g:goyo_before'), function('g:goyo_after')]


"not use vimwiki syntax in markdown file, only for .wiki file
let g:vimwiki_ext2syntax = {'.wiki': 'media'}
"needed when using rbenv
set shell=bash\ -i
