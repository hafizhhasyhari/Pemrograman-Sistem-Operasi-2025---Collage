#!/bin/bash
# 🛠UTS PROJECT – SOLAR MOTOR SYSTEM CLI
# Mencakup fitur dari pertemuan 1–8: Shell dasar, if/loop, proses, signal, thread (disimulasikan), array

DB="uts_motor.db"
trap "echo -e '\nSIGINT diterima. Keluar dari program.'; exit" SIGINT

# =======================
# ARRAY SEMENTARA (local)
# =======================
declare -a daftar_motor

tambah_motor_array() {
  read -p "Nomor Seri: " seri
  read -p "Model: " model
  read -p "Tahun: " tahun
  entry="$seri|$model|$tahun"
  daftar_motor+=("$entry")
  echo "✅ Ditambahkan ke memori: $entry"
}

lihat_array_motor() {
  echo "\n--- Daftar Motor (array memori) ---"
  for i in "${!daftar_motor[@]}"; do
    IFS='|' read -r seri model tahun <<< "${daftar_motor[i]}"
    echo "$((i+1)). Seri: $seri | Model: $model | Tahun: $tahun"
  done
}

simpan_ke_sqlite() {
  echo "Menyimpan data array ke database..."
  sqlite3 $DB "CREATE TABLE IF NOT EXISTS motor_unit (id INTEGER PRIMARY KEY, nomor_seri TEXT, model TEXT, tahun INTEGER);"
  for item in "${daftar_motor[@]}"; do
    IFS='|' read -r seri model tahun <<< "$item"
    sqlite3 $DB "INSERT INTO motor_unit (nomor_seri, model, tahun) VALUES ('$seri', '$model', $tahun);"
  done
  echo "✅ Semua data tersimpan ke $DB"
}

lihat_data_sqlite() {
  echo "\n--- Data di Database ---"
  sqlite3 -header -column $DB "SELECT * FROM motor_unit;"
}

# ===================
# PROSES & SIMULASI
# ===================
simulasi_proses() {
  echo "Memulai proses anak simulasi (dengan fork)"
  bash -c 'echo "[Anak] PID: $$ sedang mencatat waktu..."; date; sleep 2; echo "[Anak] Selesai."' &
  echo "[Induk] Lanjut tanpa menunggu anak."
  sleep 1
}

simulasi_thread() {
  echo "Simulasi thread (tidak asli pthread, tapi paralel background)"
  (echo "[Thread-1] Mulai..."; sleep 1; echo "[Thread-1] Selesai") &
  (echo "[Thread-2] Mulai..."; sleep 1; echo "[Thread-2] Selesai") &
  wait
  echo "[MAIN] Semua thread selesai."
}

# ====================
# MENU UTS
# ====================
menu() {
  echo "\n===== UTS – SIMULASI KENDARAAN LISTRIK SURYA ====="
  echo "1. Tambah Motor (Array)"
  echo "2. Lihat Motor (Array)"
  echo "3. Simpan ke Database"
  echo "4. Tampilkan dari Database"
  echo "5. Simulasi Proses (Fork)"
  echo "6. Simulasi Thread (Parallel Background)"
  echo "7. Keluar"
}

while true; do
  menu
  read -p "Pilih menu [1–7]: " p
  case $p in
    1) tambah_motor_array;;
    2) lihat_array_motor;;
    3) simpan_ke_sqlite;;
    4) lihat_data_sqlite;;
    5) simulasi_proses;;
    6) simulasi_thread;;
    7) echo "Keluar..."; break;;
    *) echo "Pilihan tidak valid.";;
  esac
done
