#!/bin/bash

function server () {
  while true
  do
    read method path version
    if 
  done
}

coproc SERVER_PROCESS { server; }

netcat -lv 2345 <&${SERVER_PROCESS[0] >&${SERVER_PROCESS[1]}}