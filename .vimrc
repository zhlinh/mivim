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

" -- set autowrite --
" history: number of command-lines remembered
set history=1000
set shortmess=atI       " do not show initial page
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
" 设置word的界限
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set iskeyword-=>                    " '>' is an end of word designator
set iskeyword-="                    " '"' is an end of word designator
set iskeyword-=:                    " ':' is an end of word designator

"detect filetype
filetype on
"differet indentation for differet filetype
" 针对不同的文件类型采用不同的缩进格式
filetype indent on

set autoread          " auto reload file after being modified
set title                " change the terminal's title

"Set the window's size.
set lines=40
set columns=125

" cancel backup,or it will create a *.wap file
"" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/
" 取消备份
set nobackup
" 关闭交换文件
set noswapfile

"create undo file
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " How many undos
  set undoreload=10000        " number of lines to save for undo
  set undodir=/tmp/vimundo/
endif

" highlight current column and line
set cursorcolumn      "高亮列貌似效果不佳啊
set cursorline

" alway show the content on the screen after exist VIM
" in case if i did some stupid deleting, and i can find them back
"set t_ti= t_te=              "关闭vim后将内容回显到shell中

" disable mouse
set mouse-=a           "鼠标暂不启用
"set mouse=a             "启用鼠标
"set mousehide           "输入状态时自动隐藏鼠标
"set selection=exclusive    "光标的位置不属于选中的范围
" 修复ctrl+m多光标操作选择的bug,但是改变了ctrl+v进行字符选中将包含光标下的字符
"set selection=exclusive
set selection=inclusive		"光标的位置属于选中的范围
set selectmode=mouse,key

" No annoying sound on errors  --去掉命令错误的提示音
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=                "close visual bell
set tm=500

set nostartofline   "行跳转时保持在同一列

" 搜索时会自动跟/\v
set magic      " For regular expressions turn magic on  --使用正则表达式 \v跟正则表达式

" <BS>起作用的地方：行首的空白字符，换行符和插入模式开始处之前的字符
set backspace=eol,start,indent               " Configure backspace so it acts as it should act
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

	"不要加下面两句，会把windows习惯的预设mapping都加上，就用不了c-a,c-x之类的自增自减操作了
	"source $VIMRUNTIME/mswin.vim
    "behave mswin
endif



set ruler       " 总在下方显示当前的行列
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd     " 显示输入的命令
set showmode    " 显示当前所处的模式
set scrolloff=7 " 上下移动时保持顶端或尾部至少7行可见

" show line number
set number
" disable wrap --不自动换行
set nowrap

" show matched brackets
set showmatch
" How many tenths of a second to blink when matching brackets （匹配括号高亮的时间：单位0.1秒）
set matchtime=2

" highlight the searching words
set hlsearch
" ingnore case when do searching  --搜索时忽略大小写
set ignorecase
" instant search （即时查找，当输入到/b时会查找b开头的单词）
set incsearch
" 有一个或以上大写字母时仍大小写敏感
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

" Do smart autoindenting when starting a new line.  --换行时自动对齐
"set cindent     "C语言自动缩进
set smartindent
set autoindent    " 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting

" Tab相关设置
set tabstop=4          " 设置Tab键的宽度 [等同的空格个数]
set shiftwidth=4       " 每一次缩进对应的空格数
set softtabstop=4      " 按一次空格键可以一次删除4个空格
" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A
" <BS> will delete a 'shiftwidth' worth of space at the start of the line.
set smarttab				"在行和段的开始使用制表符
"when type <Tab>, it auto generate to <spale>
set expandtab       "将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
" 取shiftwidth的整数倍，当使用'>' '<'来改变缩进时
set shiftround

set wildmode=longest:full,full
" set wildmode=list:longest,full
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
set encoding=utf-8                           "设置gvim新文件的编码，默认不更改
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

" vimrc文件变化时自动加载
autocmd! bufwritepost _vimrc source % " Windows
autocmd! bufwritepost .vimrc source % " Linux

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
set viminfo^=%   " %号表示记录缓存区列表，只有不带参数启动vim时才有效

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
" 主要按键重定义

" 关闭方向键[插入模式下仍可用], 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"se swap之后，同物理行上线直接跳
"nore的意思是扩展后的结果不会再映射成别的内容,形成多次映射
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

"因c-j和c-k用于插件的补全操作了，在输入模式下会冲突，故在此去掉了
"imap <c-k> <Up>
"imap <c-j> <Down>
" Ctrl + H 插入模式下光标向左移动
imap <C-h> <Left>
cmap <C-h> <Left>
" Ctrl + L 插入模式下光标向右移动
imap <C-l> <Right>
cmap <C-l> <Right>

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
              "set paste
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
"    when in insert mode, press <F7> to go to
"    paste mode, where you can paste mass data
"    that won't be autoindented
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
    "let outfile = substitute(infile, "\\(\\.c\\)\\|\\(\\.java\\)\\|\\(\\.go\\)", "", "gei")
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
    "echo file
    let l:browsers = {
                \"chrome":" chrome ",
                \"ie":" iexplore "
                \}
    " FIXME 修改为自己服务器的根目录
    let htdocs='D:/Program Files/Apache24/htdocs/'
    "echo htdocs
    let strpos = stridx(file,htdocs)
    "echo strpos
    if strpos == -1
        exec ":silent !start" l:browsers[a:name] file
    else
        " let file=substitute(file, htdocs, "http://127.0.0.1:8080/", "g")
        let file=substitute(file, htdocs, "http://127.0.0.1/", "g")
        let file=substitute(file, '\\', '/', "g")
        exec ":silent !start" l:browsers[a:name] file
    endif
endfunction
nnoremap <F8> :call ViewInBrowser("chrome")<cr>
nnoremap <F12> :call ViewInBrowser("ie")<cr>

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

" use <C-V> to paste yanked content
inoremap <C-V> <C-R>"

" Quickly edit/reload the vimrc config file
nmap <silent> <leader>em :e $MYVIMRC<CR>
nmap <silent> <leader>sm :so $MYVIMRC<CR>
nmap <silent> <leader>eb :e ~/.vimrc.bundles<CR>

" 在当前窗口打开一个文本
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
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
" 命令行模式下自动填写
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" 在分屏中移动光标
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

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
"nnoremap ' :b

" 选中操作
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" --原本Y的功能同yy，y$再p的时候是在本行
map Y y$

" select all --全选
map <Leader>sa ggVG

" 从本行选中到空行或代码块结束位置
nnoremap <leader>v V`}

" 搜索相关

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
nnoremap <space> /
"Use sane regexes !not used!
nnoremap / /\v
vnoremap / /\v

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" 让搜索结果出现在屏幕中心
"Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
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
nnoremap <Leader>r :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>


" tab/buffer相关

" TODO: 如何跳转到确定的buffer?
" :b 1 :b 2
nnoremap H :bprevious<cr>
nnoremap L :bnext<cr>
noremap <left> :bp<CR>
noremap <right> :bn<CR>
nnoremap dp :diffput<CR>
nnoremap dg :diffget<CR>

" toggle between two buffers   --可以用f来替代t原先的功能，相差一个字符
"nnoremap t <C-^>

" tab 操作
nnoremap <leader>l gt
nnoremap <leader>h gT

map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
"将当前标签移动到最后一个
map <leader>tm :tabm<cr>
map <leader>th :-tabm<cr>
map <leader>tl :+tabm<cr>


" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

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
noremap <leader>0 :tablast<cr>

" Code folding options
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

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Map <Leader>fi to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>fi [I:let n = input("Which one(number): ")<Bar>exe "normal " . nr ."[\t"<CR>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tu :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tu :execute 'tabnext ' . g:last_active_tab<cr>
" 记住上次离开Tab的位置
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" Easier horizontal scrolling
map zl zL
map zh zH

" Linux For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" 复制粘贴系统存储器的内容
nnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line&column
" so swap them
nnoremap ' `
nnoremap ` '


"==========================================
" FileType Settings  文件类型设置
"==========================================

" 文件类型的一般设置，比如不要 tab 等
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown
autocmd BufRead,BufNew *.html,*.htm  set filetype=html
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType haskell,puppet,ruby,yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 ai
autocmd FileType javascript,json,css,scss,html set tabstop=2 shiftwidth=2 expandtab ai
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell

" 保存文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let save_cursor = getcurpos()
    %s/\s\+$//e
    "把光标放回原位
    call setpos('.', save_cursor)
endfun

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py call AutoSetFileHead()
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        exec ":call setline(1, '\#!/bin/bash')"
    endif

    "如果文件类型为python
    if &filetype == 'python'
        exec ":call setline(1, '\#!/usr/bin/env python')"
        exec ":call append(1, '\# encoding: utf-8')"
    endif

    normal G
    normal o
    normal o
endfunc


" set some keyword to highlight
if has("autocmd")
    " Highlight TODO, FIXME, XXX, etc.
    if v:version > 701
        autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif
endif


"==========================================
" Color&Theme
"==========================================

" --设置背景为light和dark，对应solarized的两种配色，对于molokai没区别
"set background=light
set background=dark
" --设置为256色
set t_Co=256

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
" colorscheme Tomorrow-Night
" colorscheme Tomorrow-Night-Bright
" colorscheme desert

" 设置标记一列的背景颜色和数字行号的背景颜色一致
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

" for error highlight, 防止错误正行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

