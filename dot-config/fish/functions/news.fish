
function news
    set -l filepath ~/.local/share/Q/nyheter

    while true
        switch "$argv[1]"
            case '-n'
                set filepath ~/.local/share/Q/nyheter
                set -e argv[1]
            case '-t'
                set filepath ~/.local/share/Q/tech
                set -e argv[1]
            case '*'
                break
        end
    end

    if not test -f "$filepath"
        echo "Error: '$filepath' was not found." >&2
        return 1
    end

     if cat "$filepath" | wl-copy
        echo "Copied to clipborad."
    else
        echo "Error: wl-copy failure)." >&2
        return 1
    end
end
