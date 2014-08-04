#!/bin/sh
# 
# which.sh -- locate a command, a simple which command replacement
#

case "$1" in
    -h|--help|"")
        cat<<EOF
`basename $0` - locate a command

usage: `basename $0` [-a] [command name] ...

options:
  -a  print all matching pathnames of all arguments

EOF
        exit 0 ;;
    -a) 
        all_matches=true; shift ;;
    *) break ;;
esac

all_matched=true
searchpaths=`echo $PATH | sed \
's/^:/.:/
 s/::/:.:/g
 s/:$/:./
 s/:/ /g'`

for i in "$@" ; do
    matched=false
    for p in $searchpaths ; do
            if [ -x "$p/$i" ]; then
                matched=true
                echo "$p/$i"
                [ -z "$all_matches" ] && break
            fi
    done;
    [ "$matched" = false ] && all_matched=false
done

[ "$all_matched" = true ] && exit 0 || exit 1

