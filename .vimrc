scriptencoding utf-8

set nocompatible                           " be iMproved, required
set langmenu=none
filetype off

call plug#begin('~/.vim/plugged')
Plug 'sarrow104/util.vim' " util#MySys()
Plug 'sarrow104/msg.vim'  " msg#xxx()
Plug 'sarrow104/system.vim'
Plug 'sarrow104/pairpunct.vim'
Plug 'sarrow104/font.vim'
Plug 'sarrow104/index.vim' " :CopyEntry
Plug 'dimasg/vim-mark'
Plug 'vim-scripts/mru.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox' " https://github.com/
Plug 'tomasr/molokai' " https://github.com/tomasr/molokai
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'jsfaint/gen_tags.vim' " https://github.com/jsfaint/gen_tags.vim
Plug 'aklt/plantuml-syntax' " https://github.com/aklt/plantuml-syntax
Plug 'jlanzarotta/bufexplorer'
Plug 'joker1007/vim-markdown-quote-syntax' " https://github.com/joker1007/vim-markdown-quote-syntax
Plug 'tpope/vim-markdown' " https://github.com/tpope/vim-markdown
"Plug 'valloric/MatchTagAlways'
Plug 'andymass/vim-matchup' " https://github.com/andymass/vim-matchup
Plug 'myusuf3/numbers.vim' " https://github.com/myusuf3/numbers.vim
Plug 'tpope/vim-speeddating' " https://github.com/tpope/vim-speeddating.git

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter' " `di,` change parameter part of a function

Plug 'lvht/tagbar-markdown' " generate outline for markdown; need e-ctags

" NOTE: 这是备份自
" https://github.com/lilydjwg/dotvim/blob/master/plugin/escalt.vim
Plug 'WinterXMQ/escalt.vim' " https://github.com/WinterXMQ/escalt.vim

" needed by vim-session
"Plug 'xolox/vim-misc'
"" 支持 NERDTree 恢复的session管理工具
"Plug 'xolox/vim-session'

Plug 'junegunn/vim-easy-align'
Plug 'jreybert/vim-largefile' " https://github.com/jreybert/vim-largefile
Plug 'will133/vim-dirdiff'    " 目录比较工具

" NOTE: svn 常用命令映射——终端输出字符集需要跳转；是否可参考，sqldbext调整？
Plug 'juneedahamed/svnj.vim' " https://github.com/juneedahamed/svnj.vim

Plug 'OrangeT/vim-csharp' " https://github.com/OrangeT/vim-csharp

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim' " https://github.com/dyng/ctrlsf.vim | Search tool; using ack, ag or pt
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
call plug#end()

filetype plugin indent on    " required

if !has('gui_running')
    vnoremap y "+y
endif

if has('gui_running')
    if has("win32")
        au GUIEnter * simalt ~x
        noremap <M-Space> :simalt ~<CR>
        inoremap <M-Space> <C-o>:simalt ~<CR>
        cnoremap <M-Space> <C-c>:simalt ~<CR>
    endif
endif

let mapleader = ","

set number
set relativenumber
set encoding=utf8
set sessionoptions+=curdir
set winaltkeys=no
set whichwrap+=<,>,h,l                  " 跨行首尾，移动光标
set fillchars=vert:\ ,stl:\ ,stlnc:\
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:~\")})%)%(\ %a%)\ -\ %{v:servername}\ %{v:this_session!=\"\"?fnamemodify(v:this_session,\":p:~\"):\"\"}
set background=dark
set autoindent                          " Auto-indent on
set tabpagemax=15                       " 最多15个标签
set showtabline=1                       " 0: noshow tab line; 1: show when 2 or more tabs; 2: always
set hlsearch                            " High-Light Search on
set noswapfile                          " No swap file, use memory only
set display=lastline
" Show @@@ in the last line if it is truncated.
"set display=truncate
set wildmode=longest,full               " Cmd-line completion
set nostartofline                       " Keep cursor column when moving
set showcmd                             " display incomplete commands
set cmdheight=1                         " lines for command window
set laststatus=2                        " Always show status line
set nofoldenable
" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

set backspace=indent,eol,start          " Backspace over everyting
set autoread                 " 自动重新加载外部修改内容
set noerrorbells                " 去掉恼人的蜂鸣声
set novisualbell t_vb=
set hidden                      " allow to cycle and hide modified buffers
set diffopt=filler,context:5,iwhite
set report=0                    " show a report when N lines were changed.
set suffixes=.bak,~,.swp,.o ",.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.cmi,.cmo
set ambiwidth=double
if !has('job')
    set lazyredraw                  " [VIM5];  do not update screen while executing macros
endif
set wildmenu
set fileencodings=ucs-bom,utf-8,gb18030
highlight LineNr    guifg=#008f00 gui=bold guibg=#222222
if v:version >= 703
    set undodir=~/.vimundo

    set undofile
    if !isdirectory(&undodir)   " create undodir, if it is not exist
        call mkdir(&undodir)
    endif

    "command -nargs=0   ClearVimundoFiles       call undofile#remove_invalid_undofile()
endif
let $LANG='en_US'                       " United Stats English

set history=200         " keep 200 lines of command line history
set ruler               " show the cursor position all the time

set ttimeout            " time out for key codes
set ttimeoutlen=100     " wait up to 100ms after Esc for special key

set tabstop=4
set shiftwidth=4
let g:plugin_dir = $HOME.'/.vim/'

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=0

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
  set guioptions-=L
  set guioptions-=r
  set guioptions-=T
endif

set nobackup                            " No backups
set nowritebackup

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif
set shortmess+=c
set updatetime=300

set list
set listchars=tab:>.,trail:-,extends:\#,nbsp:.

"" Key Map
map <C-Left>    <ESC>:bprevious<CR>
map <C-Right>   <ESC>:bnext<CR>

if has('gui_running')
    nnoremap <A-h>      :bprevious<CR>
    nnoremap <A-l>      :bnext<CR>
else
    " NOTE: 因为终端下，Alt-Esc不分的情况，会导致这种短快捷键，会误判。
    nnoremap <leader>bh :bprevious<CR>
    nnoremap <leader>bl :bnext<CR>
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

let g:strftime_format=
            \ '%Y'.'-'.
            \ '%m'.'-'.
            \ '%d'.''

"let g:strftime_format=
"           \ '%Y'.iconv('年', g:system_encoding, 'utf8').
"           \ '%m'.iconv('月', g:system_encoding, 'utf8').
"           \ '%d'.iconv('日', g:system_encoding, 'utf8')

nnoremap <silent> <F2>  "=strftime(g:strftime_format)<CR>p
inoremap <silent> <F2> <C-R>=strftime(g:strftime_format)<CR>

nnoremap <silent> <A-F2>  "=strftime('%H:%M:%S')<CR>p
inoremap <silent> <A-F2> <C-R>=strftime('%H:%M:%S')<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" Paste!
if has('gui_running')
    " highlighting selected mode, cut and paste
    vnoremap <S-CR> "+p
    " Normal-command mode, append and paste
    nnoremap <S-CR> "+p
    " Insert-mode, paste directly
    inoremap <S-CR> <C-R>+
    " Command-line mode, paste directly
    cnoremap <S-CR> <C-R>+
else
    " NOTE: 在终端下，我无法正常隐射到<S-CR>或者<M-CR>，<A-CR>……
    vnoremap v "+p
    nnoremap v "+p
    inoremap v <C-R>+
    cnoremap v <C-R>+
endif

function! s:SetTextTitle(val)
    if type(a:val) != type(0) || a:val <= 0
        return
    endif
    let line = getline(".")
    if !strlen(line)
        return
    endif
    let line = matchstr(line, '^\%(#\+\s\+\)\=\zs.\+$')

    let line = matchstr(line, '^\%(\s\|　\)*\zs.\+$')
    
    let line = repeat('#', a:val).' '.line
    call setline(".", line)
endfunction

function! s:GetTitleLeval(line)
    return strlen(matchstr(a:line, '^#\+\%(\ \)\@='))
endfunction

function! s:TextAutoTitle()     " Auto detect titel level, and mark it! {{{1
    let level = 0
    if line(".") == 1
        let level = 1
    else
        let line = getline(".")
        let line = matchstr(line, '^\%(#\+\s\+\)\=\zs.\+$')
        let line = substitute(line, '　', ' ', 'ge')
        let line = substitute(line, '\u160', ' ', 'ge') " \u160 -> \u32
        let line = matchstr(line, '^\s*\zs.\+$')
        let line = matchstr(line, '^\zs.\{-}\ze\s*$')
        if !strlen(line)
            return
        end

        let line = '.'.line
        while line =~ '^\.\d\+'
            let level = level + 1
            let line = matchstr(line, '^\.\d\+\zs.\+$')
        endwhile
        let level = (level == 0 ? 2 : level + 1)
    endif
    call <SID>SetTextTitle(level)
endfunction

function! s:TextTitleInc() "Increase Current Chapter Title Level by ONE {{{1
    let level = s:GetTitleLeval(getline("."))
    if level < 6
        let level = level + 1
    endif
    call <SID>SetTextTitle(level)
endfunction

function! s:TextTitleDec() "Decrease Current Chapter Title Level by ONE {{{1
    let level = s:GetTitleLeval(getline("."))
    if level > 0
        let level = level - 1
    endif
    call <SID>SetTextTitle(level)
endfunction

function! s:AddLink()
    " TODO a -> [a](url)
    let _link_ = @+
    if _link_ =~ '^\%(http\%(s\)\?\|ftp\)://'
        call pairpunct#Quote_this_block('[',']('._link_.')','[]')
    else
        call pairpunct#Quote_this_block('[',']('._link_.')','[]')
    endif
endfunction

function! s:MdPasteLink_Func()
    " let l:url = @+
    let l:url = substitute(@+, '[|:]\d\+$', '', 'g')
    let l:name = fnamemodify(l:url, ":t:r")
    let l:relative = '/' . fnamemodify(l:url, ":.")
    let l:relative = substitute(l:relative, "\\", '/', 'g')
    call setline('.', getline('.') . '[' . l:name . '](' . l:relative . ')')
endfunction

function! s:Md_wrap(prefix, suffix, newline)
    " push state
    let _tw_=&tw
    let &tw=0
    let _tmp_a_=@a
    normal gv"ay

    if a:newline != 0
        execute "silent normal! `>a\<CR>\<C-u>\<C-R>=a:suffix\<CR>\<ESC>"
        execute "silent normal! `<i\<CR>\<C-u>\<C-R>=a:prefix\<CR>\<CR>\<ESC>"
    else
        execute "silent normal! `>a\<C-R>=a:suffix\<CR>\<ESC>"
        execute "silent normal! `<i\<C-R>=a:prefix\<CR>\<ESC>"
    endif

    " pop state
    let @a=_tmp_a_
    let &tw=_tw_
endfunction

function! s:MarkdownMaps()
    nnoremap <buffer> <A-s>1 o<ESC>70i-<ESC>o<ESC>
    nnoremap <buffer> <A-s>2 o<ESC>70i=<ESC>o<ESC>
    vnoremap <buffer> <A-s>1 c<CR><C-o>70i-<ESC>o<ESC>
    vnoremap <buffer> <A-s>2 c<CR><C-o>70i=<ESC>o<ESC>

    inoremap <buffer> <A-s>1 <CR><C-o>70i-<ESC>o
    inoremap <buffer> <A-s>2 <CR><C-o>70i=<ESC>o

    nnoremap <buffer> tt :call <SID>TextAutoTitle()<CR>

    nnoremap <buffer> t1 :call <SID>SetTextTitle(1)<CR>
    nnoremap <buffer> t2 :call <SID>SetTextTitle(2)<CR>
    nnoremap <buffer> t3 :call <SID>SetTextTitle(3)<CR>
    nnoremap <buffer> t4 :call <SID>SetTextTitle(4)<CR>
    nnoremap <buffer> t5 :call <SID>SetTextTitle(5)<CR>
    nnoremap <buffer> t6 :call <SID>SetTextTitle(6)<CR>

    nnoremap <buffer> t+ :call <SID>TextTitleInc()<CR>
    nnoremap <buffer> t- :call <SID>TextTitleDec()<CR>

    nnoremap <buffer> `` viw:call pairpunct#Quote_this_block('`','`','`')<CR>
    vnoremap <buffer> `` :call pairpunct#Quote_this_block('`','`','`')<CR>

    nnoremap <buffer> <leader>st viw:call pairpunct#Quote_this_block('__','__','_')<CR>
    vnoremap <buffer> <leader>st :call pairpunct#Quote_this_block('__','__','_')<CR>

    nnoremap <buffer> <leader>em viw:call pairpunct#Quote_this_block('_','_','_')<CR>
    vnoremap <buffer> <leader>em :call pairpunct#Quote_this_block('_','_','_')<CR>

    nnoremap <buffer> <leader>aa viw:call <SID>AddLink()<CR>
    vnoremap <buffer> <leader>aa :call <SID>AddLink()<CR>

    vnoremap <buffer> !!  <ESC>:call <SID>Md_wrap('[', ']('.@+.')', 0)<CR>
    vnoremap <buffer> **  <ESC>:call <SID>Md_wrap('**', '**', 0)<CR>
    vnoremap <buffer> _   <ESC>:call <SID>Md_wrap('_', '_', 0)<CR>

    inoremap <buffer> ``` <ESC>:call setline(line('.'), ' ')<CR>v<ESC>:call <SID>Md_wrap('```', '```', 1)<CR>ddkA

    command! -buffer MdPasteLink call s:MdPasteLink_Func()
endfunction

" FileType: markdown {{{2
" NOTE: `iskeyword` affect /\w/ search result
autocmd FileType markdown
            \ call pairpunct#PairAdd_chinese_style()|
            \ call s:MarkdownMaps()|
            \ setlocal iskeyword-=`

inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>

inoremap <A-o> <C-o>o
inoremap <A-O> <C-o>O
nnoremap <A-o> :put=''<CR>
nnoremap <A-O> :-1put=''<CR>

inoremap <A-a> <C-o>A
inoremap <A-i> <C-o>I

inoremap <A-f> <C-o>f
inoremap <A-F> <C-o>F

inoremap <A-w> <C-o>w
inoremap <A-b> <C-o>b
inoremap <A-e> <C-o>e<right>

inoremap <A-u> <C-o>u
inoremap <A-r> <C-o><C-r>

inoremap <A-n> <C-o>o

inoremap <C-l> <Del>

"noremap <A-h> h
noremap <A-j> gj
noremap <A-k> gk

noremap <A-w> viw
noremap <A-c> ciw

vnoremap <A-y> "+y
nnoremap <A-y> m"viw"+y`"

" Move lines in visual-mode only
xnoremap <C-j> :move '>+1<CR>gv
xnoremap <C-k> :move '<-2<CR>gv

" Move lines
nnoremap <C-Down> 	:<C-u>move .+1<CR>
nnoremap <C-Up> 	:<C-u>move .-2<CR>
inoremap <C-Down> 	<C-o>:<C-u>move .+1<CR>
inoremap <C-Up> 	<C-o>:<C-u>move .-2<CR>
vnoremap <C-Down> 	:move '>+1<CR>gv
vnoremap <C-Up> 	:move '<-2<CR>gv

noremap <M-1> :tabprevious<CR>
noremap <M-2> :tabnext<CR>

nnoremap <M-S-T>                :tabnew<CR>

"For editing on the command-line: >
" start of line
cnoremap <C-A>          <Home>
" back one character
cnoremap <C-B>          <Left>
" delete character under cursor
cnoremap <C-l>          <Del>
" end of line
cnoremap <C-E>          <End>
" forward one character
"cnoremap <C-F>         <Right>
" recall newer command-line
cnoremap <C-N>          <Down>
" recall previous (older) command-line
"cnoremap <C-P>         <Up>
" back one word
"cnoremap <Esc><C-B>    <S-Left>
" forward one word
"cnoremap <Esc><C-F>    <S-Right>

nnoremap gF <C-w>gf
vnoremap gF <C-w>gf

if globpath(&rtp, 'plugin/NERD_tree.vim') != ""
    nnoremap <C-q>                  :NERDTreeFind<CR>
    nnoremap <Leader>e              :NERDTree<CR>
endif

if globpath(&rtp, 'plugin/coc.vim') != ""
    " popup
    nmap <leader>tt <Plug>(coc-translator-p)
    vmap <leader>tt <Plug>(coc-translator-pv)
    " echo
    nmap <leader>te <Plug>(coc-translator-e)
    vmap <leader>te <Plug>(coc-translator-ev)
    " replace
    nmap <leader>tr <Plug>(coc-translator-r)
    vmap <leader>tr <Plug>(coc-translator-rv)

    nmap <leader>fr <Plug>(coc-refactor)

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
        nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
        inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
        vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    "inoremap <silent><expr> <TAB>
    "            \ pumvisible() ? "\<C-n>" :
    "            \ <SID>check_back_space() ? "\<TAB>" :
    "            \ coc#refresh()
    "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    "function! s:check_back_space() abort
    "    let col = col('.') - 1
    "    return !col || getline('.')[col - 1] =~# '\s'
    "endfunction

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    "inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    "This expression seems to be responsible for coc formatting on enter
    inoremap <silent><expr> <cr> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    "I this just says autocomplete with the first option if pop up menu is open.
    "If it is not open, just do a regular tab.
    inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"

    " Use <c-o> to trigger completion manually
    if has('nvim')
        inoremap <silent><expr> <c-o> coc#refresh()
    else
        inoremap <silent><expr> <c-o> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    nmap <silent> go <Plug>(coc-diagnostic-info)


    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
        else
            execute '!' . &keywordprg . " " . expand('<cword>')
        endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')


    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)


    " Formatting selected code.
    xmap <leader>fo  <Plug>(coc-format-selected)
    nmap <leader>fo  <Plug>(coc-format-selected)

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    " Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
    nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold   :call CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <leader>la  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <leader>le  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <leader>lc  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <leader>lo  :<C-u>CocList outline<cr>
    " Search workspace symbols. fuzzy, search
    nnoremap <silent><nowait> <leader>ls  :<C-u>CocList -I symbols<cr>
    " Search workspace symbols. fuzzy, search; default under cursor symbol
    nnoremap <silent><nowait> <leader>lu  :<C-u>execute("CocList --input=" . expand("<cword>") . " -I symbols")<cr>

    nnoremap <silent><nowait> <C-m> :<C-u>CocList mru<cr>
    " nnoremap <silent><nowait> <C-p> :<C-u>CocList files<cr>

    " Do default action for next item.
    nnoremap <silent><nowait> <leader>lj  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <leader>lk  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <leader>lp  :<C-u>CocListResume<CR>

    " Auto organize imports statement when saving *.go files
    autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

    " https://github.com/neoclide/coc-snippets/issues/179
    " coc-whitlist
    "autocmd BufNew,BufEnter *.json,*.vim,*.lua execute "silent! CocEnable"
    "autocmd BufLeave *.json,*.vim,*.lua execute "silent! CocDisable"

    " Another way to supply coc-blacklist
    autocmd FileType text let b:coc_enabled = 0
    autocmd FileType json let b:coc_enabled = 0

    command! -bar -bang -nargs=0 SS :CocCommand session.save
    command! -bar -bang -nargs=0 OS :CocCommand session.load

endif " endof Coc settings

if globpath(&rtp, 'plugin/go.vim') != ""
    "let g:go_disable_autoinstall = 0

    " NOTE
    " trackback:https://github.com/theniceboy/nvim/blob/master/init.vim
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
    let g:go_gopls_enabled = 1

    " NOTE new version go-fmt(after 2014), donot support -tabs flag
    " anyore! one cannot use `-tabs=false`
    "let g:go_fmt_options = {
    "            \ 'gofmt': '-s -tabs=false '
    "            \ }
    let g:go_fmt_fail_silently = 1
    "" \ 'goimports': '-local mycompany.com',

    let g:go_echo_go_info = 0
    let g:go_doc_popup_window = 1
    " disable gd mapping of vim-go
    let g:go_def_mapping_enabled = 0
    let g:go_template_autocreate = 0
    let g:go_textobj_enabled = 0
    " show type info in statusbar
    let g:go_auto_type_info = 1

    " Highlight more info
    let g:go_highlight_array_whitespace_error = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_chan_whitespace_error = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_format_strings = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_function_parameters = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_space_tab_error = 1
    let g:go_highlight_string_spellcheck = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_trailing_whitespace_error = 1
    let g:go_highlight_types = 1
    let g:go_highlight_variable_assignments = 0
    let g:go_highlight_variable_declarations = 0

    " highlight same variable in view
    let g:go_auto_sameids = 1
    let g:go_doc_keywordprg_enabled = 0

    "nmap <silent> gd :GoDef<CR>
endif

colorscheme molokai
let g:system_encoding='utf-8'

if globpath(&rtp, 'plugin/fzf.vim') != ""
    "command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
    "command! -bang ProjectFiles call fzf#vim#files('~/projects', <bang>0)
    command! -bang -nargs=? -complete=dir Files
                \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)
    "command! -bang -nargs=? -complete=dir Files
    "                   \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
    "command! -bang -nargs=? -complete=dir Files
    "                   \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
    "command! -bang -nargs=? -complete=dir Files
    "                   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
    "command! -bang -nargs=? -complete=dir Files
    "                   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    nnoremap <silent><nowait> <C-p> :<C-u>Files<cr>
endif

if globpath(&rtp, 'plugin/leaderf.vim') != ""
    nnoremap <silent><nowait> <C-p> :<C-u>Leaderf file<cr>
    " don't show the help in normal mode
    let g:Lf_HideHelp = 1
    let g:Lf_UseCache = 0
    let g:Lf_UseVersionControlTool = 0
    let g:Lf_IgnoreCurrentBufferName = 1
    " popup mode
    let g:Lf_WindowPosition = 'left'
    let g:Lf_PreviewInPopup = 1
    " let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
    let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

    let g:Lf_ShortcutF = "<leader>ff"
    noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
    noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
    noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
    noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

    "noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
    "noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
    "" search visually selected text literally
    "xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
    "noremap go :<C-U>Leaderf! rg --recall<CR>

    " should use `Leaderf gtags --update` first
    "let g:Lf_GtagsAutoGenerate = 0
    "let g:Lf_Gtagslabel = 'native-pygments'
    "noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
    "noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
    "noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
    "noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
    "noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
endif

if globpath(&rtp, 'plugin/tagbar.vim') != ""
    autocmd BufRead * nnoremap <C-l> :TagbarOpen fj<CR>
    " autocmd BufRead * if &ft!='text' | nnoremap <C-l> :TagbarOpen fj<CR> | endif
    let g:tagbar_systemenc = 'utf-8'
    " --input-encoding=encoding
    let g:tagbar_ctags_options = ['NONE', split(&rtp,",")[0].'/ctags.cnf']
    " This causes ctags to use settings from ~/.vim/ctags.cnf, ignoring other
    " configuration files.

    " g:tagbar_systemenc~
    " Default: value of 'encoding'
    " 
    " This variable is for cases where the character encoding of your operating
    " system is different from the one set in Vim, i.e. the 'encoding' option. For
    " example, if you use a Simplified Chinese Windows version that has a system
    " encoding of "cp936", and you have set 'encoding' to "utf-8", then you would
    " have to set this variable to "cp936".
    " Note that this requires Vim to be compiled with the |+multi_byte| and |+iconv|
    " features to work.
    " 
    " Example:
    " >
    "         let g:tagbar_systemenc = 'cp936'

    let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                \   'p:package',
                \   'i:imports:1',
                \   'c:constants',
                \   'v:variables',
                \   't:types',
                \   'n:interfaces',
                \   'w:fields',
                \   'e:embedded',
                \   'm:methods',
                \   'r:constructor',
                \   'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                \   't' : 'ctype',
                \   'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                \   'ctype' : 't',
                \   'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : '$GOROOT/bin/gotags',
                \ 'ctagsargs' : '-sort -silent'
                \ }

    let g:tagbar_type_markdown = {
                \   'ctagstype' : 'markdown',
                \   'kinds' : [
                \     'h:headings',
                \   ],
                \   'sort' : 0
                \ }
endif

if globpath(&rtp, 'plugin/matchup.vim') != ""
    let g:loaded_matchit = 1
endif

if globpath(&rtp, 'plugin/gen_tags.vim') != ""
    let g:gen_tags#gtags_default_map = 1
endif

if globpath(&rtp, 'plugin/airline.vim') != ""
        let g:airline_theme="badwolf"
        let g:airline_power_fonts=1
        let g:airline#extensions#tabline#enabled=1
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep='|'

        if !exists('g:airline_symbols')
                let g:airline_symbols={}
        endif
endif

if globpath(&rtp, 'plugin/ctrlsf.vim') != ""
    " NOTE: CtrlSF 作者设计原则是，尽量少添加后端特有的命令行参数特性。
    " 这里，我这个需求，可以通过 ag '\bword\b' 来实现——注意，单引号。
    " 这里，需要使用 -R参数。
    " 我那个，支持 -w 参数的修改，就可以扔了。
    noremap <leader>/ :silent execute("CtrlSF -R '\\b" . expand("<cword>") . "\\b'")<CR>
    " TODO 从commandline 读入参数，用来搜索；可参考NERDtree 的m，a指令；
    " noremap <leader>? :silent execute("CtrlSF -R '\\b" . expand("<cword>") . "\\b'")<CR>

    noremap <leader>? :silent execute("CtrlSF -R '\\b" . input("Keyword to search:") . "\\b'")<CR>
    noremap <leader>cg :CtrlSFToggle<CR>

    let g:ctrlsf_ackprg = 'ag'
    let g:ctrlsf_auto_close = 0
    let g:ctrlsf_backend = 'ag'
    let g:ctrlsf_search_mode = 'async'
    let g:ctrlsf_follow_symlinks = 1
endif

if globpath(&rtp, 'plugin/mark.vim') != ""
    nmap <unique> <Leader>m/ <Plug>MarkSearchAnyNext
    nmap <unique> <Leader>m? <Plug>MarkSearchAnyPrev
endif

if globpath(&rtp, 'plugin/session.vim') != ""
"    command! -bar -bang -nargs=? -complete=customlist,xolox#session#complete_names_with_suggestions
"                \ SS
"                \ call xolox#session#save_cmd(<q-args>, <q-bang>, 'SaveSession')
"    command! -bar -bang -nargs=? -complete=customlist,xolox#session#complete_names
"                \ OS
"                \ call xolox#session#open_cmd(<q-args>, <q-bang>, 'OpenSession')
    let g:session_autoload = 'no'
endif

autocmd FileType vim
            \ set ts=8 sw=4 expandtab nu rnu|
            \ call pairpunct#PairAdd_english_style()

autocmd FileType go
            \ if !exists('b:go_style_loaded')                   |
            \ let g:load_doxygen_syntax=1                       |
            \ setlocal cindent cinoptions=:0,g0,t0,(4,W8        |
            \ setlocal fo+=mM ts=4 sw=4 et fdm=marker           |
            \ setlocal foldlevel=1 foldmethod=syntax foldlevelstart=1 |
            \ setlocal dictionary+=~/.vim/keywords/go.txt       |
            \ call pairpunct#Bind_punct_complete()              |
            \ call pairpunct#PairAdd_english_style()            |
            \ let b:go_style_loaded=1                           |
            \ endif

autocmd FileType proto
            \ set ts=4 sw=4 expandtab nu rnu|
            \ call pairpunct#PairAdd_english_style()

function! Message_Debug(fname, sil)

    let l:s = ""
    redir => l:s
    silent messages
    redir END

    if a:sil != 0
        new
        set buftype=nofile
        put=l:s
    endif

    call writefile([l:s], a:fname, "b")
endfunction

function! Message_Debug_clipboard()

    let l:s = ""
    redir => l:s
    silent messages
    redir END

    let @+=l:s
endfunction

function! OnVimLeave() 
    call Message_Debug("e:/onVimLeave.log", 0)
endfunction

function! OnVimLeavePre() 
    call Message_Debug("e:/onVimLeavePre.log", 0)
endfunction

command -nargs=0        MessageDebug    call Message_Debug_clipboard()

" 返回符合 pattern 的内容的集合——利用系统剪贴板传递数据——以及出现的次数
" TODO 把下面的功能，做成一个插件的形式。
" 注意，还需要提供补全——把每次 pattern 都用外部文件记录下来——相同的，只保
" 留一个，再一并提供给用户补全
function! g:CollectMatch(line1, line2, pattern)
    " FIXME
    " 有点小问题：当查找的串只有一个字母时，将出现死循环——因为光标没有移动的
    " 问题；需要在每次找到匹配后，后移一次光标。
    " 这个 "后移一次" 也是个麻烦——normal l的话，在行末，光标不会移动。用
    " normal w的话，又可能错过数据。Orz。
    " NOTE:
    " 使用%s//\=Function_of_collect/ge
    " 上面的这种方法肯定能行——缺点——就算你实际没有让subs前后的buffer内容有
    " 什么不同，但是vim也会认为做了修改！
    " 另外一个变通的仿佛就是使用
    " /
    " 来 search。
    let _current_line_ = line(".")
    let _ret_ = {}
    let _reg_q_ = getreg('"')
    call setreg('+', '')
    "let @+ = ''
    let _v_str_ = []
    execute a:line1
    while search(a:pattern, 'cW', a:line2) > 0
        normal ma
        call search(a:pattern, 'cWe', a:line2)
        normal mb
        normal `av`by
        let _key_ = @"
        if !has_key(_ret_, _key_)
            let _ret_[_key_] = 1
            call add(_v_str_, _key_)
        else
            let _ret_[_key_] += 1
        endif
        normal `b
    endwhile

    for key in _v_str_
        let @+ .= string(_ret_[key]) . "\t" . key . "\n"
    endfor
    "for key in sort(keys(_ret_))
    "    let @+ .= string(_ret_[key]) . "\t" . key . "\n"
    "endfor
    echom 'collected '.len(_v_str_).' item(s).'
    call setreg('"', _reg_q_)
    execute _current_line_
endfunction

function! s:DirName(path)	"{{{2
    return fnamemodify(a:path, ':p:h')
endfunction

function! s:BaseName(path)	"{{{2
    return fnamemodify(a:path, ':t')
endfunction

function! s:ForceWrite(path)	"{{{2
    let prev_stems = s:DirName(a:path)
    if s:CreatePath(prev_stems) == 0
	call msg#ErrorMsg('cannot mkdir `'.prev_stems.'`')
	call msg#ErrorMsg('cannot write to file: `'.a:path.'`')
	return 0
    endif
    execute 'w! '.a:path
endfunction

function! s:ForceSave(path)	"{{{2
    let prev_stems = s:DirName(a:path)
    if s:CreatePath(prev_stems) == 0
	call msg#ErrorMsg('cannot mkdir `'.prev_stems.'`')
	call msg#ErrorMsg('cannot write to file: `'.a:path.'`')
	return 0
    endif
    execute 'sav! '.a:path
endfunction

function! s:CreatePath(path)	"{{{2
    if !isdirectory(a:path)
	if s:CreatePath(s:DirName(a:path)) == 0
	    return 0
	endif
	echomsg 'mkdir '.a:path
	let dir_to_make = system#ToTermEnc(a:path)
	if mkdir(dir_to_make) ==  0
	    return 0
	endif
    endif
    return 1
endfunction

command -nargs=1 -complete=file Sav	call s:ForceSave(<q-args>)
command -nargs=1 -complete=file Write	call s:ForceWrite(<q-args>)

function! s:EditAndJump(path, new) " {{{2
    let l:num = -1
    let l:path = a:path

    if !filereadable(l:path)
        let l:matched = matchlist(a:path,  '^\(.\{-}\)\%(|\|:\)\(\d\+\)$')
        if !empty(l:matched) && len(l:matched[2]) > 0
            let l:num = l:matched[2]
            let l:path = l:matched[1]
        endif
    endif

    " NOTE: no need to check filereadable()!
    "if !filereadable(l:path)
    "    echohl WarningMsg
    "    echo "file \"" . l:path . "\" not readable"
    "    echohl NONE
    "    return
    "endif
    if a:new != 0
        silent execute "new "  . l:path
    else
        silent execute "edit " . l:path
    endif
    if l:num > 0 && filereadable(l:path)
        silent execute l:num
    endif
endfunction

command -nargs=1 -complete=file Edit	call s:EditAndJump(<q-args>, 0)
command -nargs=1 -complete=file New	call s:EditAndJump(<q-args>, 1)

" TODO
"command! -nargs=? -range=% -complete=custom,CollectPreDefined Collect  call g:CollectMatch(<line1>, <line2>, <q-args>)
command! -nargs=? -range=% Collect      call g:CollectMatch(<line1>, <line2>, <q-args>)

" Before exiting Vim, just after writing the .viminfo file
autocmd VimLeave    call s:OnVimLeave()
" Before exiting Vim, just before writing the .viminfo file
autocmd VimLeavePre call s:OnVimLeavePre()

" Return to the last edit position!
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "norm '\"" | else | exe "norm $"|endif

filetype indent on
filetype plugin on
syntax on

