#!/usr/bin/env fish

function fish_prompt
    # $status gets nuked as soon as something else is run
    set -g last_status $status

    test -n "$SSH_TTY"
        and __ssh_prompt
        or __common_prompt

    set_color normal
end

function __ssh_prompt
    echo -n (set_color (__status_color))"$USER"(set_color white)'@'(set_color yellow)(pwd)' '
end

function __common_prompt
    test "$USER" = 'root'
        and echo -n (set_color (__status_color))'[ # ] '
        or  echo -n (set_color (__status_color))(__status_symbol)' '
    echo -n (set_color normal)(__prompt_pwd)' '
end

function __status_color 
    test $last_status -eq 0
        and echo -n '78ab21'
        or echo -n 'dc3936'
end

function __status_symbol
    test $last_status -eq 0
        and echo -n '[･‿･]'
        or echo -n '[ಠ_ಠ]'
end
