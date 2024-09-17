#!/usr/bin/env bash


function collect_A_record(){
  DOMAIN_NAME=$1
  REPEAT=$2
  echo dig $DOMAIN_NAME, repeat $REPEAT times.
  TEMP=$(mktemp -u --suffix="${DOMAIN_NAME}".txt)
  VAL=$(dig @ns1.google.com "${DOMAIN_NAME}" +short)
  for i in  $(seq 1 "$REPEAT") ; do
    RET=$(dig @ns1.google.com "${DOMAIN_NAME}" +short)
    if [[ $RET != $VAL ]];then
      echo "$i" : changed
      echo "$VAL" >> "$TEMP"
    fi
    VAL=$RET
    sleep 10
  done
  cat "${TEMP}" | sort | uniq > "${DOMAIN_NAME}".txt
}

function main(){
  collect_A_record $1 $2
}

main "$@"
