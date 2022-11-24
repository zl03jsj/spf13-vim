#https://srayx.pro/#/login
#
curl https://iterm2.com/downloads/stable/iTerm2-3_4_17.zip
#
# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# install ohmyzsh theme p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 安装常用工具
brew install ctags node ack ag pkg-config autojump bat # bat 用于vim中 fzf preview window的语法高亮
npm install --global yarn
#
# 用于vim中，fzf 查找全局symbol时需要的命令， 否则会报错。
pip3 install pynvim, jedi // jedi 用于支持python的语法跳转

# 安装rust
curl https://sh.rustup.rs -sSf | sh

# 为neovim安装plug插件
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

rm -f ~/.vimrc*
ln -s -f /Users/zl/.spf13/.vimrc ~/.vimrc
ln -s -f /Users/zl/.spf13/.vimrc.before ~/.vimrc.before
ln -s -f /Users/zl/.spf13/.vimrc.fork ~/.vimrc.fork
ln -s -f /Users/zl/.spf13/.vimrc.before.fork ~/.vimrc.before.fork 
ln -s -f /Users/zl/.spf13/.vimrc.local ~/.vimrc.local
ln -s -f /Users/zl/.spf13/.vimrc.bundles ~/.vimrc.bundles
ln -s -f /Users/zl/.spf13/.vimrc.bundles.default ~/.vimrc.bundles.default
ln -s -f /Users/zl/.spf13/.vimrc.bundles.local ~/.vimrc.bundles.local

# todo: check if ~/.config/nvim directory exists.
mkdir ~/.config/nvim && \
    ln -s -f /Users/zl/.spf13/.vimrc ~/.config/nvim/init.vim && \
    ln -s -f /Users/zl/.spf13/coc-settings.json ~/.config/nvim/coc-settings.json


# cd ~/.vim/bundle/coc.nvim && yarn install --frozen-lockfile
#
# 安装vim-go插件
# GoInstallBinaries
# 安装coc extension
#
# CocInstall coc-marketplace coc-tsserver coc-rust-analyzer coc-json coc-tsserver coc-fzf-preview coc-python

# 设置git ssh代理：~/.ssh/config
# Host github.com *.github.com
    # User git
    # Hostname github.com
    # ProxyCommand nc -X 5 -x 127.0.0.1:7890 %h %p

# 设置私有仓库地址域名映射静态地址： /etc/host 文件增加：
# 192.168.1.251 gitlab.forceup.in
#
# 设置go环境变量
# go env -w GO111MODULE=on
# go env -w GOPRIVATE="gitlab.forceup.in"
# go env -w GOPROXY="https://proxy.golang.org,direct"
# go env -w GOINSECURE="goproxy.io,gitlab.forceup.in"
