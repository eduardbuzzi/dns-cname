#!/bin/bash

domain(){
read -p "DOMAIN => " DOMAIN
if [ -z "$DOMAIN" ]
then
domain
fi
VERIFICATION=$(host $DOMAIN | grep "found")
if [ ! -z "$VERIFICATION" ]
then
domain
fi
}

wordlist(){
read -p "WORDLIST => " WORDLIST
if [ -z "$WORDLIST" ] || [ ! -f "$WORDLIST" ]
then
wordlist
fi
}

principal(){
echo
domain
wordlist
echo
for palavra in $(cat $WORDLIST);
do
host -t CNAME $palavra.$DOMAIN | grep "alias"
done
principal
}
principal
