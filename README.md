mivim
====================
# 依赖
-----------------------
	原则是尽量少用需要依赖的插件

	package dependence:  **ctags**, **ag**(he_silver_searcher), **curl**
	python dependence:   **pep8**, **pyflake**[这些只要装了python就好]


# 自定义快捷键
-----------------------
0. ####注意, 以下 `,` 代表`<leader>`

1. ####可以自己修改vimrc中配置，决定是否开启鼠标

        set mouse-=a           " 鼠标暂不启用, 键盘党....
        set mouse=a            " 开启鼠标

2. ####可以自己修改vimrc决定是否使用方向键进行上下左右移动，默认关闭，强迫自己用 hjkl，可以注解

        hjkl  上下左右
        map <Left> <Nop>
        map <Right> <Nop>
        map <Up> <Nop>
        map <Down> <Nop>

3. ####上排F功能键

        F1 set no/relativenumber,相对行号和绝对行号的转换

        F2 set nu/nonu,行号开关，用于鼠标复制代码用

        F3 set list/nolist,显示可打印字符开关

        F4 set wrap/nowrap,换行开关

        F5 LaTeX插件的insert/wrap in environment

        F9 LaTeX插件的do a completion (ref, cite, lename)

        F6 syntax on/off,语法开关，关闭语法可以加快大文件的展示

        F7 set paste/nopaste,粘贴模式paste_mode开关,用于有格式的代码粘贴

        F10 运行当前文件,for windows，path里需要对应的支持

        <leader>r 运行当前文件，for linux(用了插件quickrun)

        F8 用chrome运行html文件,需要将chrome放进path

	    F11 切换全屏

        F12 用ie运行html文件,需要将ie放进path

4. ####分屏移动

        Normal模式下:
        ctrl + j/k/h/l   进行上下左右窗口跳转,不需要ctrl+w+jkhl

    	,w     打开垂直分屏(<c-w>v)
    	,ws	   打开水平分屏(<c-w>s)
    	,wo    只保留当前屏幕(<c-w>o)
    	,wx	   交换分屏位置(<c-w>x)
    	,wl	   垂直分屏最大化(<c-w>|)
    	,wk	   水平分屏最大化(<c-w>k)
    	,we    等分窗口(<c-w>=)

    	,ww		开启分屏同步滚动(:set scb)
    	,wm		开启分屏同步滚动(:set noscb)


    Insert模式下[注意没有c-j和c-k，用于Ultisnips插件的补全操作了，会冲突]:
    ctrl + h/l  相当于Normal模式下的h/l

5. ####搜索

        <space> 空格，进入搜索状态/
        /       =/\v  引入正则
        ,/      去除匹配高亮

	    ,fi     列出寻找光标下的关键词的所有位置，键入数字即可到达[有点ctrlp-funcy的意思]

    优化搜索保证结果在屏幕中间

6. ####Tab操作(重点推)

        ctrl+t 新建一个tab

        ,l    下一个tab
        ,h    前一个tab

        (关闭打开操作)
        ,td    关闭tab
        ,te    tabedit
        ,tm    将当前标签移动到最后
        ,th    将当前标签左移
        ,tl    将当前标签右移
        ,1     切第1个tab
        ,2     切第2个tab
        ...
        ,9     切第9个tab
        ,0     切最后一个tab

        ,tu   (Tab Used)最近使用两个tab之间切换

7. ####Buffer操作(不建议, 建议使用ctrlspace插件来操作,l切换tabList or buffList)

        H          前一个buffer
        L          后一个buffer

        <Left>     前一个buffer
        <Right>    后一个buffer


8. ####文件I/O操作

        ,em  打开(my)vimrc配置文件
        ,eb  打开.vimrc.bundle配置文件
        ,sm  重载入(my)vimrc配置文件

        ,ee  =e 当前目录/
        ,es  =split  当前目录/
        ,ev  =vsplit  当前目录/


9. ####折叠操作

	    " Code folding options
        ,f0    foldlevel=0
        ,f1    foldlevel=1
        ,f2    foldlevel=2
        ...
        ,f9    foldlevel=9


10. ####按键修改

        Y       		=y$    复制到行尾
        U       		=Ctrl-r

        ,sa     		select all,全选
        ,v      		选中段落

        ,k      		代替<Esc>，不用到角落去按esc了

        c-a     		命令行模式下到行首[默认是c-b]
        c-e     		命令行模式下到行尾[没变，默认就是c-e]

	    cd.(或cwd)		命令行模式下切换到当前文件目录

        ,y              ="+y  复制指定内容到系统剪切板
        ,Y              ="+yy 复制本行内容到系统剪切板
        ,p              ="+p  粘贴系统剪切板的内容到光标后
        ,P              ="+P  粘贴系统剪切板的内容到光标前

        ,q              :q，退出vim

        <enter>         normal模式下回车选中当前项

---------------------
# 插件部分
---------------------
> 基础

1. ####插件管理 [gmarik/vundle](https://github.com/gmarik/vundle)

    必装,用于管理所有插件
    命令行模式下管理命令:

        :BundleInstall     install
        :BundleInstall!    update
        :BundleClean       remove plugin not in list

2. ####多语言语法检查 [scrooloose/syntastic](https://github.com/scrooloose/syntastic)

    建议安装，静态语法及风格检查,支持多种语言

    修改了下标记一列的背景色,原有的背景色在solarized下太难看了…..

        "记忆方式 <leader> Toggle[E]rror
        ,e  列出/隐藏当前文件所有错误列表


> 自动补全

1. ####代码自动补全 [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

    必装，强烈推荐(YCM是我目前用到的最好的自动补全插件)

    这个插件包含了以下几个插件功能,所以不需要装下面:

        clang_complete
        AutoComplPop
        Supertab
        neocomplcache
        jedi(对python的补全)

    敲两个字符后弹出提示, 支持各语言标准库补全

    快捷键:

        ctrl+n 选择下一个补全
        ctrl+p 选择上一个补全
        回车    选中
        ,df  跳转到函数定义[DeFinition]位置, 分屏打开一个buffer(非常有用!!!!!!!!!)
        ,dc  跳到声明[DeClaration]位置, 仅 filetypes: c, cpp, objc, objcpp, python 有效(比较少用)



2. ####代码片段快速插入 [SirVer/ultisnips](https://github.com/SirVer/ultisnips) +[honza/vim-snippets](https://github.com/honza/vim-snippets)

    必装，效率杀手锏，快速插入自定义的代码片段, 高效必备

    YCM 自动补全会弹提示

        ctrl+j 下一个需要补充的位置
        ctrl+k 上一个需要补充的位置
        ctrl+j  使用片段 -> expand to codes
        ,us    编辑对应文件类型的代码片段



4. ####引号配对补全 [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)

    必装，输入引号,括号时,自动补全

    对python的docstring 三引号做了处理(只处理""", '''暂时没配，可以自己加)
	去除了html的<>补全，这留给插件AutoCloseTag来作，直接补全标签更便捷

    附:同类插件 [kana/vim-smartinput](https://github.com/kana/vim-smartinput)



> 快速编码

1. ####快速注释 [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)

    必装，另一个大大提升效率的地方，快速批量加减注释[会自动补一个空格]

        [d] shift+v+方向键选中(默认当前行)
        -> ,cc      	加上注释
        -> ,cu      	解开注释
        -> ,c<space>   	加上/解开注释
        -> ,cm 			使用/* */,只有在支持多种注释类型的文件中才可使用[下同]
        -> ,cs  		使用段落的/** \t *文本 \t  */
        -> ,a   		选择注释类型

    附:注释还有其他两种插件可选[tcomment](https://github.com/tomtom/tcomment_vim) 和[tpope/vim-commentary](https://github.com/tpope/vim-commentary)



2. ####快速编辑 [tpope/vim-surround](https://github.com/tpope/vim-surround) +[tpope/vim-repeat](https://github.com/tpope/vim-repeat)

    必装，很给力的功能，快速给词加环绕符号,例如引号, 注意(括号, 左括号会加空格, 右括号不会)

    repeat进行增强,'.'可以重复使用命令 (ys=you surround)

        [d]
        cs"'        [Change Surround A to B]
        "Hello world!" -> 'Hello world!'

        ds"         [Delete Surround]
        "Hello world!" -> Hello world!

        ysiw"       [You Surround in word]
        Hello -> "Hello"

		ysiW"       [You Surround in Word(split with space),besides ysis"(sentence) ysip"(paragraph)]
		Hello tpope/vim-surround  ->   Hello "tpope/vim-surround"

        yss"        [You Surround Surround]
        Hello world -> "Hello world"

        cst"
        <a>abc</a>  -> "abc"

        veeS"       [用于可视模式的]
        hello world -> "hello world"

        ys$" 当前到行尾, 引号引住



3. ####快速运行 [vim-quickrun](https://github.com/thinca/vim-quickrun)

        <leader>r  快速运行当前文件



4. ####去行尾空格 [bronson/vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)

    将代码行最后无效的空格标红

        [sd] ,空格    去掉当前行末尾空格



5. ####赋值语句代码对齐 [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align)

    将代码,或者json等, 根据表达式符号进行对齐,具体见例子 [examples](https://github.com/junegunn/vim-easy-align/blob/master/EXAMPLES.md)
    <leader>a后还可以用<enter>来转换右对齐还是两端对齐，默认为左对齐

        [sd]一般会先用vip[visual in paragraph]先选中一段,不选中默认操作当前行
            ,a=        对齐等号表达 [有用]
            ,a:        对齐冒号表达式(json/map等)
            ,a<space>  首个空格左对齐
            ,a2<space> 第二个空格左对齐

            ,a*|              左对齐所有|号,表格中会用到
            ,a**|             依次左右对齐所出现的|号
            ,a<enter>*|       右对齐所有|号
            ,a<enter>**|      依次右左对齐所出现的|号
            ,<enter><enter>*| 居中对齐所有|号

    同类插件 [tabular](https://github.com/godlygeek/tabular)




> 快速移动

1. ####位置跳转[Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)

    必装，效率提升杀手锏，跳转到光标后任意位置

    easymothion主要用于快速查找跳转,(还支持多字母搜索跳转，不过我认为有/就够了)

    默认为2个<leader>+单字母，为了避免快捷键冲突
    以下是我改的一些快捷键，我觉得能用到的

      "下面这个是大杀器啊，只要盯着你想跳转的词就好
      "记忆方式 [s]earch

        s或,,f[如sa]      查找'a',快速跳转定位到某个字符位置
        ,.      重复上一次easymotion命令



2. ####符号匹配跳转[vim-scripts/matchit.zip](https://github.com/vim-scripts/matchit.zip)

    必装

    % 匹配成对的标签，跳转



3. ####mark跳转 [kshenoy/vim-signature](https://github.com/kshenoy/vim-signature)

    必装, 快速打标签, 随时跳回标签位置(修复python自动去除空白函数和该插件冲突的问题)


        m[a-zA-Z]   打标签
        '[a-zA-Z]   跳转到标签位置
        '. 最后一次变更的地方
        '' 跳回来的地方

        m<space>    去除所有标签



> 快速选中

1. ####区块伸缩 [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)

    视图模式下可伸缩选中部分，用于快速选中某些块

        [sd]
        v 增加选中范围
        V 减少选中范围



2. ####多光标选中编辑 [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

    多光标批量操作

        [sd]
        ctrl + m 开始选择
        ctrl + p 向上取消
        ctrl + n 跳过
        esc   退出



> 文本对象扩展

1. ####自定义文本对象 [kana/vim-textobj-user](https://github.com/kana/vim-textobj-user)

   后面几个扩展对象的依赖

   更多其他扩展,见 [wiki](https://github.com/kana/vim-textobj-user/wiki)

   PS: 特希望有一个扩展支持 '' "" [] {} ()


2. ####行文本对象 [kana/vim-textobj-line](https://github.com/kana/vim-textobj-line)

   增加文本对象: l

        dal
        yal
        cil


3. ####缩进文本对象 [kana/vim-textobj-indent](https://github.com/kana/vim-textobj-indent)

   增加文本对象: i

   相同缩进属于同一块,对python很有用

        dai
        yai
        cii


4. ####文件文本对象 [kana/vim-textobj-entire](https://github.com/kana/vim-textobj-entire)

   增加文本对象: e

        dae
        yae
        cie


5. ####句子对象 [reedes/vim-textobj-sentence](https://github.com/reedes/vim-textobj-sentence)


6. ####引用对象 [reedes/vim-textobj-quote](https://github.com/reedes/vim-textobj-quote)


7. ####语法检查 [reedes/vim-textobj-quote](https://github.com/reedes/vim-textobj-quote)


8. ####单词检查 [reedes/vim-wordy](https://github.com/reedes/vim-wordy)



> 功能相关

1. ####搜索 [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)

    文件搜索,ack/Command-T需要依赖于外部包,不喜欢有太多依赖的,除非十分强大, 具体 [文档](http://kien.github.io/ctrlp.vim/)


        [sd] ctrl + p  打开ctrlp搜索
        "[F]ind [H]istory file
        [sd] ,fh       相当于mru功能，show recently opened files

        ctrl + j/k     进行上下移动
        ctrl + x/v     分屏打开该文件 [重要**]
        ctrl + t       在新tab中打开该文件

    当前文件快速函数搜索:[tacahiroy/ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky)

    解决问题:使用tagbar当函数比较多的时候,移动耗时较长,使用快速搜索快很多

    "记忆方式:可看做ctrlp的插件，然后[F]unky [F]unction,[F]unky

        ,ff   进入当前文件函数搜索
        ,f    搜索光标下单词对应函数[常用]



2. ####全局搜索插件(类sumlimetext) [dyng/ctrlsf.vim](https://github.com/dyng/ctrlsf.vim)

    解决了重构代码时需要修改多处的问题

    实话说不是很推荐，相当相当慢，慎用

        \       搜索光标下的词
        ,\      进入ctrlsf搜索的命令行模式
        进入左侧后的操作:
                    o - 打开[注意回车不能打开]
                    O - 在buffer中打开
                    t - 在tab中打开(建议)
                    T - Like t but focus CtrlSF window instead of opened new tab.
                    q - Quit CtrlSF window.



3. ####git 常用操作 [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

    git插件, 编辑文件时进行一些diff操作,例如diff

    关于提交的操作建议还是在shell中来执行

        [sd]
        ,gd   = git diff
		,gs   = git status
		,gb	  = git blame
		,gl   = git log
		,gc   = git commit
		,gp   = git push

    没有配置其他快捷键,可以参照github,自己增加修改映射



4. ####git状态 [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)

    git diff，相当赞啊，在同一个文件内,通过标记和高亮,显示本次文件变更点

        [sd]
        ,gg   = show diff status [gd被ycm占用了]



5.  ####gist [matten/gist-vim](https://github.com/mattn/gist-vim)
		[sd]



6. ####文件时光机 [sjl/gundo.vim](https://github.com/sjl/gundo.vim)

    编辑文件时光机

        "不常用，所以用两个<leader>
        [sd] ,,h  查看文件编辑历史

    附:同类插件 [mbbill/undotree](https://github.com/mbbill/undotree)



> 显示增强


1. ####状态栏增强 [bling/vim-airline](https://github.com/bling/vim-airline)

    之前使用powerline, 用airline替换, powerline的配置注释,需要的自行解开



2. ####括号上色高亮 [kien/rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim)



> 显示增强-主题

1. ####[altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)

    经典主题,目前我使用的,看起来舒服



2. ####[tomasr/molokai](https://github.com/tomasr/molokai)

    用sublime text2的同学应该很熟悉, 另一个主题,可选,偶尔换换味道



3. ####[chriskempson/vim-tomorrow-theme](https://github.com/chriskempson/vim-tomorrow-theme)

    另一款经典主题

    默认值提供solarized和molokai主题，其他主题需自行配置安装



> 快速导航

1. ####目录树 [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)

    必装,开启目录树导航

         [sd]
         ,n  打开 关闭树形目录结构
         ,nf 切换树形目录到当前文件位置

         在nerdtree窗口常用操作：(小写当前，大写root)
         I.......Toggle隐藏文件
         x.......收起当前目录树
         X.......递归收起当前目录树
         r.......刷新当前目录
         R.......刷新根目录树

         p.......跳到当前节点的父节点
         P.......跳到root节点
         k/j.....上下移动
         K.......到同目录第一个节点
         J.......最后一个节点

         o.......Open files, directories and bookmarks

         s.......split上下分屏[原来是i, 改键]
         v.......vsplit左右分屏[原来是s, 改键]

         C.......将当前目录设为根节点
         q.......关闭

    nerdtree配合tab非常赞, i/s 可以在右侧分屏打开



2. ####目录树tab增强 [jistr/vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)

    选装, 多个tab时, 保持NerdTree一致

    即Just one NerdTree，仅保持一个NerdTree实例



3. ####tab/buffer导航增强 [vim-ctrlspace](https://github.com/szw/vim-ctrlspace)

    必装, 多buffer/多tab, 方便的查看列表, 操作, 切换, 与nerdtree/tabs完美配合, 很强大, 目前只使用基础功能, 后续根据需要再完善

    注意: 有些人的ctrl+space被占用的, 配一个leader快捷键(下面是默认配置)

          let g:ctrlspace_default_mapping_key="<C-Space>"

    (同时可以看看文档前面部分针对tab的快捷键)

          ctrl+<space> 得到当前tab的buffer列表
          j/k     上下移动
          回车     跳转到
          v/V     vsp分屏打开, v会进入对应文件, V会保留在ctrlspace区域
          s/S     sp分屏打开

          l       展示/关闭tab列表
              j/k 或 [/] 上下移动
              =   给tab命名
              -   Move the current tab to the left (decrease its number)
              +   Move the current tab to the right (increase its number)
              Backspace Go back to Buffer List

          L   Jump to Tab List in Search Mode

          esc/q   close the list



4. ####Tag [majutsushi/tagbar](https://github.com/majutsushi/tagbar)

    必装,标签导航,纬度和taglist不同, taglist的替代者

    tagbar针对而一些语言的文档https://github.com/majutsushi/tagbar/wiki

    注意:之前版本有装taglist,决定用tagbar替代,taglist的配置注解未删除,需要的自行打开

        "记忆方式: ,[t]agbar toggle
         [sd] <leader>t 打开Tagbar



> 语言相关- 需要自定义编辑确认是否保留(默认打开)

1. ####LaTeX [vim-latex/vim-latex](https://github.com/vim-latex/vim-latex)

   vim下的LaTeX编辑插件,还算可以。但C-J会与切换窗口冲突，未解决，只能用<C-W>J来切换窗口

    "LaTeX-suit的常用快捷键:记忆方式:<leader>[L]aTeX

        <leader>ll：compile
        <leader>lv：view pdf
        <leader>ls: 正向搜索
        SumatraPDF中 双击: 反向搜索
        Ctrl-J： 跳到下一个++位置（place holder）
        F5：insert/wrap in environment
        F9：do a completion (ref, cite, lename)
        za：fold/unfold
        <leader>rf：refresh folding



2. ####Python

    Vim as a Python IDE, but much more than that!

    语法高亮[python-syntax](https://github.com/hdima/python-syntax)

    使用Python建议安装，python语法高亮,就是python.vim,在github,有维护和更新


    语法检查[kevinw/pyflakes-vim](https://github.com/kevinw/pyflakes-vim)

    虽然这个的作者推荐使用syntastic,但是这个插件对于pythoner还是很需要的

    因为有一个特牛的功能,fly check,即,编码时在buffer状态就能动态查错标记,弥补syntastic只能保存和打开时检查语法错误的不足


3. ####Golang

    Go语言自动补全[Blackrush/vim-gocode](https://github.com/Blackrush/vim-gocode)

    安装gocode之后 ,配置这个插件

        `which gocode` (add $GOPATH/bin to you $PATH)

    另一个插件[觉得太过庞大没有使用,golang开发者可以配置试用下] [fatih/vim-go](https://github.com/fatih/vim-go) [介绍](http://blog.gopheracademy.com/vimgo-development-environment)



4. ####Markdown

    [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)

    markdown语法,编辑md文件



5. ####HTML
	[mattn/webapi-vim](https://github.com/mattn/webapi-vim) 提供一些网页编程常用的方法


	[mattn/emmet-vim](https://github.com/mattn/emmet-vim) 即原来的zencoding，触发键改为了<c-e>

        let g:user_emmet_expandabbr_key = '<C-e>'
		let g:user_emmet_leader_key='<C-e>'
		<C-e>i  Update img size
		<C-e>k  Remove a Tag
		<C-e>j  Split/Join Tag
		<C-e>a  Make an anchor from a URL
		<C-y>A  Make some quoted text from a URL


	[docunext/closetag.vim](https://github.com/docunext/closetag.vim)  html/xml标签配对补全


	[hail2u/vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)  html/css的语法


	[gorodinskiy/vim-coloresque](https://github.com/gorodinskiy/vim-coloresque) 关于配色


	[tpope/vim-haml](https://github.com/tpope/vim-haml) 关于haml语法高亮


	[Valloric/MatchTagAlways](https://github.com/Valloric/MatchTagAlways) 高亮显示匹配的标签，未配置



6. ####Javascript

	[jelera/vim-javascript-syntax](https://github.com/jelera/vim-javascript-syntax) js语法高亮


    [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript) 缩进等


    [marijnh/tern_for_vim](https://github.com/marijnh/tern_for_vim) 配合ycm进行js/jquery自动补全,需要安装 tern_for_vim 并配置, 文档  [ternjs](http://ternjs.net/)

        cd ~/.vim/bundle/tern_for_vim && npm install  [需要npm支持]



	[elzr/vim-json](https://github.com/elzr/vim-json) json高亮

		[sd] ,jt		设置当前文件类型为json，激活json高亮


	[briancollins/vim-jst](https://github.com/https://github.com/)  格式调整



	[kchmck/vim-coffee-script](https://github.com/kchmck/vim-coffee-script) coffeescript



	[groenewege/vim-less](https://github.com/groenewege/vim-less) less


	[maksimr/vim-jsbeautify](https://github.com/maksimr/vim-jsbeautify)  js/html/css 格式化, 未配置


    [nono/jquery.vim](https://github.com/nono/jquery.vim) jquery高亮，未配置



7. ####PHP

	[spf13/PIV](https://github.com/spf13/PIV)


    [arnaud-lb/vim-php-namespace](https://github.com/arnaud-lb/vim-php-namespace)


	[beyondwords/vim-twig](https://github.com/https://github.com)



8. ####Jinja2

    [Glench/Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)

    jinja2 语法高亮



9. ####Ruby

    可以参考tpope的插件列表,很多跟ruby相关

    [tpope/vim-rails](https://github.com/tpope/vim-rails) 未配置


    [nelstrom/vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-ruby)


    [tpope/vim-endwise](https://github.com/tpope/vim-endwise) 未配置，有坑，自动加end


10. ####非语言语法高亮

    [evanmiller/nginx-vim-syntax](https://github.com/evanmiller/nginx-vim-syntax) 未配置



---------------------------
---------------------------

The End.

zhlinh

Email: zhlinhng@gmail.com

2015-06-08
