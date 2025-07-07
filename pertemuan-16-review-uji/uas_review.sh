#!/bin/bash
# UAS Review – kombinasi
## pertemuan-16-review-uji/uas_review.sh

# Name : Hafizh H Asyhari
# Class : B
# Undergraduate Student
# Indonesia
# 2025

read -p "Masukkan nama Anda: " nama
read -p "Masukkan NIM: " nim

if [ -z "$nama" ] || [ -z "$nim" ]; then
  echo "Nama dan NIM wajib diisi."
  exit 1
fi

echo "Halo $nama ($nim), siap menghadapi UAS!"
echo "Tanggal saat ini: $(date)"
echo "Daftar file:"
ls -l
