#!/bin/bash

# Inisialisasi array
declare -a nama_mhs
declare -a nilai_mhs

# Fungsi: Tambah Data Mahasiswa
tambah_mahasiswa() {
  read -p "Masukkan nama mahasiswa: " nama
  read -p "Masukkan nilai (0-100): " nilai

  if [ -z "$nama" ] || ! [[ "$nilai" =~ ^[0-9]+$ ]] || [ "$nilai" -lt 0 ] || [ "$nilai" -gt 100 ]; then
    echo "❌ Input tidak valid. Nama tidak boleh kosong & nilai harus 0-100."
    return
  fi

  nama_mhs+=("$nama")
  nilai_mhs+=("$nilai")
  echo "✅ Mahasiswa '$nama' berhasil ditambahkan."
}

# Fungsi: Tampilkan Daftar Mahasiswa
tampilkan_data() {
  if [ ${#nama_mhs[@]} -eq 0 ]; then
    echo "Belum ada data mahasiswa."
    return
  fi

  echo "=== DAFTAR MAHASISWA ==="
  for ((i=0; i<${#nama_mhs[@]}; i++)); do
    echo "$((i+1)). ${nama_mhs[i]} - Nilai: ${nilai_mhs[i]}"
  done
}

# Fungsi: Hitung Rata-rata
hitung_rata_rata() {
  if [ ${#nilai_mhs[@]} -eq 0 ]; then
    echo "Tidak ada data nilai untuk dihitung."
    return
  fi

  total=0
  for n in "${nilai_mhs[@]}"; do
    total=$((total + n))
  done

  rata=$((total / ${#nilai_mhs[@]}))
  echo "📊 Rata-rata nilai kelas: $rata"
}

# Fungsi: Tentukan Grade
tampilkan_grade() {
  if [ ${#nama_mhs[@]} -eq 0 ]; then
    echo "Tidak ada data mahasiswa."
    return
  fi

  echo "=== DAFTAR MAHASISWA + GRADE ==="
  for ((i=0; i<${#nama_mhs[@]}; i++)); do
    nilai=${nilai_mhs[i]}
    grade="E"

    if [ "$nilai" -ge 80 ]; then
      grade="A"
    elif [ "$nilai" -ge 70 ]; then
      grade="B"
    elif [ "$nilai" -ge 60 ]; then
      grade="C"
    elif [ "$nilai" -ge 50 ]; then
      grade="D"
    elif [ "$nilai" -ge 40 ]; then
      grade="E"
    else
      grade="F (Tidak Lulus)"
    fi

    echo "${nama_mhs[i]} - Nilai: $nilai - Grade: $grade"
  done
}

# Fungsi: Cari Mahasiswa
cari_mahasiswa() {
  read -p "Masukkan nama mahasiswa yang dicari: " cari
  found=false

  for ((i=0; i<${#nama_mhs[@]}; i++)); do
    if [[ "${nama_mhs[i],,}" == "${cari,,}" ]]; then
      echo "✅ Ditemukan: ${nama_mhs[i]} - Nilai: ${nilai_mhs[i]}"
      found=true
      break
    fi
  done

  if [ "$found" = false ]; then
    echo "❌ Mahasiswa '$cari' tidak ditemukan."
  fi
}

# Menu utama
while true; do
  echo ""
  echo "=== SISTEM NILAI MAHASISWA ==="
  echo "1. Tambah Data Mahasiswa"
  echo "2. Tampilkan Daftar Mahasiswa"
  echo "3. Hitung Rata-rata Nilai Kelas"
  echo "4. Tampilkan Grade Mahasiswa"
  echo "5. Cari Mahasiswa"
  echo "6. Keluar"
  read -p "Pilih menu [1-6]: " menu

  case $menu in
    1) tambah_mahasiswa ;;
    2) tampilkan_data ;;
    3) hitung_rata_rata ;;
    4) tampilkan_grade ;;
    5) cari_mahasiswa ;;
    6) echo "Terima kasih!"; break ;;
    *) echo "❗ Menu tidak valid." ;;
  esac
done
