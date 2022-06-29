### vim基础快捷键

键映射: 
https://zhuanlan.zhihu.com/p/101615324

光标移动基础指令:
https://linux265.com/course/vim-cursor-movement.html
https://yianwillis.github.io/vimcdoc/doc/map.html

zz/z., zt/z+enter, z- 滚动光标所行到中间,顶部,底部

H,M,L 移动到屏幕顶部,中间,底部
nH, nl 移动到屏幕顶端/底部第n行

ctrl + o/i 返回/前进 之前的位置

Ctrl + F——向前滚动一整屏
Ctrl + B——向后滚动一整屏
Ctrl + D——向前（下）滚动半屏
Ctrl + U——向前滚动半屏
Ctrl + E——向上滚动一行
Ctrl + Y——向下滚动一行

窗口尺寸调整: ctrl+w n < | >

文件格式化快捷键    ctrl+l
代码提示补全快捷键  ctrl+k

在当前文档中, 高亮光标下的内容:
ctrl w = *

tagbar: ,tt

YouCompleteMe: 
hover提示信息: <leader>h

[参考内容](https://blog.stdio.io/1103)
设置系统自带的rust tool chain 路径, 使用系统自带的rust工具链, 在编译ycm时, 不要使用:
`python3 ./install.py --rust-completer`
否则YCM会自动下载一个特定版本的rust工具链, 通过设置下面的变量来设置工具链位置:
let g:ycm_rust_toolchain_root = '/Users/zl/.rustup/toolchains/nightly-x86_64-apple-darwin'
let g:ycm_rust_src_path = '/Users/zl/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'




缓冲区:
:ls 查看缓冲区
:bdelete n 删除n号缓冲区
:1,5 bdelate 删除1和5缓冲区
bufdo [command] : 对每一个buff都执行命令, 例如:

### vim 调试命令

查看在哪儿设置了conceallevel变量
verbose set conceallevel? concealcursor?

查看map映射:
例如要查看快捷键',,f'是设置的具体位置, 使用下面的命令:
:verbos map ,,f:
查看insert 模式, no recursive的关于'(单引号)的快捷键的详细信息:
:verbos inoremap '  
查看函数详细信息:
:verbos funcition func-name 

### 插件

NeerdTree(资源浏览器):
ctl+e 打开资源浏览器
t 在新tab中打开文件

tab页编辑:
:tabnew
:b1/2/3...n
gt 选中后一个tab
gT 选中前一个tab
:tabnew | bn 在新tab中打开n号缓冲区的文件
:tab ball 为每个buffer文件新建一个tab页
:tabe % 在新的tab中打开当前文件
:tab split 


### spf13 配置相关

- <Leader>ev
opens a new tab containing the .vimrc configuration files listed above. This makes it easier to get an overview of your configuration and make customizations.
- <Leader>sv 
sources the .vimrc file, instantly applying your customizations to the currently running vim instance.
- 修改默认快捷键.vimrc.before.local:
let g:spf13_edit_config_mapping='<Leader>ev'
let g:spf13_apply_config_mapping='<Leader>sv'

### easymotion:

youcompleteme:
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

注释:
<leader>cc

打开目录树:
<leader>e, <leader>nt, <c-e>

添加引号:
ysiw?  添加一对符号
ds? 删除一对符号
cs?? 修改一对符号


1) 在.vimrc.bundles.local中添加:
Bundle 'Chiel92/vim-autoformat'
2) 安装格式化外部工具:
参考: https://wsxq2.55555.io/blog/2018/11/25/Vim%E4%BB%A3%E7%A0%81%E6%A0%BC%E5%BC%8F%E5%8C%96%E6%8F%92%E4%BB%B6vim-autoformat/
Artistic Style:https://blog.csdn.net/wenfh2020/article/details/80255918

alt键的使用
https://www.reddit.com/r/vim/comments/8r4ny7/mapping_alt_on_mac/



http://vim.spf13.com/
在.vimrc.befor 中注释掉(关于json双引号的问题):
let g:spf13_no_conceal = 1


Split window resize:
:res +/-5
:vertical res/resize +/-5 增加
ctrl-w > 增加
ctrl-w < 减少
To resize all windows to equal dimensions based on their splits, you can use Ctrl-w =
To increase a window to its maximum height, use Ctrl-w _.
To increase a window to its maximum width, use Ctrl-w |.


SPF13: http://vim.spf13.com/
,sv = source .vimrc
,ev = edit configurations

esay motion

surround
 Old text                  Command     New text ~
  "Hello *world!"           ds"         Hello world!
  [123+4*56]/2              cs])        (123+456)/2
  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
  if *x>3 {                 ysW(        if ( x>3 ) {
  my $str = *whee!;         vllllS'     my $str = 'whee!';
For instance, if the cursor was inside "foo bar", you could type cs"' to convert the text to 'foo bar'.
NERDCommenter comment++
NERDCommenter allows you to wrangle your code comments, regardless of filetype. View help :NERDCommenter for all the details.
QuickStart Toggle comments using <Leader>c<space> in Visual or Normal mode.
2<leader>cc  2 lines comment with `//`
2<leader>cm 2 lines comment with '/**/
NERDTree 
QuickStart Launch using <Leader>e.
Customizations:
	•	Use <C-E> to toggle NERDTree
	•	Use <leader>e or <leader>nt to load NERDTreeFind which opens NERDTree where the current file is located.
	•	Hide clutter ('.pyc', '.git', '.hg', '.svn', '.bzr')
	•	Treat NERDTree more like a panel than a split.


### 全局查找Ack插件
地址: https://github.com/mileszs/ack.vim
```shell
brew insall ack
```

### 输入法自动切换
https://cloud.tencent.com/developer/article/1877309
Bundle 'ybian/smartim'

FAQ:
1. 每次打开某个文件时(如:~/.vimrc), 都会自动折叠所有内容. 
    编辑~/.vimrc,设置将`set foldenable`注释掉. 打开一次文件后, 按`zn`., `zn`的解释如下:
    zn Fold none: reset 'foldenable'.  All folds will be open.











