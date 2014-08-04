#!/bin/sh

if [ $# -gt 0 ] ; then
    for i in "$@" ; do
        echo -n "$i? " > /dev/tty
        read response
        case $response in
            y*) echo $i ;;
            q*) break
        esac
    done

    exit 0
fi

while read line ; do
    echo -n "$line? " > /dev/tty
    while true ; do
        read response
        break
    done < /dev/tty
    case $response in
        y*) echo $line ;;
        q*) break
    esac
done 

exit 0
