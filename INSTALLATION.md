# Instalasi JevLayer VPN Legacy

Edisi ini ditujukan untuk VPS baru Debian 9/10. Jangan jalankan pada instalasi
modern yang masih berisi data.

## Instalasi

Masuk sebagai `root`, lalu jalankan:

```bash
apt-get update
apt-get install wget -y
wget https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/install.sh
chmod +x install.sh
./install.sh
```

Installer akan melakukan reboot. Setelah VPS hidup kembali, masuk sebagai
`root` dan jalankan:

```bash
menu
```

## Konfigurasi bawaan

- Xray Core 1.5.6
- TLS/WS/gRPC pada port 443 dan HTTP pada port 80
- VMess WS `/xrayvws`, VLESS WS `/xrayws`
- Trojan WS `/xraytrojanws`, Shadowsocks WS `/xrayssws`
- Service gRPC `vmess-grpc`, `vless-grpc`, `trojan-grpc`, dan `ss-grpc`

Debian 9/10 dan komponen ini sudah usang. Gunakan sesuai risiko Anda sendiri.
