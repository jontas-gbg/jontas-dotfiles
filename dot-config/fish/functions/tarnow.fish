function tarnow
    set filename $argv[1]
    tar -acf $filename $argv[2..]
end

