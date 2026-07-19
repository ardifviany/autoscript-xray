#!/bin/bash
NC='\033[0m'; BLUE='\033[1;34m'; GREEN='\033[1;32m'; WHITE='\033[1;37m'; YELLOW='\033[1;33m'
top() { echo -e "${BLUE}╭──────────────────────────────────────────────────────╮${NC}"; }
sep() { echo -e "${BLUE}├──────────────────────────────────────────────────────┤${NC}"; }
bot() { echo -e "${BLUE}╰──────────────────────────────────────────────────────╯${NC}"; }
row() { printf "${BLUE}│${WHITE} %-52s ${BLUE}│${NC}\n" "$1"; }
item() { printf "${BLUE}│ ${GREEN}[%02d]${WHITE} %-48s${BLUE}│${NC}\n" "$1" "$2"; }
clear
top
row "JEVLAYER VPN CONTROL PANEL"
sep
item 1 "Kelola akun Xray WS/gRPC"
item 2 "Restart semua layanan"
item 3 "Lihat port aktif"
item 4 "Informasi dan status server"
item 5 "Pengaturan server"
printf "${BLUE}│ ${YELLOW}[00]${WHITE} %-48s${BLUE}│${NC}\n" "Keluar"
sep
row "Powered by JevLayer"
bot
read -rp "Pilih menu [0-5] : " menu
case "$menu" in
  1|01) maddxray ;; 2|02) restart-xray ;; 3|03) cek-port ;;
  4|04) start-menu ;; 5|05) msettings ;; 0|00) clear; exit 0 ;;
  *) echo "Pilihan tidak tersedia."; sleep 1; menu ;;
esac
