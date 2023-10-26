if status is-interactive
    # Commands to run in interactive sessions can go here
end

function __tabby_working_directory_reporting --on-event fish_prompt
    echo -en "\e]1337;CurrentDir=$PWD\x7"
end

alias ls="exa -l --header --group --icons --sort=name --group-directories-first"
alias ll="ls -a --header --group"

alias bat='batcat --paging=never --color=always --style="header,grid"'

fzf_configure_bindings --directory=\cf --variables=\ce --processes=\cp

starship init fish | source
