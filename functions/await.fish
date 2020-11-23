function await -a title -d "Await last background job with a spinner"
  count (jobs) >/dev/null
    or return 1


  function on_premature_exit --on-job-exit %self
    functions -e on_premature_exit
    __await_cleanup
    __await_kill_children
  end

  set -l index 1
  test (count $argv) -gt 1
    and set -l theme $argv[2..-1]
    or  set -l theme "⋊>      "\
                     " ⋊>     "\
                     "  ⋊>    "\
                     "   ⋊>   "\
                     "    ⋊>  "\
                     "     ⋊> "\
                     "      ⋊>"\
                     "     <⋉ "\
                     "    <⋉  "\
                     "   <⋉   "\
                     "  <⋉    "\
                     " <⋉     "\
                     "<⋉      "
  tput civis
  stty -echo

  while count (jobs) >/dev/null
    printf "\r$theme[$index] $title"
    tput el
    test $index -eq (count $theme)
      and set index 1
      or set index (math $index + 1)
    sleep 0.1
  end
  functions -e on_premature_exit
  __await_cleanup
end


function __await_cleanup
  printf \r
  tput el
  tput cnorm
  stty echo
  trap INT
end

function __await_kill_children
  for x in (jobs -p | grep -v 'Process')
    kill $x
  end
end
