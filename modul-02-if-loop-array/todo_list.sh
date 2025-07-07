#!/bin/bash
# Aplikasi To-Do List Sederhana

declare -a tugas
declare -a status

tambah_tugas() {
  read -p "Masukkan nama tugas: " nama
  tugas+=("$nama")
  status+=("Belum Selesai")
}

tampilkan_tugas() {
  echo "Daftar Tugas:"
  for ((i=0; i<${#tugas[@]}; i++)); do
    echo "$((i+1)). ${tugas[i]} - ${status[i]}"
  done
}

tandai_selesai() {
  read -p "Nama tugas yang sudah selesai: " nama
  for ((i=0; i<${#tugas[@]}; i++)); do
    if [ "${tugas[i]}" == "$nama" ]; then
      status[i]="Selesai"
      echo "Tugas '$nama' ditandai selesai."
      return
    fi
  done
  echo "Tugas tidak ditemukan."
}

while true; do
  echo ""
  echo "=== MENU TO-DO LIST ==="
  echo "1. Tambah Tugas"
  echo "2. Tampilkan Tugas"
  echo "3. Tandai Tugas Selesai"
  echo "4. Keluar"
  read -p "Pilihan [1-4]: " pilihan

  case $pilihan in
    1) tambah_tugas ;;
    2) tampilkan_tugas ;;
    3) tandai_selesai ;;
    4) echo "Selesai."; break ;;
    *) echo "Pilihan tidak valid." ;;
  esac
done
