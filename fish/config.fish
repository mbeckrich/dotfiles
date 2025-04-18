set fish_greeting ""

# Abbreviations 

abbr -a -- dotfiles 'git --git-dir=$HOME/c/.files/ --work-tree=$HOME'
abbr -a -- ls 'eza -aF --group-directories-first --hyperlink'
abbr -a -- lst 'eza -aFT --group-directories-first --hyperlink'
abbr -a -- gsl 'git status --long'
abbr -a -- gl 'git log | bat'
abbr -a -- gs 'git status --short'
abbr -a -- ec 'emacsclient --create-frame --no-wait --socket-name gui'
abbr -a -- et 'emacsclient --tty --socket-name tty'
abbr -a -- grep rg
abbr -a -- man batman

# `set`

set -Ux EDITOR 'subl -w'

set -gx FZF_DEFAULT_OPTS '-m --height=40% --layout=reverse 
    --info=inline --border --margin=1% --padding=2% --tabstop=2
    --color=16
    --preview "bat --style=full --color=always {}"
    --preview-window=:hidden
    --bind "?:toggle-preview"'

# ripgrep author recs using fd instead
# https://www.reddit.com/r/linux4noobs/comments/egb644/fzf_newcomer_fd_or_ripgrep/fc5li3r/
set -gx FZF_DEFAULT_COMMAND 'fd --type file --hidden --no-ignore'

chruby 3.3.0

zoxide init fish | source
starship init fish | source
~/.local/bin/mise activate fish | source
