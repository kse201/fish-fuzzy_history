function fuzzy_history
    set -l query (commandline)

    set prompt "HISTORY> "
    history | sed "s/\r//" | fzf --prompt $prompt --query $query | read line
    commandline $line
end
