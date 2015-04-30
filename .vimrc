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
" ����������״̬���Ѿ���ʾ��������������ˣ�ͬ�������õ�set showcmd
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
"set cursorcolumn      "������ò��Ч�����Ѱ�
set cursorline     

" alway show the content on the screen after exist VIM
" in case if i did some stupid deleting, and i can find them back
"set t_ti= t_te=              "�ر�vim�����ݻ��Ե�shell��

" disable mouse
set mouse-=a
"set selection=exclusive    "����λ�ò�����ѡ�еķ�Χ
" �޸�ctrl+m�������ѡ���bug,���Ǹı���ctrl+v�����ַ�ѡ�н���������µ��ַ�
set selection=inclusive		"����λ������ѡ�еķ�Χ
set selectmode=mouse,key

" No annoying sound on errors  --ȥ������������ʾ��
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=                "close visual bell
set tm=500

set nostartofline   "����תʱ������ͬһ��

"==========================================
" Show:User Interface settings
"==========================================

" show line number
set number
" disable wrap --���Զ�����
set nowrap

" show matched brackets
set showmatch
" How many tenths of a second to blink when matching brackets ��ƥ�����Ÿ�����ʱ�䣺��λ0.1�룩
set matchtime=2

" highlight the searching words
set hlsearch
" ingnore case when do searching
set ignorecase
" instant search ����ʱ���ң������뵽/bʱ�����b��ͷ�ĵ��ʣ�
set incsearch
" ��һ�������ϴ�д��ĸʱ�Դ�Сд����
set smartcase   

" code folding  --�۵����۵���ʽ
set foldenable
" folding methods
" manual		            --�ֹ��۵�
" indent    use indentation --��ȡ�����ķ�ʽ�۵�
" expr      use expressions  --ʹ�ñ��ʽ�����۵�
" syntax    use syntax based on language   --ʹ���﷨�����۵�
" diff      fold the content which not modified   --��û�и��ĵ��ı������۵�
" marker    use marker to indent, the default are {{{ and }}}   --ʹ�ñ�ǽ����۵�, Ĭ�ϱ���� {{{ �� }}}
set foldmethod=indent
set foldlevel=99

" Do smart autoindenting when starting a new line.  --����ʱ�Զ�����
"set cindent     "C�����Զ�����
set smartindent
set autoindent    " always set autoindenting on
" never add copyindent, case error   " copy the previous indentation on autoindenting

" Number of spaces that a <Tab> in the file counts for.  --Tab����ĳ���
set tabstop=4
" number of spaces to use for autoindenting
set shiftwidth=4
" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4
" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A
" <BS> will delete a 'shiftwidth' worth of space at the start of the line.
set smarttab				"���кͶεĿ�ʼʹ���Ʊ��

"when type <Tab>, it auto generate to <spale>
set expandtab

" use multiple of shiftwidth when indenting with '<' and '>'  --ʹ��'>' '<'���ı�����
set shiftround 

" A buffer becomes hidden when it is abandoned --�໺��Ĵ��ڷ�ʽ
set hidden
set wildmode=longest:full,full
set ttyfast  


set relativenumber                          " show relative line number  --��ʾ����кţ��������
autocmd InsertEnter * :set norelativenumber " no relativenumber in insert mode   --����ģʽ�²���ʾ����к�
autocmd InsertLeave * :set relativenumber   " show relativenumber when leave insert mode


"create undo file     --����undo���ļ�������undo����Ĳ���
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir=~/.undodir/
endif

set ruler       " show the current line number and column number  --�·���ʾ��ǰ������
set showcmd     " show the current typing command    --��ʾ���������
set showmode    " Show current mode     --��ʾ��ǰ������ģʽ
set scrolloff=7 " Set 7 lines to the cursor - when moving vertically  --�����ƶ�ʱ���ֶ��˻�β������7�пɼ�


if has('statusline')
    set laststatus=2						 " �����еĸ߶�
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

" ע��ʹ��utf-8��ʽ����������Դ�롢�ļ�·�����������ģ����򱨴�
set encoding=utf-8                           "����gvim�ڲ����룬Ĭ�ϲ�����
"termmencoding �ܶ඼����Ϊutf-8������windows��vim�����룬gvim����
if(g:iswindows && !(g:isGUI))
	set termencoding=cp936			         "�ն˵ı����ʽ;
else
	set termencoding=utf-8
endif
	
set fileencoding=utf-8                        "���õ�ǰ�ļ����룬���Ը��ģ��磺gbk��ͬcp936��
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1     "����֧�ִ򿪵��ļ��ı���

" �ļ���ʽ��Ĭ�� ffs=dos,unix
set fileformat=unix                            "�����£���ǰ���ļ���<EOL>��ʽ�����Ը��ģ��磺dos��windowsϵͳ���ã�
set fileformats=unix,dos,mac                   "�����ļ���<EOL>��ʽ����,����UnixΪĬ�ϵ��ļ�����

if (g:iswindows)
    "����˵�����
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "���consle�������
    language messages zh_CN.utf-8
endif

"���Ӣ��Windows�µ�Vim��֪�������ʾ˫���ַ���ȵ�����
set gfn=Monaco:h10:cANSI
set guifontwide=NSimsun\:h12

" --������ĵ�һЩ����
set formatoptions+=m         " ����Unicodeֵ����255������һ���ֽڣ����ı�,����֮�࣬���صȵ��ո�������
set formatoptions+=B         " When joining lines, don't insert a space between two multi-byte characters.
set completeopt=longest,menu " behaviour of insert mode completion  --�Զ����
set wildmenu                 " auto complete command  --��ǿģʽ���������Զ����
set wildignore=**.o,*~,.swp,*.bak,*.pyc,*.class   " Ignore compiled files  --���Ա�����м��ļ�;


" --�����ϴν�����λ�ã���ʹ��������ʽ
                    " if this not work ,make sure .viminfo is writable for you
if has("autocmd")   " remember the last cursor postion when reopen a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set viminfo^=% " Remember info about open buffers on close
set magic      " For regular expressions turn magic on  --ʹ��������ʽ \v��������ʽ



set backspace=eol,start,indent               " Configure backspace so it acts as it should act
"This causes the left and right arrow keys, as well as h and l, 
"to wrap when used at beginning or end of lines. 
"( < > are the cursor keys used in normal and visual mode, 
"and [ ] are the cursor keys in insert mode
set whichwrap+=<,>,h,l,[,]
" --vimrc�ļ��仯ʱ���Զ�����
autocmd! bufwritepost .vimrc source $MYVIMRC  " auto load vimrc file after modify;;


"close popup menu when leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" --���ò�ͬ���Ե�����
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType javascript,json,css,scss,html set tabstop=2 shiftwidth=2 expandtab ai


"==========================================
"Key Mappings:Customized keys
"==========================================

" �����ǰ׺�������Ӱ���������������� ",d"  ",c"
let mapleader = ','       "������ֵ�<leader>��ʾ�ľ��ǡ�,��
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

"  ������ģʽ��ǿ��ctrl - a�����ף� -e ����β
" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Smart way to move between windows  --����
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions  --����
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

" F1 - F6 ����
" F1 ���������,��ֹ����ϵͳ����
" F2 �кſ��أ�������긴�ƴ�����
" F3 ��ʾ�ɴ�ӡ�ַ�����
" F4 ���п���
" F5 ճ��ģʽpaste_mode����,�����и�ʽ�Ĵ���ճ��
" F6 �﷨���أ��ر��﷨���Լӿ���ļ���չʾ

" I can type :help on my own, thanks.
noremap <F1> <Esc>"

""Ϊ���㸴�ƣ���<F2>����/�ر��к���ʾ:
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
" --��F5����ճ��ģʽ���������ٴ��Զ�����������Դ�ļ���ʽ;
set pastetoggle=<F5>                          " when in insert mode, toggle between 'paste' and 'nopaste'
au InsertLeave * set nopaste                  " disbale paste mode when leaving insert mode 


"���ֺ�Ӱ�䵽ð�ţ���һ����߽�������ģʽ���ٶȺͽ��ʹ�����
nnoremap ; :
nnoremap ' :b

nnoremap <leader>v V`}

"Use sane regexes !not used!
nnoremap / /\v
vnoremap / /\v

" �����������������Ļ����
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

" select all --ȫѡ
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

" <leader>k �滻 Esc  --��������������£����ƻ��������
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
" --���Ҳ������(����������),���������ģʽִ�� :BundleInstall
" :BundleInstall     install
" :BundleInstall!    update
" :BundleClean       remove plugin not in list



"################### Themes ###################"

" --��ִ�� :BundleInstall �����Ᵽ����~/.vim/bundle/
" --����һ 
"theme solarized
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

" --�����
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

" --���ñ���Ϊlight��dark����Ӧsolarized��������ɫ������molokaiû����
set background=light
"set background=dark
" --����Ϊ256ɫ
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

