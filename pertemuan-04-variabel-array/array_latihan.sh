#!/bin/bash

## pertemuan-04-variabel-array/array_latihan.sh
# Program array sederhana dengan loop by @hafizhhasyhari

declare -a nama_mhs

for ((i=0; i<3; i++))
do
  read -p "Masukkan nama mahasiswa ke-$((i+1)): " nama_mhs[i]
done

echo "\nDaftar Mahasiswa:"
for nama in "${nama_mhs[@]}"
do
  echo "- $nama"
done
