# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jaden/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Colors
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

#Colored Prompts
autoload -U promptinit && promptinit
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#im using arch btw
alias btw='neofetch'
alias nv='nvim'
alias ls='ls -A'
alias shutdown='shutdown -h now'
alias cl='clear'
alias ci3='nvim ~/.config/i3/config'
alias regengrub='sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB && sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
#Environment Variables
export VISUAL=nvim
export EDITIOR=nvim
alias vim=nvim
export PATH=/home/jaden/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

PATH="/home/jaden/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/jaden/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/jaden/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/jaden/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jaden/perl5"; export PERL_MM_OPT;
