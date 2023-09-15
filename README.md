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

#### Ex.:
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

### Use este script e monitore com Zabbix

#### Inclua o item com custom em seu template de DNS.

É sugerida a inclusão de uma macro para o PATH do diretória a ser verificada a ocorrência de registros vazios, pois desta forma é possível utilizar o mesmo template para diferentes distribuíções/S.O.s, sem precisar que seja modificada a linha de chamada do script para cada um deles.

O Item deve ter o tipo "unsigned integer".

É interessante criar um mapa de valores:
``
"0 - OK (Sem registros vazios)"

">1 - NOK (Existem registros vazios)"
``
"Lê-se: maior que 1"

Adicione a linha em um de seus arquivos de Custom checks nos servidores de DNS:
```
UserParameter=custom.dns.empty.reg[*],/usr/bin/macedns 2 $1  2> /dev/null
```
Lembre-se de reiniciar o Zabbix-agent para aplicar a alteração.

