function fw
    set default_filename /tmp/jctl

    set filename $argv[1]
    if test -z "$filename"
        set filename $default_filename
    end

    echo "Check critical entries and pipe it to $filename"

    sudo journalctl --since=today -p crit | grep -i ufw > $filename

    # Check for data
    if test -s $filename
        echo "--------------------------------------------------------"
        echo -e "Critical entries found\nDisplaying $filename:"
        echo "--------------------------------------------------------"
        cat $filename
    else
        echo -e "*** No worries. No new records ***"
        if test "$filename" = "$default_filename"
            rm $filename
            echo "Temp file ($filename) removed."
        end
    end
end
