# macednstool
##### Change field number at the script if your type A field records aren't 3 or 4
```
chmod +x macedns.sh
```
```
Usage: ./macedns.sh

1=list null records
2=count null records
3=list then count null records

./macedns.sh {1|2|3|4} {DNS_SEARCH_DIR}
```

####Ex.:
```
$ ./macedns 4

Usage: ./macedns.sh

1=list null records
2=count null records
3=list then count null records

./macedns.sh {1|2|3|4} {DNS_SEARCH_DIR}

$ ./macedns.sh 2 ~/var/named/chroot/etc/named
 3
```
A
