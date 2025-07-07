#!/bin/bash

## pertemuan-03-permission-user/permission_check.sh
# Mengecek dan mengatur permission file

read -p "Masukkan nama file: " file

if [ ! -e "$file" ]; then
  echo "File tidak ditemukan."
  exit 1
fi

if [ -x "$file" ]; then
  echo "✅ File dapat dieksekusi."
else
  echo "⚠️ File tidak bisa dieksekusi. Menambahkan permission..."
  chmod +x "$file"
  echo "Permission ditambahkan."
fi
