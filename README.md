# JevLayer VPN Server

Auto-installer dan panel terminal untuk membangun server Xray multi-protocol
dengan tampilan khusus JevLayer. Seluruh pengelolaan akun dilakukan melalui
menu interaktif sehingga pengguna tidak perlu mengedit konfigurasi secara
manual.

## Layanan yang tersedia

| Protokol | WebSocket | gRPC | TLS |
|---|---:|---:|---:|
| VMess | Ya | Ya | Ya |
| VLESS | Ya | Ya | Ya |
| Trojan | Ya | Ya | Ya |
| Shadowsocks | Ya | Ya | Ya |

Fitur pengelolaan:

- Membuat akun berdasarkan protokol.
- Menentukan password Trojan/Shadowsocks sendiri atau membuatnya otomatis.
- UUID VMess/VLESS dibuat otomatis.
- Menghapus dan memperpanjang akun.
- Menonaktifkan akun yang kedaluwarsa secara otomatis.
- Mengganti domain dan memperbarui sertifikat.
- Melihat status layanan, port aktif, serta bandwidth.
- Restart Xray dan Nginx dari menu.
- Backup dan restore data server.
- Menu utama dengan branding JevLayer.

## Kebutuhan server

- VPS baru dengan akses `root`.
- Debian 9 atau Debian 10 (HVM/KVM).
- Virtualisasi OpenVZ tidak didukung.
- Domain aktif yang sudah diarahkan ke IP VPS.
- Port TCP 80 dan 443 dapat diakses dari internet.
- Disarankan menggunakan Cloudflare untuk pengelolaan DNS.

> Edisi legacy ini menggunakan Xray Core 1.5.6 dan sistem operasi lama. Gunakan
> hanya jika Anda memahami risiko keamanan dan kompatibilitasnya.

## Instalasi

Masuk ke VPS sebagai `root`, kemudian perbarui sistem:

```bash
apt-get update && apt-get upgrade -y
update-grub
reboot
```

Setelah VPS hidup kembali, login ulang sebagai `root` dan jalankan:

```bash
apt-get install wget -y
wget https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/install.sh
chmod +x install.sh
./install.sh
```

Masukkan domain saat diminta dan tunggu proses instalasi sampai selesai. VPS
akan melakukan reboot otomatis.

## Membuka panel

Setelah reboot, jalankan:

```bash
menu
```

Panel utama menyediakan pengelolaan akun, restart layanan, informasi server,
daftar port, dan pengaturan domain/sertifikat.

Saat membuat akun Trojan atau Shadowsocks, tekan `Enter` pada kolom password
jika ingin sistem membuatnya otomatis. Password manual harus terdiri dari 6-64
karakter huruf, angka, titik, garis bawah, atau tanda minus. UUID VMess dan
VLESS selalu dibuat otomatis.

Panel lanjutan dapat dibuka dengan:

```bash
xmenu
```

## Konfigurasi koneksi

| Layanan | Path atau service name |
|---|---|
| VMess WebSocket | `/xrayvws` |
| VMess gRPC | `vmess-grpc` |
| VLESS WebSocket | `/xrayws` |
| VLESS gRPC | `vless-grpc` |
| Trojan WebSocket | `/xraytrojanws` |
| Trojan gRPC | `trojan-grpc` |
| Shadowsocks WebSocket | `/xrayssws` |
| Shadowsocks gRPC | `ss-grpc` |

Semua koneksi publik TLS, WebSocket, dan gRPC menggunakan port `443`.

## Port server

| Port | Fungsi |
|---:|---|
| 22 | OpenSSH |
| 80 | HTTP/WebSocket non-TLS |
| 89 | Halaman web internal |
| 443 | TLS, WebSocket, dan gRPC |
| 10085 | API Xray lokal |
| 30300 | Shadowsocks WebSocket lokal |
| 30310 | Shadowsocks gRPC lokal |

Port lokal Xray tidak perlu dibuka ke internet. VMess, VLESS, dan Trojan dapat
menggunakan Unix socket sehingga tidak selalu terlihat sebagai port TCP.

## Command penting

```bash
menu            # Panel utama JevLayer
xmenu           # Panel lanjutan
restart-xray    # Restart Xray dan Nginx
cek-port        # Melihat layanan dan port aktif
certxray        # Memperbarui sertifikat Xray
updatedll       # Memperbarui komponen menu
```

## Pemeriksaan ketika koneksi gagal

```bash
systemctl status xray --no-pager
systemctl status nginx --no-pager
nginx -t
ss -lntp
```

Pastikan domain mengarah ke IP VPS, password/UUID benar, serta Host, SNI, path
WebSocket, dan service name gRPC sesuai informasi akun.

## Struktur proyek

```text
autoscript-xray/
├── install.sh
├── system-bootstrap.sh
├── xray-deploy.sh
├── panel/
├── actions/
├── assets/
└── README.md
```

## Kredit

Script By **JevLayer**.

Gunakan layanan ini secara bertanggung jawab dan patuhi peraturan penyedia VPS
serta hukum yang berlaku.
