mivim
====================
# 自定义快捷键
    注意, 以下 `,` 代表<leader>
    1. 可以自己修改vimrc中配置，决定是否开启鼠标

    set mouse-=a           " 鼠标暂不启用, 键盘党....
    set mouse=a            " 开启鼠标

    2. 可以自己修改vimrc决定是否使用方向键进行上下左右移动，默认关闭，强迫自己用 hjkl，可以注解
    hjkl  上下左右

    map <Left> <Nop>
    map <Right> <Nop>
    map <Up> <Nop>
    map <Down> <Nop>

    3. 上排F功能键

    F1 废弃这个键,防止调出系统帮助
    F2 set nu/nonu,行号开关，用于鼠标复制代码用
    F3 set list/nolist,显示可打印字符开关
    F4 set wrap/nowrap,换行开关
    F5 set paste/nopaste,粘贴模式paste_mode开关,用于有格式的代码粘贴
    F6 syntax on/off,语法开关，关闭语法可以加快大文件的展示

    F9 tagbar
    F10 运行当前文件(quickrun)

    4. 分屏移动

    ctrl + j/k/h/l   进行上下左右窗口跳转,不需要ctrl+w+jkhl

    5. 搜索
    <space> 空格，进入搜索状态
    /       同上
    ,/      去除匹配高亮

    优化搜索保证结果在屏幕中间

    6. tab操作(重点推)
    ctrl+t 新建一个tab

    (hjkl)
    ,th    切第1个tab
    ,tl    切最后一个tab
    ,tj    下一个tab
    ,tk    前一个tab

    ,tn    下一个tab(next)
    ,tp    前一个tab(previous)

    ,td    关闭tab
    ,te    tabedit
    ,tm    tabm

    ,1     切第1个tab
    ,2     切第2个tab
    ...
    ,9     切第9个tab
    ,0     切最后一个tab

    ,tt 最近使用两个tab之间切换
    (可修改配置位 ctrl+o,  但是ctrl+o/i为系统光标相关快捷键, 故不采用)

    7. buffer操作(不建议, 建议使用ctrlspace插件来操作)
    [b    前一个buffer
    ]b    后一个buffer
    <-    前一个buffer
    ->    后一个buffer


    8. 按键修改
    Y         =y$   复制到行尾
    U         =Ctrl-r
    ,sa       select all,全选
    ,v        选中段落
    kj        代替<Esc>，不用到角落去按esc了
    
    ,p     ="+p  粘贴系统剪切板的内容到光标后
    ,P     ="+P  粘贴系统剪切板的内容到光标前  

    ,q     :q，退出vim

    ctrl+n    相对/绝对行号切换
    <enter>   normal模式下回车选中当前项

