" Find file in current directory and edit it.
" See: http://vim.wikia.com/wiki/Find_files_in_subdirectories
function! Find(name, openCommand)
  let l:list=system("find . | ack '".a:name."' | ack -v '\.svn|\.swp$' | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":" . a:openCommand . " ".l:line
endfunction

command! -nargs=1 Find :call Find("<args>", "e")
command! -nargs=1 TabFind :call Find("<args>", "tabe")
command! -nargs=1 VSplitFind :call Find("<args>", "vsp ")
command! -nargs=1 SplitFind :call Find("<args>", "sp ")

