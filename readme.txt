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


