#!/bin/bash
# Simulasi IO device sederhana by Hafizh H Asyhari @hafizhhasyhari
# pertemuan-12-io-device/dummy_device_io.sh

echo "Menulis ke device (simulasi)..."
echo "Ini data dummy untuk device." > device_sim.txt

echo "Membaca kembali dari device:"
cat device_sim.txt
