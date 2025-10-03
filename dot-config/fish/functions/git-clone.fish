function git-clone
    # Check that one argument (URL) was given
    if test (count $argv) -ne 1
        echo "Usage: git-clone <repository-URL>"
        echo "Example: git-clone https://github.com/user/project.git"
        return 1
    end

    set -l repo_url $argv[1]
    set -l dest_dir "$HOME/.local/src"

    # Create the destination folder if it does not already exist
    mkdir -p "$dest_dir"

    echo "Cloning $repo_url to $dest_dir/..."

    # Run the actual git clone command
    # Add '--' at the end to protect against weird URLs
    command git clone $repo_url "$dest_dir" --
 
    # Check if the cloning succeeded
    if test $status -eq 0
        echo ""
        echo "Done. The repository is in $dest_dir/"
        
        # For convenience, try to switch directory
        # This extracts the directory name from the URL
        set -l repo_name (basename $repo_url .git)
       
        if test -d "$dest_dir/$repo_name"
            echo "Entering directory: $repo_name"
            cd "$dest_dir/$repo_name"
        end
    else
        echo "An error occurred during cloning." >&2
        return 1
    end
end
