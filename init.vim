"==============================================================================
" => General
"==============================================================================
set nocompatible
":命令显示历史
set history=500
 
"去掉gvim菜单栏
"set go-=m
"去掉gvim工具栏
set go-=T
 
"normal模式下取消输入法
 InsertLeave *    set imdisable
 InsertEnter *    set noimdisable
 
"开启插件和缩进
filetype plugin indent on
 
set autoread
set mouse=a
set mousehide
 
"设置无响铃
set novisualbell
"字体设定
if has("win32")
    set guifont=黑体:h13:cANSI    
elseif has("unix")    
    set guifont=Andale\ Mono\ 12
endif
 
"设置 mapleader = ,
let g:mapleader= ","
 
"快速存储和关闭
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qq :q!<cr>
nmap <leader>wq :wq<cr>
"打开最近文件
map <leader>m:MRU<cr>
 
map <leader>ax:!chmod a+x%<cr><cr>
 
"Favorite filetypes
if has("win32")
    set ffs=dos,unix,mac
elseif has("unix")
    set ffs=unix,dos,mac
endif
 
"编码设定Encoding
set fileencoding=utf-8
set fileencodings=utf-8,gbk,utf-16,big5
 
set langmenu=zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.UTF-8
"==============================================================================
" => fast edit vimrc 快速编辑vimrc
"==============================================================================
if has("win32")
    "Fast editing of _vimrc
    map <leader>e: $VIM/_vimrc<cr>
    "reload _vimrc
    map <leader>s :source $VIM/_vimrc<cr>
    "When .vimrc is edited, reload it
     bufwritepost vimrc source /$VIM/_vimrc
elseif has("unix")
    "Fast editing of .vimrc
    map <leader>e :e! $HOME/.vimrc<cr>
    "reload _vimrc
    map <leader>s:source $HOME/.vimrc<cr>
    "When .vimrc is edited, reload it
    autocmd! bufwritepost vimrc source ~/.vimrc
endif
"==============================================================================
" => Serach
"==============================================================================
"忽略大小写检索
set ignorecase
"输入检索时动态变化
set incsearch
"检索高亮
set hlsearch
"==============================================================================
" => Colors and Fonts
"==============================================================================
"语法高亮 Enable syntax highlight
syntax enable
 
if has("gui_running")
    if has("win32")
        "Auto Maximize when gvim startup inWindow system.
        au GUIEnter * simalt ~x
    endif
endif
 
"主题颜色设定
"colorscheme torte
"colorscheme molokai
"colorscheme lettuce
"colorscheme navajo-night
 
autocmd BufEnter * :syntax sync fromstart
 
"高亮当前行 Highlight current
set cursorline
 
"Display tab as >----，and trail spaces of the line as -
"set listchars=tab:>-,trail:-
"==============================================================================
" VIM userinterface
"==============================================================================
 
"Turn on WiLd menu
set wildmenu
set wildignore=*.bak,*.o,*.e,*~
 
"Always show current position
set ruler
 
"The commandbar is 2 high
set cmdheight=2
set showcmd
 
"Show line number
set number
 
"Do not redraw, when running macros.. lazyredraw
set lazyredraw
 
"Change buffer - without saving
set hidden
 
"Set backspace
set backspace=eol,start,indent
 
"Backspace and cursor keys wrap to
set whichwrap+=<,>,[,],h,l
 
" 光标移动到buffer的顶部和底部时保持三行差距
set scrolloff=3
"==============================================================================
" => Status line
"==============================================================================
 
function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction
 
"状态栏显示参数 Format the status line
set statusline=\%F%m%r%h\%w\ \ CWD:\%r%{CurDir()}%h\\ \ Line:\%l/%L:%c\\ \ %p%%
set laststatus=2
"==============================================================================
" Tab configuration
"==============================================================================
"译注:将当前内容在新标签中打开
map <leader>tn:tabnew %<cr>
"译注:打开空白新标签
map <leader>te :tabedit
"译注:关闭当前标签
map <leader>tc:tabclose<cr>
"译注:移动当前标签,使用方法为
map <leader>tm :tabmove
"让 gvim 支持 Alt+n 来切换标签页
autocmd VimEnter * call BufPos_Initialize()
"==============================================================================
" for lookupfile.vim
"==============================================================================
let g:LookupFile_MinPatLength = 2 "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern= 0 "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1 "保存查找历史
let g:LookupFile_AlwaysAcceptFirst= 1 "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0 "不允许创建不存在的文件
if filereadable("./tags")"设置tag文件的名字
    let g:LookupFile_TagExpr = '"./tags"'
endif
"==============================================================================
" moving around
"==============================================================================
"window move
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l
"nomal模式下tab来切换窗口
nmap <tab><C-W>w
",v 打开水平窗口
map <leader>v :vsplit<cr>
 
"buffer Switch
map <A-j>:bp<cr>
map <A-k>:bn<cr>
"==============================================================================
" 缩进设置 Indent
"==============================================================================
"Auto indent
set autoindent
 
"Smart indent
set smartindent
 
"C-style indenting
set cindent
 
"Wrap lines
set wrap
"==============================================================================
" => Folding
"==============================================================================
"Enable folding, I find it very useful
set foldmethod=syntax
set nofoldenable
"==============================================================================
" => Files and backups
"==============================================================================
"Turn backup off
set nobackup
set nowritebackup
set noswapfile
"==============================================================================
" => Text options
"==============================================================================
"四字符缩进
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab
 
set ambiwidth=double
"自动拆分行
set linebreak
 
" txt file auto insert linebreak after 78 char
"au FileType txt set tw=78 fo+=Mm
 
" C file
"au FileType c,cpp setl sw=8 ts=8
"对C,Cpp和perl文件保存并调试
au FileType c nmap <leader>tt :w<cr>:!gcc -o %:r %<cr>
au FileType cpp nmap <leader>tt :w<cr>:!g++ -o %:r %<cr>
au FileType perl nmap <leader>tt :w<cr>:!perl %<cr>
au FileType tex nmap <leader>tt :w<cr>:!latex %<cr>:!dvipdfm %:s/.tex/.dvi/<cr>:!gnome-open %:s/.tex/.pdf/<cr>
"cmake 自动补全
au FileType cmake set dict+=$HOME/.vim/cmake.txt
"==============================================================================
"for latex-suit.vim
"==============================================================================
au FileType tex so ~/.vim/ftplugin/tex_latexSuite.vim
if has("win32")
    set shellslash
endif
"filetype indent on
let g:tex_flavor= 'latex'
set grepprg=grep\-nH\ $*
let g:Tex_CompileRule_dvi= 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps= 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf= 'ps2pdf $*.ps'
"==============================================================================
"some key map
"==============================================================================
",cd Switch to current dir
map <leader>cd:cd %:p:h<cr>:set tags+=tags<cr>:cs add cscope.out<cr>
"F4 保存并make
map <F4> :w!<cr>:make<cr>
"清除高亮显示
map <F2>:nohl<cr>
"Super paste 可在不同文件的文本框中复制粘贴
"插入模式下C-a全局选中
inoremap <C-a><esc>ggVG
"可视模式下对选中模块进行复制C-c或剪切C-x
vmap <C-c> "+y
vmap <C-x>"+x
"插入模式下C-v粘贴
inoremap <C-v><esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
"==============================================================================
"for a.vim
"==============================================================================
",a和,aa C/C++源文件和头文件切换
map <leader>a:A<cr>
map <leader>aa:A<cr>
",as 在竖直方向新窗口中打开对应源文件或头文件
map <leader>as :AS<cr>
",av 在水平方向新窗口中打开对应源文件或头文件
map <leader>av:AV<cr>
",at 在新标签页中打开对应源文件或头文件
map <leader>at :AT<cr>
"==============================================================================
"for NERD_commenter.vim 智能注释
"==============================================================================
"空格键添加去除注释
"map <space><leader>ci
map <space><plug>NERDCommenterInvert
let NERDCreateDefaultMappings=0
"==============================================================================
"for NERD_tree.vim
"==============================================================================
map <F11> :NERDTreeToggle <cr>
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
"==============================================================================
"for taglist.vim
"==============================================================================
map <F10>:TlistToggle<cr>
let Tlist_Enable_Fold_Column = 0
let Tlist_WinWidth = 25
let Tlist_Show_One_File = 1
let g:Tb_ForceSyntaxEnable= 1
"==============================================================================
"for OmniCppComplete.vim 补全插件
"==============================================================================
set completeopt=menu
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_DefaultNamespaces = ["std"] " 逗号分割的字符串
let OmniCpp_MayCompleteScope = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_SelectFirstItem = 2
" c-j自动补全，当补全菜单打开时，c-j,k上下选择
"imap <expr><c-j> pumvisible()?"\<C-N>":"\<C-X><C-O>"
"imap <expr> <c-k> pumvisible()?"\<C-P>":"\<esc>"
" f:文件名补全，l:行补全，d:字典补全，]:tag补全
"imap <C-D> <C-X><C-]>
"imap <C-F><C-X><C-F>
"imap <C-]> <C-X><C-D>
"imap <C-L><C-X><C-L>
"==============================================================================
"for DoxygenToolkit.vim doxygen注释插件
"==============================================================================
let g:DoxygenToolkit_authorName = "Xu Wenzhang(xwz), carl.xwz@gmail.com, http://xuwenzhang.org"
let g:DoxygenToolkit_versionString = "1.0"
"let s:licenseTag= "Copyright(C)\<enter>"
"let s:licenseTag = s:licenseTag . "For free\<enter>"
"let s:licenseTag= s:licenseTag. "All right reserved\<enter>"
"let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_briefTag_className="yes"
let g:doxygen_enhanced_color=1
 
",<space> 用doxygen模式来注释
map <leader><space>:Dox<cr>
",hd 加入doxygen注释文件头
map <leader>hd gg:DoxLic<cr>:DoxAuthor<cr>
"==============================================================================
"for c-support
"==============================================================================
"c-support时间格式设定
let g:C_FormatDate = '%F'
let g:C_FormatTime = '%H:%M'
let g:C_FormatYear             = 'year %Y'
"==============================================================================
"for vimwiki
"==============================================================================
let g:vimwiki_use_mouse= 1
"设置vimwiki目录
let g:vimwiki_list = [{'path': '~/vimwiki/wiki/', 'path_html': '~/vimwiki/html/'}]
"au filetype vimwiki map <leader>tt<Plug>VimwikiToggleListItem
"打开当前链接
au filetype vimwiki map <Leader>wf <Plug>VimwikiFollowLink
"在新窗口中打开当前链接
au filetype vimwiki map <Leader>we<Plug>VimwikiSplitLink
"在新标签中打开日志wiki,即以当天日期命名的wiki
au filetype vimwiki map <Leader>dt <Plug>VimwikiTabMakeDiaryNote
"保存当前文件,将当前vimwiki文件转为html,并且打开当前网页
au filetype vimwiki map <leader>tt:w<cr>:Vimwiki2HTML<cr>:!google-chrome%:p:s?/wiki/?/html/?:s?\.wiki?\.html?<cr><cr>
"保存所有文件,将所有vimwiki文件转为html,并且打开当前网页
au filetype vimwiki map <leader>ta :wa<cr>:VimwikiAll2HTML<cr>:!google-chrome %:p:s?/wiki/?/html/?:s?\.wiki?\.html?<cr><cr>
"==============================================================================
"for ScrollColor.vim
"==============================================================================
"浏览主题颜色
map <silent><F7> :NEXTCOLOR<cr>
map <silent><F6> :PREVCOLOR<cr>
"==============================================================================
"for ctags
"==============================================================================
map <F12>:call Do_CsTag()<cr>
 Do_CsTag()
    let dir = getcwd()
 
    "先删除已有的tags和cscope文件，如果存在且无法删除，则报错。
    if ( DeleteFile(dir, "tags") )
        return
    endif
    if ( DeleteFile(dir, "cscope.files") )
        return
    endif
    if ( DeleteFile(dir, "cscope.out") )
        return
    endif
 
    if(executable('ctags'))
        " execute "!g++ -E % -o tmpcpp -I../eg"
         execute "!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q --language-force=C++ ."
        "silent! execute "!unlink tmpcpp"
    endif
    if(executable('cscope') && has("cscope") )
        if(has("win32"))
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs>> cscope.files"
        else
            silent! execute "!find . -iname '*.[ch]'-o -name '*.cpp'> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
    " 刷新屏幕
    execute "redr!"
endfunction
 
 DeleteFile(dir, filename)
    if filereadable(a:filename)
        if (has("win32"))
            let ret = delete(a:dir."\\".a:filename)
        else
            let ret = delete("./".a:filename)
        endif
        if (ret!= 0)
            echohl WarningMsg | echo "Failed to delete ".a:filename| echohl None
            return 1
        else
            return 0
        endif
    endif
    return 0
endfunction
 
set tags=tags,../tags
 
 Add_tags()
"Add tags file
if has("win32")
    set tags+=
elseif has("unix")
    set tags+=/usr/include/tags,/usr/src/tags
endif
"Add cscope file
    if has("cscope")&& has("unix")
        if filereadable("/usr/src/cscope.out")
            cs add /usr/src/cscope.out/usr/src/
        endif
 
        if filereadable("/usr/include/cscope.out")
            cs add /usr/include/cscope.out/usr/include/
        endif
    endif
endfunction
 
" cscope 绑定
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    " s: C语言符号 g: 定义 d: 这个函数调用的函数 c: 调用这个函数的函数
    " t: 文本 e: egrep模式 f: 文件 i: include本文件的文件
    nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
"用A-Num来切换标签
 BufPos_ActivateBuffer(num)
    let l:count= 1
    for i in range(1, bufnr("$"))
        if buflisted(i)&& getbufvar(i,"&modifiable")
            if l:count== a:num
                exe "buffer " . i
                return
            "endif
            let l:count = l:count + 1
        endif
    endfor
    echo "No buffer!"
endfunction
function! BufPos_Initialize()
    for i in range(0, 9)
        exe "map <M-" . i . ">" . i . "gt"
    endfor
endfunction
 
"进入文件所在目录然后
cd %:p:h
"set tags+=tags
"cs add cscope.out
