#!/bin/bash
## pertemuan-05-if-loop-case/sistem_menu.sh
# Menu interaktif dengan if, loop, dan case - by Hafizh H Asyhari @hafizhhasyhari

while true; do
  echo "\n=== MENU UTAMA ==="
  echo "1. Tampilkan tanggal"
  echo "2. Tampilkan isi direktori"
  echo "3. Keluar"
  read -p "Pilih [1-3]: " pilihan

  case $pilihan in
    1)
      echo "Tanggal sekarang: $(date)"
      ;;
    2)
      ls -l
      ;;
    3)
      echo "Terima kasih."
      break
      ;;
    *)
      echo "Pilihan tidak valid."
      ;;
  esac
done
