#!/bin/bash

# Global Variables
# ===============================================
_pid=$(pidof conky)
_workdir='/home/haraldvdlaan/.conky'

# Functions
# ===============================================
function init() {
  if [ ! -z ${_pid} ]; then
    echo "[ ERROR ]: Conky is still running, please use restart argument."
    exit 1
  fi
  
  conky -d -c ${_workdir}/conky.conf &> /dev/null && echo "[ OK ]: Conky started."
}

function reinit() {
  if [ -z ${_pid} ]; then
    echo "[ ERROR ]: Conky is not running."
    conky -d -c ${_workdir}/conky.conf &> /dev/null && echo "[ OK ]: Conky started."
  else
    kill ${_pid} && echo "[ OK ]: Conky stoped."
    sleep 1
    conky -d -c ${_workdir}/conky.conf &> /dev/null && echo "[ OK ]: Conky started."
  fi
}

function destroy() {
  if [ -z ${_pid} ]; then
    echo "[ ERROR ]: Conky is not running."
    exit 1
  fi
  
  kill ${_pid} && echo "[ OK ]: Conky stoped."
}

# Main script
# ===============================================
if [ -z ${1} ]; then
  echo "Usage: ${0} <start | restart | stop>"
  exit 1
fi

case ${1} in
  start) init ;;
  restart) reinit ;;
  stop) destroy ;;
  *) echo "Usage: ${0} <start | restart | stop>"; exit 1;;
esac

exit 0
