# !/bin/bash

PS3="select your pefer laguage:"
select s in bash perl python ruby '(quit)'
  do
    case $s in
      bash|perl|python|ruby) echo "you select menu$REPLY):$s";;
      '(quit)') break ;;
      *) echo "please select correct" ;;
    esac
  done
