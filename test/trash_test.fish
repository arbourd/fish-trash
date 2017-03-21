set DIR (dirname $DIRNAME)
source "$DIR/functions/trash.fish"

set path "$DIR/test/test.file"
set usage "Usage: trash [PATH]"

function setup
    touch $path
end

function teardown
    if test -e $path
        rm $path
    end
end

test "calling trash with --help shows usage"
    $usage = (trash --help)
end

test "calling trash with --help returns 0"
    "0" = (trash --help; echo $status)
end

test "calling trash with --version shows version"
    "trash, version $VERSION" = (trash --version)
end

test "calling trash with --version returns 0"
    "0" = (trash --version; echo $status)
end

test "calling trash with no params shows usage"
    $usage = (trash)
end

test "calling trash with no params returns 1"
    "1" = (trash; echo $status)
end

test "calling trash with bad path shows usage"
    $usage = (trash "/path/that/does/not/exist")
end

test "calling trash with bad path returns 1"
    "1" = (trash "/path/that/does/not/exist"; echo $status)
end

test "calling trash with multiple params shows usage"
    $usage = (trash "$path" "second/path")
end

test "calling trash with multiple params returns 1"
    "1" = (trash "$path" "second/path"; echo $status)
end

test "calling trash with proper path moves file to trash"
    "true" = (
        trash $path; if not test -e $path
            echo "true"
        end
    )
end

test "calling trash with proper path returns 0"
    "0" = (trash $path; echo $status)
end
