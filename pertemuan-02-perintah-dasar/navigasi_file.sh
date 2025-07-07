#!/bin/bash
## pertemuan-02-perintah-dasar/navigasi_file.sh
# Navigasi dasar direktori dan file - oleh @hafizhhasyhari

echo "Lokasi saat ini: $(pwd)"
echo "Isi direktori saat ini:"
ls -l

echo "Membuat direktori latihan..."
mkdir latihan_os
cd latihan_os
touch file1.txt file2.txt
echo "Berhasil membuat file:"
ls
