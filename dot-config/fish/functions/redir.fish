# Check redirection from URL shortener to prevent phising
# curl flags:
#   -I (HEAD)
#   -L (Follow redirect)

function redir
    echo "Check redirect for URL: $argv[1]"
    curl -I -L $argv[1]
end
