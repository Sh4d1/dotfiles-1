" Author: Samuel Walladge <samuel@swalladge.id.au>

function! ale_linters#ledger#ledger#Handle(buffer, lines) abort
    let l:pattern = '\v^While parsing file "(.{-})", line (\d+):.{-}Error: (.{-})$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \    'filename': l:match[1],
        \    'lnum': l:match[2] + 0,
        \    'type': 'E',
        \    'text': l:match[3],
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('ledger', {
\   'name': 'ledger',
\   'executable': 'ledger',
\   'command': "ledger source %s --pedantic --explicit >/dev/null 2>&1 | awk '/^While parsing file/,/^Error/{if($0 ~ /^Error/){print}; if($0 !~ /^Error/){printf $0\"||\"}}'",
\   'callback': 'ale_linters#ledger#ledger#Handle',
\})


" TODO: refactor this into a :compiler config
