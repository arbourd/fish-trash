set VERSION "0.1.0"

function trash -d "Moves files and folders to macOS trash" -a path
    function __trash_usage
        echo "Usage: trash [PATH]"
    end

    function __trash_version
        echo "trash, version $VERSION"
    end

    function __trash_move -S
        if test -d "$path" -o -f "$path"
            command mv $path ~/.Trash/
        else
            __trash_usage
            return 1
        end
    end

    if not test -d ~/.Trash/
        echo "Could not find trash folder at `~/.Trash`"
        return 1
    end

    if test (count $argv) -ne 1
        __trash_usage
        return 1
    end

    set path $argv[1]
    switch $path
        case "-h" "--help"
            __trash_usage
        case "-v" "--version"
            __trash_version
        case "*"
            __trash_move
    end
end
