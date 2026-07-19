#!/bin/bash
NC='\033[0m'; BLUE='\033[1;34m'; GREEN='\033[1;32m'; WHITE='\033[1;37m'; YELLOW='\033[1;33m'
top() { echo -e "${BLUE}╭──────────────────────────────────────────────────────╮${NC}"; }
sep() { echo -e "${BLUE}├──────────────────────────────────────────────────────┤${NC}"; }
bot() { echo -e "${BLUE}╰──────────────────────────────────────────────────────╯${NC}"; }
row() { printf "${BLUE}│${WHITE} %-52.52s ${BLUE}│${NC}\n" "$1"; }
item() { printf "${BLUE}│ ${GREEN}[%02d]${WHITE} %-48s${BLUE}│${NC}\n" "$1" "$2"; }
IPVPS=$(curl -s --max-time 5 ipinfo.io/ip)
ISPVPS=$(curl -s --max-time 5 ipinfo.io/org)
UPTIME=$(uptime -p 2>/dev/null)
clear
top
row "JEVLAYER ADVANCED PANEL"
sep
row "IP     : ${IPVPS:-Tidak tersedia}"
row "ISP    : ${ISPVPS:-Tidak tersedia}"
row "Uptime : ${UPTIME:-Tidak tersedia}"
sep
item 1 "Buat semua akun Xray"
item 2 "Hapus akun Xray"
item 3 "Lihat domain"
item 4 "Lihat IP publik"
item 5 "Perbarui komponen"
item 6 "Perbarui Xray Core"
item 7 "Perbarui script"
item 8 "Restart Xray"
item 9 "Perbarui sertifikat"
item 10 "Tambah domain"
item 11 "Panduan pointing domain"
item 12 "Tes kecepatan server"
item 13 "Reboot VPS"
item 14 "Informasi instalasi"
item 15 "Auto pointing subdomain"
item 16 "Cek semua port"
printf "${BLUE}│ ${YELLOW}[00]${WHITE} %-48s${BLUE}│${NC}\n" "Keluar"
bot
read -rp "Pilih menu [0-16] : " xmenu
case "$xmenu" in
  1|01) add-akun ;; 2|02) delete-akun ;; 3|03) cat /etc/xray/domain ;;
  4|04) curl -s ipinfo.io/ip ;; 5|05) updatedll ;; 6|06) updatecore ;;
  7|07) updatesc ;; 8|08) restart-xray ;; 9|09) certv2ray ;;
  10) add-domain ;; 11) how-pointing ;; 12) speedtest ;; 13) reboot ;;
  14) cat /root/log-install.txt ;; 15) auto-pointing ;; 16) cek-port ;;
  0|00) clear; exit 0 ;; *) echo "Pilihan tidak tersedia."; sleep 1; xmenu ;;
esac
