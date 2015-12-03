#!/bin/bash

set -u -e

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
cd "$( dirname "${BASH_SOURCE[0]}" )"

rm -rf ./out ./tmp
mkdir -p ./out ./tmp

PEOPLE="Christian olf Morbi ____________"

for NAME in $PEOPLE; do
    for filename in pubkey_padlock pubkey_signature privkey_key privkey_pen pubkey_signme; do
        KEYID=$(echo $NAME | sha1sum | cut -c 1-16)
        inkscape <(sed -e "s/LENAME/${NAME}/g" -e "s/LEKEYID/${KEYID}/g" templates/${filename}.svg) --export-pdf=tmp/${filename}_${NAME}.pdf
    done
    for patt in pubkey_padlock:pubkey_signature:pubkey privkey_key:privkey_pen:privkey; do
        front=$(echo $patt | cut -d: -f1)
        back=$(echo $patt | cut -d: -f2)
        result=$(echo $patt | cut -d: -f3)
        pdfjam tmp/${front}_${NAME}.pdf tmp/${back}_${NAME}.pdf --outfile out/${result}_${NAME}.pdf
    done
    mv tmp/pubkey_signme_${NAME}.pdf out
done

ALICE="Christian"
BOB="olf"
CHEF="Andi"

cd templates

for MAIL in mail_*.svg; do
    inkscape <(sed -e "s/LEALICE/${ALICE}/g" -e "s/LEBOB/${BOB}/g" -e "s/LECHEF/${CHEF}/g" ${MAIL}) --export-pdf=../tmp/${MAIL/svg/pdf}
done

cd ..

pdfjam tmp/mail_*.pdf --outfile out/mails.pdf
