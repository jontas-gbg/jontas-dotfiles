function find_var
    if not count $argv > /dev/null
        echo "Usage: find_var <term>"
        echo "Exemple: find_var active_opacity"
        return 1
    end

    set searchterm $argv[1]
    grep -r --include="*.conf" "$searchterm" ~/.config/hypr/config
end
