#!/usr/bin/env fish

function fish_prompt
    # $status gets nuked as soon as something else is run
    set -l last_status $status

    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    end

    if test $last_status -eq 0
        echo -n (set_color blue)(prompt_pwd)' '
    else
        echo -n (set_color red)(prompt_pwd)' '
    end

    set_color -o
    if test "$USER" = 'root'
        echo -n (set_color red)'# '
    end
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end
