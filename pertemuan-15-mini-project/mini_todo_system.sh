## pertemuan-15-mini-project/mini_todo_system.sh

# Nama : Hafizh H Asyhari 
# Kelas : B
# Github : https://github.com/hafizhhasyhari
# Indonesia
# 2025

#!/bin/bash
# Mini todo system

declare -a tugas

tambah_tugas() {
  read -p "Masukkan tugas: " t
  tugas+=("$t")
}

tampilkan_tugas() {
  echo "Daftar Tugas:"
  for ((i=0; i<${#tugas[@]}; i++)); do
    echo "$((i+1)). ${tugas[i]}"
  done
}

while true; do
  echo "\n1. Tambah Tugas"
  echo "2. Tampilkan Tugas"
  echo "3. Keluar"
  read -p "Pilih [1-3]: " p
  case $p in
    1) tambah_tugas;;
    2) tampilkan_tugas;;
    3) break;;
    *) echo "Pilihan tidak valid.";;
  esac
done
