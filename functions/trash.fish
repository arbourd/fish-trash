function trash -d "Moves files and folders to macOS trash"
    set -l trash_version "0.2.0"

    function __trash_usage
        echo "Usage: trash [file ...]"
    end

    function __trash_version -S
        echo "trash, version $trash_version"
    end

    function __trash_move -a path
        command mv $path ~/.Trash/
    end

    function __trash
        for path in $argv
            if command ls "$path" >/dev/null ^/dev/null
                __trash_move $path
            else
                echo "trash: $path: No such file or directory"
                return 1
            end
        end
    end

    if not test -d ~/.Trash/
        echo "Could not find trash folder at `~/.Trash`"
        return 1
    end

    if test (count $argv) -eq 0
        __trash_usage
        return 1
    end

    switch $argv[1]
        case "-h" "--help"
            __trash_usage
        case "-v" "--version"
            __trash_version
        case "*"
            __trash $argv
    end
end
