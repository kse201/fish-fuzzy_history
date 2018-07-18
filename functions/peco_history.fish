function peco_history
    set -l query (commandline)

    if test -n $query
        set peco_flags --query "$query"
    end

    set prompt 'HISTORY>'
    if set -q $argv
        history | peco --prompt $prompt $peco_flags | read line
    else
        history | peco --prompt $prompt --query $argv | read line
    end
    commandline $line
end
