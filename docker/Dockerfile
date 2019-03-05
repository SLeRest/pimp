FROM archlinux/base

RUN rm /etc/pacman.d/mirrorlist
ADD mirrorlist  /etc/pacman.d/

RUN pacman -Syu --noconfirm git zsh neovim fzf tmux ack ripgrep
# RUN pacman -S --noconfirm rust
# RUN pacman -S --noconfirm python
# RUN pacman -S --noconfirm gcc

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir /root/.config /root/.config/nvim
RUN chsh -s /bin/zsh

ADD init.vim /root/.config/nvim
ADD .zshrc /root/
ADD .tmux.conf /root/

RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +PlugInstall +qa
