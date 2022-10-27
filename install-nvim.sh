# install ohmyzsh
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#brew install autojump
#brew install ctags
#curl https://sh.rustup.rs -sSf | sh
#brew install node
#brew install pkg-config

#npm install --global yarn

#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

rm -f ~/.vimrc*
ln -s -f /Users/zl/.spf13/.vimrc ~/.vimrc
ln -s -f /Users/zl/.spf13/.vimrc.before ~/.vimrc.before
ln -s -f /Users/zl/.spf13/.vimrc.fork ~/.vimrc.fork
ln -s -f /Users/zl/.spf13/.vimrc.before.fork
ln -s -f /Users/zl/.spf13/.vimrc.local ~/.vimrc.local
ln -s -f /Users/zl/.spf13/.vimrc.bundles ~/.vimrc.bundles
ln -s -f /Users/zl/.spf13/.vimrc.bundles.default ~/.vimrc.bundles.default
ln -s -f /Users/zl/.spf13/.vimrc.bundles.local ~/.vimrc.bundles.local

# todo: check if ~/.config/nvim directory exists.
mkdir ~/.config/nvim && \
    ln -s -f /Users/zl/.spf13/.vimrc ~/.config/nvim/init.vim && \
    ln -s -f /Users/zl/.spf13/coc-settings.json ~/.config/nvim/coc-settings.json

# cd ~/.vim/bundle/coc.nvim && yarn install --frozen-lockfile

# 安装vim-go插件
# GoInstallBinaries
# 安装coc extension
# CocInstall coc-marketplace
# CocInstall coc-tsserver
# CocInstall coc-rust-analyzer
# CocInstall coc-json
# CocInstall coc-tsserver
# CocInstall coc-fzf-preview


# 设置git ssh代理。
# Host github.com *.github.com
    # User git
    # Hostname github.com
    # ProxyCommand nc -X 5 -x 127.0.0.1:7890 %h %p
