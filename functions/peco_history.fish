function fuzzy_history
    set -l query (commandline)

    if test -n $query
        set query --query "$query"
    end

    set prompt --prompt "HISTORY> "
    if set -q $argv
        history | sed "s/\r//" | fzf $prompt $query | read line
    else
        history | sed "s/\r//" | fzf $prompt --query $argv | read line
    end
    commandline $line
end
