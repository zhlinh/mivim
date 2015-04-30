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
"              ??? "Be the change you want to see the world" ???
"
" Author:  zhlinh
" Version: 0.4.25
" Email: zhlinhng@gmail.com"
" Last_modify: 2015-4-25
" Sections:
"     ->System Identification
"     ->General Settings
"     ->Show:User Interface settings
"     ->File encode:encode for varied filetype
"     ->Others
"     ->Hot Key:Customized keys
"     ->Bundle:Plgin management and setting
"     ->Color&Theme
"==========================================

" =============================================================================
" System Identification
" =============================================================================

" -----------------------------------------------------------------------------
"  < Windows or Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

" -----------------------------------------------------------------------------
"  <  vim or Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif




"==========================================
" General Settings
"==========================================

"history: number of command-lines remembered
" 设置这句后，在状态栏已经显示正在输入的命令了，同后面设置的set showcmd
set history=200

"detect filetype
filetype on
filetype indent on    "differet indentation for differet filetype

"allow plugins
filetype plugin on
filetype plugin indent on    "allow plugin indent

"Do not compatible with VI
set nocompatible
set autoread          " auto reload file after being modified
set shortmess=atI       " do not show initial page
set title                " change the terminal's title

" cancel backup,or it will create a *.wap file
set nobackup
set noswapfile

" highlight current column and line
"set cursorcolumn      "高亮列貌似效果不佳啊
set cursorline     

" alway show the content on the screen after exist VIM
" in case if i did some stupid deleting, and i can find them back
"set t_ti= t_te=              "关闭vim后将内容回显到shell中

" disable mouse
set mouse-=a
"set selection=exclusive    "光标的位置不属于选中的范围
" 修复ctrl+m多光标操作选择的bug,但是改变了ctrl+v进行字符选中将包含光标下的字符
set selection=inclusive		"光标的位置属于选中的范围
set selectmode=mouse,key

" No annoying sound on errors  --去掉命令错误的提示音
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=                "close visual bell
set tm=500

set nostartofline   "行跳转时保持在同一列

"==========================================
" Show:User Interface settings
"==========================================

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
" ingnore case when do searching
set ignorecase
" instant search （即时查找，当输入到/b时会查找b开头的单词）
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase   

" code folding  --折叠和折叠方式
set foldenable
" folding methods
" manual		            --手工折叠
" indent    use indentation --采取缩进的方式折叠
" expr      use expressions  --使用表达式定义折叠
" syntax    use syntax based on language   --使用语法定义折叠
" diff      fold the content which not modified   --对没有更改的文本进行折叠
" marker    use marker to indent, the default are {{{ and }}}   --使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

" Do smart autoindenting when starting a new line.  --换行时自动对齐
"set cindent     "C语言自动缩进
set smartindent
set autoindent    " always set autoindenting on
" never add copyindent, case error   " copy the previous indentation on autoindenting

" Number of spaces that a <Tab> in the file counts for.  --Tab代表的长度
set tabstop=4
" number of spaces to use for autoindenting
set shiftwidth=4
" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4
" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A
" <BS> will delete a 'shiftwidth' worth of space at the start of the line.
set smarttab				"在行和段的开始使用制表符

"when type <Tab>, it auto generate to <spale>
set expandtab

" use multiple of shiftwidth when indenting with '<' and '>'  --使用'>' '<'来改变缩进
set shiftround 

" A buffer becomes hidden when it is abandoned --多缓存的存在方式
set hidden
set wildmode=longest:full,full
set ttyfast  


set relativenumber                          " show relative line number  --显示相对行号，这个不错
autocmd InsertEnter * :set norelativenumber " no relativenumber in insert mode   --输入模式下不显示相对行号
autocmd InsertLeave * :set relativenumber   " show relativenumber when leave insert mode


"create undo file     --创建undo的文件，可以undo更多的步骤
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir=~/.undodir/
endif

set ruler       " show the current line number and column number  --下方显示当前的行列
set showcmd     " show the current typing command    --显示输入的命令
set showmode    " Show current mode     --显示当前所处的模式
set scrolloff=7 " Set 7 lines to the cursor - when moving vertically  --上下移动时保持顶端或尾部至少7行可见


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
set encoding=utf-8                           "设置gvim内部编码，默认不更改
"termmencoding 很多都设置为utf-8，但在windows下vim会乱码，gvim不会
if(g:iswindows && !(g:isGUI))
	set termencoding=cp936			         "终端的编码格式;
else
	set termencoding=utf-8
endif
	
set fileencoding=utf-8                        "设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1     "设置支持打开的文件的编码

" 文件格式，默认 ffs=dos,unix
set fileformat=unix                            "设置新（当前）文件的<EOL>格式，可以更改，如：dos（windows系统常用）
set fileformats=unix,dos,mac                   "给出文件的<EOL>格式类型,设置Unix为默认的文件类型

if (g:iswindows)
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "解决consle输出乱码
    language messages zh_CN.utf-8
endif

"解决英文Windows下的Vim不知道如何显示双倍字符宽度的字体
set gfn=Monaco:h10:cANSI
set guifontwide=NSimsun\:h12

" --针对中文的一些设置
set formatoptions+=m         " 如遇Unicode值大于255（大于一个字节）的文本,中文之类，不必等到空格再折行
set formatoptions+=B         " When joining lines, don't insert a space between two multi-byte characters.
set completeopt=longest,menu " behaviour of insert mode completion  --自动完成
set wildmenu                 " auto complete command  --增强模式中命令行自动完成
set wildignore=**.o,*~,.swp,*.bak,*.pyc,*.class   " Ignore compiled files  --忽略编译的中间文件;


" --记忆上次结束的位置，和使用正则表达式
                    " if this not work ,make sure .viminfo is writable for you
if has("autocmd")   " remember the last cursor postion when reopen a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set viminfo^=% " Remember info about open buffers on close
set magic      " For regular expressions turn magic on  --使用正则表达式 \v跟正则表达式



set backspace=eol,start,indent               " Configure backspace so it acts as it should act
"This causes the left and right arrow keys, as well as h and l, 
"to wrap when used at beginning or end of lines. 
"( < > are the cursor keys used in normal and visual mode, 
"and [ ] are the cursor keys in insert mode
set whichwrap+=<,>,h,l,[,]
" --vimrc文件变化时，自动重载
autocmd! bufwritepost .vimrc source $MYVIMRC  " auto load vimrc file after modify;;


"close popup menu when leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" --设置不同语言的缩进
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType javascript,json,css,scss,html set tabstop=2 shiftwidth=2 expandtab ai


"==========================================
"Key Mappings:Customized keys
"==========================================

" 命令的前缀，如可以影射多个按键：可以是 ",d"  ",c"
let mapleader = ','       "下面出现的<leader>表示的就是‘,’
let g:mapleader = ','

command! W w !sudo tee % > /dev/null "sudo write with W

"goto older/newer position in change list
nnoremap <silent> ( g;
nnoremap <silent> ) g,

"replace currently selected text with default register without yanking it
vnoremap p "_dP

" use <C-V> to paste yanked content
inoremap <C-V> <C-R>"

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

"  命令行模式增强，ctrl - a到行首， -e 到行尾
" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Smart way to move between windows  --有用
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions  --有用
noremap H 0
noremap L $
map Y y$

" Remap VIM 0 to first non-blank character
map 0 ^

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"no Highlight
noremap <silent><leader>/ :nohls<CR>

" F1 - F6 设置
" F1 废弃这个键,防止调出系统帮助
" F2 行号开关，用于鼠标复制代码用
" F3 显示可打印字符开关
" F4 换行开关
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" F6 语法开关，关闭语法可以加快大文件的展示

" I can type :help on my own, thanks.
noremap <F1> <Esc>"

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
" --按F5进入粘贴模式，即不会再次自动缩进，保持源文件格式;
set pastetoggle=<F5>                          " when in insert mode, toggle between 'paste' and 'nopaste'
au InsertLeave * set nopaste                  " disbale paste mode when leaving insert mode 


"将分号影射到冒号，进一步提高进入命令模式的速度和降低错误率
nnoremap ; :
nnoremap ' :b

nnoremap <leader>v V`}

"Use sane regexes !not used!
nnoremap / /\v
vnoremap / /\v

" 让搜索结果出现在屏幕中心
"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"Use 'm/M' to move among buffers
noremap m :bn<CR>
noremap M :bp<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" select all --全选
map <Leader>sa ggVG"

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>fe :e %%
map <leader>fs :sp %%
map <leader>fv :vsp %%

nnoremap dp :diffput<CR>
nnoremap dg :diffget<CR>
nnoremap dg :diffget<CR>

" toggle between two buffers
nnoremap t <C-^>

" <leader>k 替换 Esc  --这个可以先试用下，估计会有误操作
inoremap <leader>k <Esc>

"==========================================
" Bundle:Plgin management and setting
"==========================================
"package dependent:  ctags
"awesome javascript autocomplete dependent: nodejs
"python dependent:  pep8, pyflake

filetype off " required! turn off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()



"################### Plugins Management ###################"

Bundle 'gmarik/vundle'
" vim plugin bundle control, command model
" --若找不到插件(包括主题插件),则可用命令模式执行 :BundleInstall
" :BundleInstall     install
" :BundleInstall!    update
" :BundleClean       remove plugin not in list



"################### Themes ###################"

" --先执行 :BundleInstall ，主题保存在~/.vim/bundle/
" --主题一 
"theme solarized
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

" --主题二
"theme molokai
Bundle 'tomasr/molokai'
"let g:molokai_original = 1



"==========================================
" Color&Theme
"==========================================

filetype plugin indent on

syntax enable
syntax on

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" --设置背景为light和dark，对应solarized的两种配色，对于molokai没区别
set background=light
"set background=dark
" --设置为256色
set t_Co=256

colorscheme solarized
"colorscheme molokai
"colorscheme desert

hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

