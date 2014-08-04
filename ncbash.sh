#!/bin/sh

set -e

nc_bash_pipe=~/.ncbashpipe
mkfifo $nc_bash_pipe
trap 'rm $nc_bash_pipe' EXIT

nc -l 8081 0<$nc_bash_pipe |
/bin/bash >$nc_bash_pipe 2>&1

