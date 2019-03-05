FROM base/archlinux

RUN rm /etc/pacman.d/mirrorlist
ADD mirrorlist  /etc/pacman.d/

RUN pacman -Syu --noconfirm git zsh neovim rust ripgrep ack fzf gcc
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir /root/.config
RUN mkdir /root/.config/nvim
RUN chsh -s /bin/zsh

ADD init.vim /root/.config/nvim
ADD .zshrc /root/

RUN nvim -i NONE -c PlugInstall -c quitall > /dev/null 2>&1
