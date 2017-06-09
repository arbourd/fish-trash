set DIR (dirname $DIRNAME)
source "$DIR/functions/trash.fish"

set path "$DIR/test/fixtures"

function setup
    mkdir -p "$path"
    touch "$path/test1.file"
    touch "$path/test2.file"
end

function teardown
    if test (count (ls "$path")) -ne 0
        rm "$path"/*.file
    end
end

test "calling trash with --help shows usage"
    "Usage: trash [file ...]" = (trash --help)
end

test "calling trash with --help returns 0"
    "0" = (trash --help >/dev/null; echo $status)
end

test "calling trash with --version shows version"
    "trash, version 0.2.0" = (trash --version)
end

test "calling trash with --version returns 0"
    "0" = (trash --version >/dev/null; echo $status)
end

test "calling trash with no params shows usage"
    "Usage: trash [file ...]" = (trash)
end

test "calling trash with no params returns 1"
    "1" = (trash >/dev/null; echo $status)
end

test "calling trash with bad path shows error"
    "trash: $path/bad/path: No such file or directory" = (trash "$path/bad/path")
end

test "calling trash with bad path returns 1"
    "1" = (trash "$path/bad/path" >/dev/null; echo $status)
end

test "calling trash with multiple arguments moves files to trash"
    "passed" = (
        trash "$path/test1.file" "$path/test2.file"; if test (count (ls "$path")) -eq 0
            echo "passed"
        end
    )
end

test "calling trash with multiple params returns 0"
    "0" = (trash "$path/test1.file" "$path/test2.file"; echo $status)
end

test "calling trash with proper path moves file to trash"
    "passed" = (
        trash "$path/test1.file"; if not test -e "$path/test1.file"
            echo "passed"
        end
    )
end

test "calling trash with proper path returns 0"
    "0" = (trash "$path/test1.file"; echo $status)
end

test "calling trash with proper wildcard moves file to trash"
    "passed" = (
        trash "$path"/*.file; if test (count (ls "$path")) -eq 0
            echo "passed"
        end
    )
end

test "calling trash with proper wildcard returns 0"
    "0" = (trash "$path"/*.file; echo $status)
end
