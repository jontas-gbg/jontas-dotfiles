alias ls='eza -al --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias ll='eza -l --color=always --group-directories-first --icons'
alias lt='eza -aT --color=always --group-directories-first --icons'
alias l.="eza -a | grep -e '^\.'"

alias c='clear'
alias v='sudo nano'
alias cat='bat'
alias yay='paru'
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias untar='tar -zxvf '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ping='ping -c 5'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias hw='hwinfo --short'             
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
alias mirror="sudo cachyos-rate-mirrors"

alias updf='fc-cache -f -v'
alias radera='shred -vzun 100'
alias speedtest='speedtest++ --download'

alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

alias jctl="journalctl -p 3 -xb"
alias vdw='curl -s "https://wttr.in/Landvetter?M&T&F&lang=sv"'

