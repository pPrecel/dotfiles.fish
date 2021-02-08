#!/usr/bin/env fish

cd fisher
for func in functions/*.fish
    cp $argv[1]/fisher/$func $argv[2]/$func
end
