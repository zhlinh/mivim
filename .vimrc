"                                    .
"                    ##############.....   #############
"                    ##############....... #############
"                      ##########..........###########
"                      ##########........###########
"                      ##########.......##########
"                      ##########.....##########..
"                     .##########....##########.....
"                   ...##########..##########.........
"                 .....##########.#########.............
"                   ...################GGG............
"                    . ################.............
"                      ##############.GGG...GGGGGGGGGG
"                      ############...GG...GG..GG  GG
"                      ##########....GG...GG..GG  GG
"                      ########.....GGG..GGG GGG GGG
"                      ######    .........
"                                  .....
"                                    .
"
"
"
"                    zhlinh Linux&Windows GVim config file
"
"                                2015.4.25
"
"               <<< "Be the change you want to see the world">>>
"
" Author:  zhlinh
" Version: 0.7.17
" Email: zhlinhng@gmail.com"
" Create_time: 2015-06-08
" Last_modify: 2015-07-17
" Sections:
"     ->System Identification
"     ->Initial Plugins
"     ->General Settings
"     ->Show:User Interface settings
"     ->File encode:encode for varied filetype
"     ->Others
"     ->Hot Key:Customized keys
"     ->FileType Settings
"     ->Color&Theme
"==========================================


" ========================================
" System Identification
" ========================================

" -----------------------
"  < Windows or Linux >
" -----------------------
let g:isWindows = 0
let g:isLinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:isWindows = 1
else
    let g:isLinux = 1
endif

" -----------------------
"  <  vim or Gvim >
" -----------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"==========================================
" Initial Plugin 加载插件
"==========================================

" Must be the first line.
" Do not compatible with VI
set nocompatible

if !g:isWindows
    set shell=/bin/sh
else
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    set rtp+=~/.vim/
endif

" 修改leader键,因插件中会用到，所以把这句放前面
let mapleader = ','
let g:mapleader = ','

" 开启语法高亮
syntax enable
syntax on

"detect filetype
filetype on
"differet indentation for differet filetype
" 针对不同的文件类型采用不同的缩进格式
filetype indent on

" install Vundle bundles,插件配置和具体设置在vimrc.bundles中
if filereadable(expand("~/.vimrc.bundles"))
      source ~/.vimrc.bundles
endif

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin on
filetype plugin indent on


"==========================================
" General Settings
"==========================================

"===[Miscellaneous features (mainly options)]===
set title           " Show filename in titlebar of window
set titleold=
" set nomore        " Don't page long listings
set autowrite       " Save buffer automatically when changing files
set autoread        " Always reload buffer when external changes detected

"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 500 files
"           | |    +--Remember up to 10000 lines in each register
"           | |    |      +--Remember up to 1MB in each register
"           | |    |      |     +--Remember last 1000 search patterns
"           | |    |      |     |     +---Remember last 1000 commands
"           | |    |      |     |     |
"           v v    v      v     v     v
set viminfo=h,'500,<10000,s1000,/1000,:1000

" BS past autoindents, line boundaries,
" and even the start of insertion
set backspace=eol,start,indent

set updatecount=20     "Save buffer every 20 chars typed

" Keycodes and maps timeout in 3/10 sec...
set timeout timeoutlen=300 ttimeoutlen=300

set virtualedit=block      "Square up visual selections...
set virtualedit=onemore    "Allow cusor to one more last of line $

" history: number of command-lines remembered
set history=1000
set shortmess=atI       " do not show initial page
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
" 设置word的界限
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set iskeyword-=>                    " '>' is an end of word designator
set iskeyword-="                    " '"' is an end of word designator
set iskeyword-=:                    " ':' is an end of word designator


"Set the window's size.
set lines=40
set columns=125

"===[Make the 81th column stand out]===
" FIXME
" highlight colorcolumn ctermbg=magenta
" autocmd BufEnter * call matchadd('colorcolumn','\%81v', 100)
set colorcolumn=81


"备份,到另一个位置. 防止误删
set backup
set backupext=.bak
set backupdir=$HOME/.cache/.VIM_BK_FILES
" cancel backup,or it will create a *.wap file
" 取消备份
" set nobackup
" 关闭交换文件
" set noswapfile

"create undo file
if has('persistent_undo')
" Save all undo files in a single location (less messy, more risky)...
  set undodir=$HOME/.cache/.VIM_UNDO_FILES
  set undolevels=5000         " How many undos
  set undoreload=10000        " number of lines to save for undo
  set undofile                " Actually switch on persistent undo
endif

" highlight current column and line
set cursorcolumn
set cursorline


" alway show the content on the screen after exist VIM
" in case if i did some stupid deleting, and i can find them back
"set t_ti= t_te=              "关闭vim后将内容回显到shell中

" disable mouse
set mouse-=a           "鼠标暂不启用
"set mouse=a             "启用鼠标
"set mousehide           "输入状态时自动隐藏鼠标
set selection=inclusive		"光标的位置属于选中的范围
set selectmode=mouse,key

" No annoying sound on errors  --去掉命令错误的提示音
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=                "close visual bell
set tm=500

set nostartofline   "行跳转时保持在同一列

set magic      " For regular expressions turn magic on

"This causes the left and right arrow keys, as well as h and l,
"to wrap when used at beginning or end of lines.
"( < > are the cursor keys used in normal and visual mode,
"and [ ] are the cursor keys in insert mode
set whichwrap+=<,>,h,l,[,]

" 00x增减数字时使用十进制
set nrformats=

" 自动跳转当前打开文件的目录
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" gui则全屏显示
" au GUIEnter * simalt ~x

"==========================================
" Show:User Interface settings
"==========================================

" 隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换显示
if g:isGUI
    set guioptions-=m       " No menu bar
    set guioptions-=T       " No Toolbar
    set guioptions-=r		" No right hand scrollbars
    set guioptions-=L       " No left hand scrollbars
    " set guioptions-=e       " 关闭GUI标签页支持
    set guitablabel=%M\ %t
    set showtabline=1		" 指定何时显示标签页行,0为永远不会,1为至少有两个标签,2为永远会
    set linespace=2
	" --插入模式输入中文完毕回到普通模式时禁用输入法，缺点是搜索不了中文「因为也是在nomal下」，慎用
	" 经测试，还是有搜中文需求的，故弃置了
    "set imd         "屏蔽输入法
	"au InsertEnter * set noimd
	"au InsertLeave * set imd
	"au FocusGained * set imd     "获取焦点时屏蔽输入法
    set t_Co=256
    nmap <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
    \endif<CR>

	"不要加下面两句，会把windows习惯的预设快捷键都加上，就用不了c-a,c-x之类的自增自减操作了
	"source $VIMRUNTIME/mswin.vim
    "behave mswin
endif



set ruler         " Show cursor location info on status line
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd       " 显示输入的命令
set noshowmode    " 不显示当前所处的模式
set scrolloff=7   " Scroll when 7 lines from top/bottom

" show line number
set number
" disable wrap --不自动换行
set nowrap

" show matched brackets
set showmatch
" How many tenths of a second to blink when matching brackets （匹配括号高亮的时间：单位0.1秒）
set matchtime=2

" ===[Set up smarter search behaviour]===
" Highlight all matches
set hlsearch
highlight clear Search
highlight       Search    ctermfg=White
" ingnore case when do searching
set ignorecase
" instant search, lookahead as search pattern is specified
set incsearch
"...unless uppercase letters used
set smartcase

" 代码折叠
set foldenable
" 折叠方法(可供的选择如下)
" manual		            --手工折叠
" indent    use indentation --采取缩进的方式折叠
" expr      use expressions  --使用表达式定义折叠
" syntax    use syntax based on language   --使用语法定义折叠
" diff      fold the content which not modified   --对没有更改的文本进行折叠
" marker    use marker to indent, the default are {{{ and }}}   --使用标记进行折叠, 默认标记是 {{{ 和 }}}
" 选择一种折叠方法
set foldmethod=indent
set foldlevel=99

" 缩进设置--------------

" Do smart autoindenting when starting a new line.
"set cindent     " C语言自动缩进
set smartindent   "Retain indentation on next line
set autoindent    "Turn on autoindenting of blocks
" never add copyindent, case error   " copy the previous indentation on autoindenting

" Tab相关设置
set tabstop=4          " 设置Tab键的宽度 [等同的空格个数]
set shiftwidth=4       " 每一次缩进对应的空格数
set softtabstop=4      " 可以一次删除4个空格

" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.
set smarttab
"when type <Tab>, it auto generate to <spale>
set expandtab       "将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
" 取shiftwidth的整数倍，当使用'>' '<'来改变缩进时
set shiftround

set wildmode=longest:full,full
" set wildmode=list:longest,full
set infercase    "Adjust completions to match case
set ttyfast


set relativenumber                          " 显示相对行号，这个不错
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

if has('statusline')
    set laststatus=2						 " 命令行的高度
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
"   set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


"==========================================
" File encode:encode for varied filetype
"==========================================

" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set encoding=utf-8    "设置新文件的编码，默认不更改
" 自动判断编码时，依次尝试以下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"termmencoding 很多都设置为utf-8，但在windows下vim会乱码，gvim不会
if(g:isWindows && !(g:isGUI))
	set termencoding=cp936		 "终端的编码格式;
else
	set termencoding=utf-8
endif

"去掉bom
set nobomb
set fileencoding=utf-8            "设置当前文件编码，可以更改，如：gbk（同cp936）
set helplang=cn

" 文件格式，默认 ffs=dos,unix
set fileformat=unix             "设置新文件的<EOL>格式
set fileformats=unix,dos,mac    "给出文件的<EOL>[End of line]格式类型,设置Unix为默认的文件类型

if (g:isWindows && g:isGUI)
    "解决gvim菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    set langmenu=zh_CN.utf-8
    "解决consle输出乱码
    language messages zh_CN.utf-8
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
    " set guifont=Monaco\ for\ Powerline:h10
else
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
endif

"解决英文Windows下的Vim不知道如何显示双倍字符宽度的字体
"set guifont=Consolas:h11\cANSI
"set guifont=DejaVu_Sans_Mono:h11
" set guifont="Sauce Code Powerline":h18
"set guifontwide=Simsun\:h11:cANSI

" --针对中文的一些设置
set formatoptions+=m         " 如遇Unicode值大于255（大于一个字节）的文本,中文之类，不必等到空格再折行
set formatoptions+=B         " 合并两行中文时，不在中间加空格


"==========================================
" others 其它设置
"==========================================


"===[Magically build interim directories if necessary]===
function! AskQuit (msg, options, quit_option)
    if confirm(a:msg, a:options) == a:quit_option
        exit
    endif
endfunction

function! EnsureDirExists ()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
        call AskQuit("Parent directory '" . required_dir . "' doesn't exist.",
             \       "&Create it\nor &Quit?", 2)

        try
            call mkdir( required_dir, 'p' )
        catch
            call AskQuit("Can't create '" . required_dir . "'",
            \            "&Quit\nor &Continue anyway?", 1)
        endtry
    endif
endfunction

augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END

" 自动补全配置
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu " 输入模式的自动完成
set wildmenu                 " 增强模式中命令行自动完成
" 自动补全忽略的一些中间文件
set wildignore=*.o,*~,*.swp,*.bak,*.pyc,*.class,.svn

" --记忆上次离开文件时的位置，前提是.viminfo是可写的
if has("autocmd")   " remember the last cursor postion when reopen a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


"==========================================
"Key Mappings:Customized keys
"==========================================

" --切记：不要在map 设置后注释，否则会将注释内容作为map的一部分

" 用于wrap时跳到视觉上的下一行
"nore的意思是扩展后的结果不会再映射成别的内容,形成多次映射
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

"因c-j和c-k用于插件的补全操作了，在输入模式下会冲突，故在此去掉了
"imap <c-k> <Up>
"imap <c-j> <Down>
" Ctrl + H 插入模式下光标向左移动
inoremap <C-h> <Left>
cnoremap <C-h> <Left>
" Ctrl + L 插入模式下光标向右移动
inoremap <C-l> <Right>
cnoremap <C-l> <Right>

" 移动到本行下一个""处，用于html
inoremap <C-f> <Esc>2f"a
" 移动到本行上一个""处，用于html
inoremap <C-b> <Esc>2F"i

" F1 - F12 设置
" F1 废弃这个键,防止调出系统帮助
" F2 行号开关，用于鼠标复制代码用
" F3 显示可打印字符开关
" F4 换行开关

" 看键盘的设置就知道为什么会选择F5和F9作为快捷键了
" F5 LaTeX插件的insert/wrap in environment
" F9 LaTeX插件的do a completion (ref, cite, lename)

" F6 语法开关，关闭语法可以加快大文件的展示
" F7 粘贴模式paste_mode开关,用于有格式的代码粘贴
" F10 编译运行当前文件
" F8 用chrome浏览器打开正在编辑的html文件
" F11 切换全屏
" F12 用ie刘浏览器打开正在编辑的html文件

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
nnoremap <F1> :call NumberToggle()<cr>

""为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
" when in insert mode, press <F7> to go to
" paste mode, where you can paste mass data
" that won't be autoindented
set pastetoggle=<F7>

"C，C++, shell, python, javascript, ruby...等按F10运行
" TODO 还需要进一步完善
nnoremap <F10> :call CompileRun()<CR>
func! CompileRun()
    "去掉bom
    :set nobomb
    :set fileformat=unix
    :set fileencoding=utf-8
    :w
    let infile = expand("%:p")
    let outfile = expand("%:r")
    " 解决空格问题
    let infile = '"'.infile.'"'
    let outfile = '"'.outfile.'"'
    " 转义的\还需要再转义一次
    "echo outfile
    if &filetype == 'c'
        exec "!g++ " infile "-o" outfile
        exec "!" outfile
    elseif &filetype == 'cpp'
        exec "!g++ " infile "-o" outfile
        exec "!" outfile
    elseif &filetype == 'java'
        let dir = expand("%:h")
        let dir = '"'.dir.'"'
        let outfile = expand("%:t:r")
        exec "!javac -encoding UTF-8 " infile
        " java 需要在当前路径或指定路径中寻找class来执行
        exec "!java -classpath" dir outfile
    elseif &filetype == 'sh'
        exec "!bash " infile
    elseif &filetype == 'python'
        exec "!python " infile
    elseif &filetype == 'html'
        call ViewInBrowser("chrome")
    elseif &filetype == 'go'
        exec "!go build " infile
        exec "!go run " outfile
    elseif &filetype == 'markdown'
        "需要Chrome浏览器的MarkDown Preview Plus插件
        call ViewInBrowser("chrome")
    elseif &filetype == 'javascript'
        exec "!node " infile
    elseif &filetype == 'ruby'
        exec "!ruby " infile
    endif
endfunc

" 在浏览器预览 for Windows
function! ViewInBrowser(name)
    let file = expand("%:p")
    "解决空格问题，加双引号
    let file = '"'.file.'"'
    exec ":update " . file
    " echo file
    let l:browsers = {
                \"chrome":" chrome ",
                \"ie":" iexplore "
                \}
    " FIXME 修改为自己服务器的根目录
    let path_win='D:/Program Files/Apache24/htdocs/'
    let path_unix=substitute(file, '\\', '/', "g")
    "echo htdocs
    let strpos = (stridx(file,path_win) == -1
                \ && stridx(file,path_unix) == -1) ? -1 : 1
    " echo strpos
    if strpos == -1
        silent! exec "!start" l:browsers[a:name] file
    else
        let file=substitute(file, path_win, "http://127.0.0.1/", "g")
        let file=substitute(file, path_unix, "http://127.0.0.1/", "g")
        let file=substitute(file, '\\', '/', "g")
        silent! exec "!start" l:browsers[a:name] file
    endif
endfunction
nnoremap <F8> :call ViewInBrowser("chrome")<CR>
nnoremap <F12> :call ViewInBrowser("ie")<CR>

if has('gui_running') && has('libcall')
    let g:MyVimLib = $VIMRUNTIME.'/gvimfullscreen.dll'
    "F11
    nnoremap <F11> :call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)<CR>
inoremap <F11> <ESC>:call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)<CR>
endif

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

"goto older/newer position in change list
nnoremap <silent> ( g;
nnoremap <silent> ) g,

"replace currently selected text with default register without yanking it
vnoremap p "_dP

" Quickly edit/reload the vimrc config file
augroup VimReload
autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

nmap <silent> <leader>em :next $MYVIMRC<CR>
nmap <silent> <leader>sm :source $MYVIMRC<CR>
nmap <silent> <leader>eb :next ~/.vimrc.bundles<CR>

" 打开同一个文件夹的另一个文件
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
" 分屏打开文件
map <leader>ee :e %%
" 隐藏当前文本打开另一文本,<C-6>可toggle缓存
map <leader>eh :hide e %%
" 水平打开另一个文本
map <leader>es :sp %%
" 垂直打开另一个文本
map <leader>ev :vsp %%

" 命令模式增强
" <c-j>移动到下一条历史命令
cnoremap <C-j> <t_kd>
" <c-a>移动到上一条历史命令
cnoremap <C-k> <t_ku>
" <c-a>到行首，<c-e>到行尾.默认为<c-b>到行首
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" 在分屏中移动光标
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" v分屏
nmap <leader>w  <c-w>v
" s分屏
nmap <leader>ws <c-w>s
" 只保留当前窗口
nmap <leader>wo <c-w>o
" 交换分屏位置
nmap <leader>wx <c-w>x
" 垂直分屏最大化
nmap <leader>wl <c-w>|
" 水平分屏最大化
nmap <leader>wk <c-w>_
" 等分窗口
nmap <leader>we <c-w>=
" 分屏同步滚动
nnoremap <leader>ww  :set scb<CR>
nnoremap <leader>wm  :set noscb<CR>

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" 跳转到行末加分号
inoremap <C-g> <Esc>A;<Esc>o
" 花括号自动换行
inoremap {<CR> {<CR>}<ESC>O


"将分号影射到冒号，进一步提高进入命令模式的速度和降低错误率
nnoremap ; :
vnoremap ; :B<SPACE>
"nnoremap ' :b

" 选中操作
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

"原本Y=yy
nnoremap Y y$

"从本行选中到空行或代码块结束位置
nnoremap <leader>v v`}


" 搜索相关

"use sane regexes !not used!
" nnoremap / /\v
" vnoremap / /\v

" delete in normal mode to switch off highlighting
" till next search and clear messages...
nmap <silent> <BS> :nohlsearch<CR>

" 让搜索结果出现在屏幕中心
"keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> n nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')


    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <leader>r :call Replace(0, 0, input('replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <leader>rw :call Replace(0, 1, input('replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <leader>rc :call Replace(1, 0, input('replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <leader>rcw :call Replace(1, 1, input('replace '.expand('<cword>').' with: '))<CR>
nnoremap <leader>rwc :call Replace(1, 1, input('replace '.expand('<cword>').' with: '))<cr>


" tab/buffer相关

" todo: 如何跳转到确定的buffer?
" :b 1 :b 2
nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>
nnoremap dp :diffput<CR>
nnoremap dg :diffget<CR>

" toggle between two buffers   --可以用f来替代t原先的功能，相差一个字符
"nnoremap t <c-^>

" tab 操作
nnoremap <leader>l gt
nnoremap <leader>h gt

map <leader>te :tabedit<CR>
map <leader>tc :tabclose<CR>
"将当前标签移动到最后一个
map <leader>tm :tabm<CR>
map <leader>th :-tabm<CR>
map <leader>tl :+tabm<CR>


" 新建tab  ctrl+t
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <esc>:tabnew<CR>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>

" code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" change working directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" To display all lines with keyword under cursor
" and ask which one to jump to
nmap <leader>fi [I:let nr = input("which one(number): ")<bar>exe "normal " . nr ."[\t"<CR>
nmap <leader>fo ]I:let nr = input("which one(number): ")<bar>exe "normal " . nr ."[\t"<CR>

" toggles between the active and last active tab "
" the first tab is always 1 "
let g:last_active_tab = 1
nnoremap <silent> <leader>tu :execute 'tabnext ' . g:last_active_tab<CR>
vnoremap <silent> <leader>tu :execute 'tabnext ' . g:last_active_tab<CR>
" 记住上次离开tab的位置
autocmd tableave * let g:last_active_tab = tabpagenr()

" easier horizontal scrolling
map zl zl
map zh zh

" linux for when you forget to sudo.. really write the file.
cmap w!! w !sudo tee % >/dev/null

" 复制粘贴系统存储器的内容
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" quickly close the current window
nnoremap <leader>q :q<CR>

"===[Simplify textfile backups]===
" Back up the current file, for Unix
nmap BB :!bak -q %<CR><CR>:echomsg "Backed up" expand('%')<CR>

"===[Remap various keys to something more useful]===
" Use space to jump down a page (like browsers do)...
nnoremap <Space> <PageDown>
vnoremap <Space> <PageDown>

" Use U to redo.
nnoremap U <C-r>

" Forward/back one file...
nmap <silent><expr> <DOWN> File_advance('next')
nmap <silent><expr> <UP>   File_advance('prev')

function! File_advance (dir)
    if a:dir == 'next' && argidx() < argc() - 1
        return ":next\<CR>0"
    elseif a:dir == 'prev' && argidx() > 0
        return ":prev\<CR>0"
    else
        return ""
        " Also consider: return "\<ESC>"
    endif
endfunction


" Add *** as **/* on command-line...
cnoremap *** **/*


" Take off and nuke the entire buffer contents from space
" (It's the only way to be sure)...
nmap XX 1GdG

" Replace the current buffer with a copy of the most recent file...
nmap RR XX:0r#<CR><C-G>

" Insert cut marks...
nmap -- A<CR><CR><CR><ESC>k6i-----cut-----<ESC><CR>


" Indent/outdent current block...
nnoremap %% $>i}``
nnoremap $$ $<i}``

" swap implementations of ` and ' jump to markers
" by default, ' jumps to the marked line, ` jumps to the marked line&column
" so swap them
nnoremap ' `
nnoremap ` '

" i'm sick of typing :%s/.../.../g
nmap S :%s//g<left><left>
vmap S :b s//g<left><left>

"===[make visual modes work better]===
" visual block mode is far more useful that visual mode (so swap the commands)...
nnoremap v <C-v>
nnoremap <C-v> v

vnoremap v <C-v>
vnoremap <C-v> v


" make bs/del work as expected in visual modes (i.e. delete the selected text)...
vmap <BS> x

" make vaa select the entire file...
vnoremap aa vgo1g


" show me that list
" inoremap <expr> <c-k> ShowDigraphs()
" function! ShowDigraphs()
    " digraphs
    " call getchar()
    " return "\<c-k>"
" endfunction


"==========================================
" filetype settings  文件类型设置
"==========================================

" 文件类型的一般设置，比如不要 tab 等
autocmd bufread,bufnew *.md,*.mkd,*.markdown  set filetype=markdown
autocmd bufread,bufnew *.html,*.htm  set filetype=html
autocmd bufread,bufnew *.php,*.php3,*.phpt,*.phtml  set filetype=php
autocmd filetype python set tabstop=4 shiftwidth=4 expandtab ai
autocmd filetype haskell,puppet,ruby,yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 ai
autocmd filetype javascript,json,css,scss,html set tabstop=2 shiftwidth=2 expandtab ai
autocmd filetype java,php set tabstop=4 shiftwidth=4 expandtab ai
autocmd bufnewfile,bufread *.coffee set filetype=coffee

" workaround vim-commentary for haskell
autocmd filetype haskell setlocal commentstring=--\ %s
" workaround broken colour highlighting in haskell
autocmd filetype haskell,rust setlocal nospell
" :help php-indent
" let g:php_default_indenting = 4

" 保存文件时删除多余空格
fun! <sid>StripTrailingWhitespaces()
    let save_cursor = getcurpos()
    %s/\s\+$//ge
    "把光标放回原位
    call setpos('.', save_cursor)
endfun

autocmd filetype c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,vim autocmd bufwritepre <buffer> :call <sid>StripTrailingWhitespaces()


" 定义函数autosetfilehead，自动插入文件头
autocmd bufnewfile *.sh,*.py call Autosetfilehead()
function! Autosetfilehead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        exec ":call setline(1, '\#!/bin/bash')"
    endif

    "如果文件类型为python
    if &filetype == 'python'
        exec ":call setline(1, '\#!/usr/bin/env python')"
        exec ":call append(1, '\# encoding: utf-8')"
    endif

    normal g
    normal o
    normal o
endfunc


" set some keyword to highlight
if has("autocmd")
    " highlight TODO, FIXME, XXX, etc.
    if v:version > 701
        autocmd syntax * call matchadd('TODO',  '\w\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
        autocmd syntax * call matchadd('DEBUG', '\w\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif
endif


"==========================================
" color&theme
"==========================================

" --设置背景为light和dark，对应solarized的两种配色，对于molokai没区别
"set background=light
set background=dark
" --设置为256色
set t_co=256

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    " 去除注释的斜体
    let g:solarized_italic=0
    color solarized
else
    colorscheme desert
endif
"colorscheme solarized
"colorscheme molokai
" colorscheme tomorrow-night
" colorscheme tomorrow-night-bright
" colorscheme desert

" 设置标记一列的背景颜色和数字行号的背景颜色一致
highlight clear signcolumn      " signcolumn should match background
highlight clear linenr          " current line number row will have same background color in relative mode

" for error highlight, 防止错误正行标红导致看不清
highlight clear spellbad
highlight spellbad term=standout ctermfg=1 term=underline cterm=underline
highlight clear spellcap
highlight spellcap term=underline cterm=underline
highlight clear spellrare
highlight spellrare term=underline cterm=underline
highlight clear Spelllocal
highlight spelllocal term=underline cterm=underline
