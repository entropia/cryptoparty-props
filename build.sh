#!/bin/bash

mkdir -p out
rm -f _pubkey_padlock_andi.pdf _pubkey_padlock_christian.pdf _pubkey_padlock_blank.pdf \
      _pubkey_signature_andi.pdf _pubkey_signature_christian.pdf _pubkey_signature_blank.pdf
rm -f out/*

# pubkey
inkscape <(sed 's/LENAME/Andi/g' pubkey_padlock.svg) --export-pdf=_pubkey_padlock_andi.pdf
inkscape <(sed 's/LENAME/Christian/g' pubkey_padlock.svg) --export-pdf=_pubkey_padlock_christian.pdf
inkscape <(sed 's/LENAME/Florolf/g' pubkey_padlock.svg) --export-pdf=_pubkey_padlock_florolf.pdf
inkscape <(sed 's/LENAME/____________/g' pubkey_padlock.svg) --export-pdf=_pubkey_padlock_blank.pdf
inkscape <(sed 's/LENAME/Andi/g' pubkey_signature.svg) --export-pdf=_pubkey_signature_andi.pdf
inkscape <(sed 's/LENAME/Christian/g' pubkey_signature.svg) --export-pdf=_pubkey_signature_christian.pdf
inkscape <(sed 's/LENAME/Florolf/g' pubkey_signature.svg) --export-pdf=_pubkey_signature_florolf.pdf
inkscape <(sed 's/LENAME/____________/g' pubkey_signature.svg) --export-pdf=_pubkey_signature_blank.pdf
pdfjam _pubkey_padlock_andi.pdf _pubkey_signature_andi.pdf --outfile out/pubkey_andi.pdf
pdfjam _pubkey_padlock_florolf.pdf _pubkey_signature_florolf.pdf --outfile out/pubkey_florolf.pdf
pdfjam _pubkey_padlock_christian.pdf _pubkey_signature_christian.pdf --outfile out/pubkey_christian.pdf
pdfjam _pubkey_padlock_blank.pdf _pubkey_signature_blank.pdf --outfile out/pubkey_blank.pdf

# privkey
inkscape <(sed 's/LENAME/Andi/g' privkey_key.svg) --export-pdf=_privkey_key_andi.pdf
inkscape <(sed 's/LENAME/Christian/g' privkey_key.svg) --export-pdf=_privkey_key_christian.pdf
inkscape <(sed 's/LENAME/Florolf/g' privkey_key.svg) --export-pdf=_privkey_key_florolf.pdf
inkscape <(sed 's/LENAME/___________/g' privkey_key.svg) --export-pdf=_privkey_key_blank.pdf
inkscape <(sed 's/LENAME/Andi/g' privkey_pen.svg) --export-pdf=_privkey_pen_andi.pdf
inkscape <(sed 's/LENAME/Christian/g' privkey_pen.svg) --export-pdf=_privkey_pen_christian.pdf
inkscape <(sed 's/LENAME/Florolf/g' privkey_pen.svg) --export-pdf=_privkey_pen_florolf.pdf
inkscape <(sed 's/LENAME/___________/g' privkey_pen.svg) --export-pdf=_privkey_pen_blank.pdf
pdfjam _privkey_key_andi.pdf _privkey_pen_andi.pdf --outfile out/privkey_andi.pdf
pdfjam _privkey_key_christian.pdf _privkey_pen_christian.pdf --outfile out/privkey_christian.pdf
pdfjam _privkey_key_florolf.pdf _privkey_pen_florolf.pdf --outfile out/privkey_florolf.pdf
pdfjam _privkey_key_blank.pdf _privkey_pen_blank.pdf --outfile out/privkey_blank.pdf

# signme
inkscape <(sed -e 's/LENAME/Andi/g' -e "s/LEKEYID/$(echo Andi | sha1sum | cut -c 1-16)/g" pubkey_signme.svg) --export-pdf=out/pubkey_signme_andi.pdf
inkscape <(sed -e 's/LENAME/Christian/g' -e "s/LEKEYID/$(echo Christian | sha1sum | cut -c 1-16)/g" pubkey_signme.svg) --export-pdf=out/pubkey_signme_christian.pdf
inkscape <(sed -e 's/LENAME/Florolf/g' -e "s/LEKEYID/$(echo Florolf | sha1sum | cut -c 1-16)/g" pubkey_signme.svg) --export-pdf=out/pubkey_signme_florolf.pdf
inkscape <(sed -e 's/LENAME/____________/g' -e "s/LEKEYID/$(echo ____________ | sha1sum | cut -c 1-16)/g" pubkey_signme.svg) --export-pdf=out/pubkey_signme_blank.pdf

