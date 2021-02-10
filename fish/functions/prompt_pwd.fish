#!/usr/bin/env fish

function prompt_pwd --description "Print the current working directory, shortened to fit the prompt"
    if git rev-parse --git-dir > /dev/null ^ /dev/null
        set -l rootpath (basename (git rev-parse --show-toplevel))

        echo -n (basename $rootpath)(__repo_path)' '(__prompt_git_info)
    else
        set -l realhome ~
        echo -n (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
    end
end

function __repo_path 
    set -l repopath (git rev-parse --show-prefix)
    test -n $repopath
        and set repopath "/$repopath"
    echo $repopath
end

function __prompt_git_info    
    set -l branch (git rev-parse --abbrev-ref HEAD)
    set -l git_status (git status --porcelain)

    set -l prompt_sufix "✓"
    test -n "$git_status" 
        and set prompt_sufix '✗'

    set -l prompt_suffix_color green
    test -n "$git_status"
        and set prompt_suffix_color yellow

    echo -n (set_color blue)$branch' '(set_color $prompt_suffix_color)$prompt_sufix
end
