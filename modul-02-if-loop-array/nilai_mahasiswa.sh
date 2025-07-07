#!/bin/bash
# Sistem Nilai Mahasiswa + Grade

declare -a nama
declare -a nilai

tambah_data() {
  read -p "Nama mahasiswa: " n
  read -p "Nilai: " v
  nama+=("$n")
  nilai+=("$v")
}

tampilkan() {
  for ((i=0; i<${#nama[@]}; i++)); do
    echo "${nama[i]} - Nilai: ${nilai[i]}"
  done
}

grade() {
  for ((i=0; i<${#nilai[@]}; i++)); do
    g="E"
    if [ ${nilai[i]} -ge 80 ]; then g="A"
    elif [ ${nilai[i]} -ge 70 ]; then g="B"
    elif [ ${nilai[i]} -ge 60 ]; then g="C"
    elif [ ${nilai[i]} -ge 50 ]; then g="D"
    elif [ ${nilai[i]} -ge 40 ]; then g="E"
    fi
    echo "${nama[i]} - Nilai: ${nilai[i]} - Grade: $g"
  done
}

rata_rata() {
  total=0
  for n in "${nilai[@]}"; do
    total=$((total + n))
  done
  echo "Rata-rata: $((total / ${#nilai[@]}))"
}

while true; do
  echo ""
  echo "=== MENU NILAI MAHASISWA ==="
  echo "1. Tambah Data"
  echo "2. Tampilkan"
  echo "3. Hitung Rata-rata"
  echo "4. Grade Mahasiswa"
  echo "5. Keluar"
  read -p "Pilih [1-5]: " p

  case $p in
    1) tambah_data ;;
    2) tampilkan ;;
    3) rata_rata ;;
    4) grade ;;
    5) break ;;
    *) echo "Input salah." ;;
  esac
done
