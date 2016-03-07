function await -a title -d "Await last background job with a spinner"
  count (jobs) >/dev/null
    or return 1

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
  jobs -l | read -l job tail

  status --is-interactive
    and trap __await_cleanup INT

  while contains $job (jobs | cut -d\t -f1)
    printf "\r$theme[$index] $title"
    tput el
    test $index -eq (count $theme)
      and set index 1
      or set index (math $index + 1)
    sleep 0.1
  end

  __await_cleanup
end


function __await_cleanup
  printf \r
  tput el
  tput cnorm
  stty echo
  trap INT
end