https://yianwillis.github.io/vimcdoc/doc/map.html

编辑配置文件:
<Leader>ev opens a new tab containing the .vimrc configuration files listed above. This makes it easier to get an overview of your configuration and make customizations.
<Leader>sv sources the .vimrc file, instantly applying your customizations to the currently running vim instance.
修改默认快捷键.vimrc.before.local:
let g:spf13_edit_config_mapping='<Leader>ev'
let g:spf13_apply_config_mapping='<Leader>sv'

easymotion:

youcompleteme:
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

注释:
<leader>cc

打开目录树:
<leader>e
<leader>nt
<c-e>

添加引号:
ysiw?  添加一对符号
ds? 删除一对符号
cs?? 修改一对符号

窗口尺寸调整:
ctrl+w n <|>


文件格式化 快捷键ctrl+l
代码提示补全快捷键ctrl+k


1) 在.vimrc.bundles.local中添加:
Bundle 'Chiel92/vim-autoformat'
2) 安装格式化外部工具:
参考: https://wsxq2.55555.io/blog/2018/11/25/Vim%E4%BB%A3%E7%A0%81%E6%A0%BC%E5%BC%8F%E5%8C%96%E6%8F%92%E4%BB%B6vim-autoformat/
Artistic Style:https://blog.csdn.net/wenfh2020/article/details/80255918


alt键的使用
https://www.reddit.com/r/vim/comments/8r4ny7/mapping_alt_on_mac/
