#!/bin/bash
#Mace Vidal script to get A records null/nil

SEARCH_DIR=$2

if [ -z "$SEARCH_DIR" ]
then
  if [[ "$1" -ne 4 ]]
  then
    echo "DNS_SEARCH_DIR can't be empty. You must provide the dns search dir path to use macedns tool"
    echo ""
    exit 3
  fi
fi

count()
{
  #Count null records
  list|grep A|wc -l
}

list()
{
 GETNULLRECS=$(find ${SEARCH_DIR} -type f -name "db.*" -exec awk '!/^;/ {if($3=="A" && $4=="" || $4=="A" && $5=="") print $0 " " FILENAME}' {} \;)

  #Get records with null values
  echo "${GETNULLRECS}"
}

helptool()
{
  echo "Usage: $0"
  echo ""
  echo "1=list null records"
  echo "2=count null records"
  echo "3=list then count null records"
  echo ""
  echo "$0 {1|2|3|4} {DNS_SEARCH_DIR}"
  echo ""
  echo "$0 4 for this guid"
}

case "$1" in
    1)
        list
        ;;
    2)
        count
        ;;
    3)
        list
        count
        ;;
    4)
        helptool
        ;;
    \?)
        echo "You must provide the search field and tool option"
        helptool
        ;;
    *)
        helptool
	exit 2
	;;
esac
