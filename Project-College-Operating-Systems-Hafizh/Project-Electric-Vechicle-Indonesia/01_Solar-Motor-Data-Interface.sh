#!/bin/bash
# 🚀 CLI Bash: Solar Motor Data Interface
# Untuk input & export data ke SQLite database: motor_solar_energy.db

DB="motor_solar_energy.db"

# Fungsi: Menampilkan Menu
menu() {
  echo "\n=== MENU UTAMA – SOLAR MOTOR SYSTEM ==="
  echo "1. Tambah Motor Unit"
  echo "2. Tambah Output Panel Surya"
  echo "3. Lihat Data Motor Unit"
  echo "4. Lihat Output Energi Hari Ini"
  echo "5. Export Semua Tabel ke CSV"
  echo "6. Keluar"
}

# Fungsi: Tambah Data Motor Unit
input_motor() {
  read -p "Nomor Seri: " seri
  read -p "Model: " model
  read -p "Tahun Produksi: " tahun
  read -p "Status (aktif/nonaktif): " status

  sqlite3 $DB "INSERT INTO motor_unit (nomor_seri, model, tahun_produksi, status) \
              VALUES ('$seri', '$model', $tahun, '$status');"
  echo "✅ Data motor disimpan."
}

# Fungsi: Tambah Output Energi Panel
input_output_panel() {
  read -p "ID Panel: " panel_id
  read -p "Tanggal (YYYY-MM-DD): " tgl
  read -p "Output KWH: " kwh

  sqlite3 $DB "INSERT INTO output_energi (panel_id, tanggal, output_kwh) \
              VALUES ($panel_id, '$tgl', $kwh);"
  echo "✅ Output energi ditambahkan."
}

# Fungsi: Lihat Motor Unit
lihat_motor() {
  echo "\n--- Data Motor Unit ---"
  sqlite3 -header -column $DB "SELECT * FROM motor_unit;"
}

# Fungsi: Lihat Output Hari Ini
lihat_output_hari_ini() {
  echo "\n--- Output Energi Hari Ini ---"
  sqlite3 -header -column $DB "SELECT * FROM output_energi WHERE tanggal = date('now');"
}

# Fungsi: Export ke CSV semua tabel
export_csv() {
  mkdir -p ekspor_csv
  for tabel in $(sqlite3 $DB ".tables"); do
    sqlite3 -header -csv $DB "SELECT * FROM $tabel;" > "ekspor_csv/${tabel}.csv"
    echo "✅ Exported: $tabel"
  done
  echo "📦 Semua tabel telah diekspor ke folder 'ekspor_csv/'"
}

# === LOOP MENU ===
while true; do
  menu
  read -p "Pilih menu [1-6]: " pilih
  case $pilih in
    1) input_motor;;
    2) input_output_panel;;
    3) lihat_motor;;
    4) lihat_output_hari_ini;;
    5) export_csv;;
    6) echo "👋 Keluar."; break;;
    *) echo "❗ Pilihan tidak valid.";;
  esac
done
