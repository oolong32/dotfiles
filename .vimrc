" vim:fdm=marker
set encoding=utf-8
set fileencoding=utf-8
"
" 256 color mode
" may be redundant as terminal is set to 256 colors
" seems not to have any negative impact.
set t_Co=256
syntax on
set number

call pathogen#infect()

" Handling of Filetypes, Indentation etc. {{{

if has("autocmd")
  " Enable file type detection
  filetype on
  
  " prevent autocommands being rewritten at every sourcing of vimrc
  augroup myAutocommands
    autocmd!

    " Source .vimrc after saving
    autocmd bufwritepost .vimrc source $MYVIMRC

    " Automatically save & restore folds when closing/opening a file.
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview 

    " Detect .md as Markown (instead of Modula-2)
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown

    " Cleaning Tabs/Spaces:
    " http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    
    " Customisations based on house-style (arbitrary).
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType php setlocal ts=4 sts=2 sw=2 expandtab
    autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab
    " Settings für python in .vim/indent/ und im .vim/ftplugin/
    " See http://henry.precheur.org/vim/python

    " highlight syntax when changing filetype
    autocmd FileType * :syntax enable 

  augroup END

endif

" somewhat redundant (see Line 14), should clean this up
" on the other hand there seem to be plugins eg. pyflakes, which need this.
filetype plugin indent on

" }}}

" Syntastic Configuration {{{

" configure syntastic
" on by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': ['javascript','html'] }

" use flake8 for python
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'

" Use jshint (uses ~/.jshintrc)
" bis zum 27.3.
" let g:syntastic_javascript_checkers = ['jshint']
" ab 27.3. probieren wir mal eslint
let g:syntastic_javascript_checkers = ['eslint']

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" }}}

" You Complete Me {{{
" Close preview window after selection
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" }}}

" Tern settings {{{
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
" }}}

" Colors & Colorschemes {{{

" not sure about the following lines. needs some experiments.
" solarized as default colorscheme
"
" Disabled background setting, because It's a pain to change it when  working  with the  Solarized Light theme
" set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=16
" No degradation neccessary, as the Terminal is set to Solarized.
" Looks horrible in MacVim if enabled.
" let g:solarized_degrade=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
colorscheme solarized
call togglebg#map("<F5>") 

" }}}

" Custom Key Mappings {{{

" Map Leader to Comma
let mapleader = ","

" Map Tilde to Paragraph
nmap § ~

" Swiss Keyboard Layout
" Map [ and ] to ö and ä
nmap ö [
nmap ä ]
omap ö [
omap ä ]
xmap ö [
xmap ä ]

" Swiss Keyboard Layout
" Map { and } to é and à
nmap é {
nmap à }
omap é {
omap à }
xmap é {
xmap à }

" Swiss Keyboard Layout
" <C-]> just doesn't work on this godforsaken Keyboard
" nmap <Leader>ä <C-]>
nmap <Leader>ä <C-]>

" Move between Windows (instead of ctrl + w  hjkl)
" Commented out, because of limited use
" UltiSnips uses <c-j> and <c-a> in insert mode, so it could coexist
" theoretically. But still.
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l 
 
" .less to css, needs vim-less bundle
nmap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" map jk to <ESC>
imap jk <ESC>
vmap jk <ESC>

" show/hide invisibles
" http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" remap to center view on movements
" Comment this out, in order to learn Vim's default behaviour
" nmap G Gzz
" nmap n nzz
" nmap N Nzz
" nmap } }zz
" nmap { {zz

" autocomplete brackets etc. 
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>< <><ESC>i

" get out of automatched brackets etc.
:inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

" djangoHTML templatetags
imap <leader>t {%  %}<ESC>hhi

" add empty Line without going into insert mode
nmap <leader>o o<ESC>k
nmap <leader>O O<ESC>j

" unmap arrow keys in normal mode, because you need DISCIPLINE
no <right> <Nop>
no <left> <Nop>
no <up> <Nop>
no <down> <Nop>

" unmap arrow keys in insert mode
ino <right> <Nop>
ino <left> <Nop>
ino <up> <Nop>
ino <down> <Nop>

" unmap arrow keys in visual mode
vno <right> <Nop>
vno <left> <Nop>
vno <up> <Nop>
vno <down> <Nop>

" open .vimrc
nmap <leader>v :vsplit $MYVIMRC<CR>

" 
iabbr jsoef josef

" change filetype to djangohtml, for jinja/nunjucks themes
nmap <leader>d :set filetype=htmldjango<CR>

" }}}

" UltiSnips {{{

let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsListSnippets="<leader>u"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" New Snippet Helper, note trailing space at end
imap <leader>s snippet<CR>endsnippet<ESC>kA 
" }}}

" Move Emmet Trigger to ctrl-f {{{
let g:user_emmet_leader_key='<C-F>'
" Note to myself: hit ctrl-f then comma. Quickly.
" }}}
