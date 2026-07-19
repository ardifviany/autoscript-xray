#!/bin/bash
NC='\033[0m'; CYAN='\033[1;36m'; GREEN='\033[1;32m'; WHITE='\033[1;37m'; YELLOW='\033[1;33m'
top() { echo -e "${CYAN}╭──────────────────────────────────────────────────────╮${NC}"; }
sep() { echo -e "${CYAN}├──────────────────────────────────────────────────────┤${NC}"; }
bot() { echo -e "${CYAN}╰──────────────────────────────────────────────────────╯${NC}"; }
row() { printf "${CYAN}│${WHITE} %-52s ${CYAN}│${NC}\n" "$1"; }
item() { printf "${CYAN}│ ${GREEN}[%02d]${WHITE} %-48s${CYAN}│${NC}\n" "$1" "$2"; }
clear
top
row "PENGATURAN JEVLAYER VPN"
sep
item 1 "Ganti domain"
item 2 "Ganti port Xray"
item 3 "Lihat penggunaan bandwidth"
item 4 "Perbarui sertifikat TLS"
printf "${CYAN}│ ${YELLOW}[00]${WHITE} %-48s${CYAN}│${NC}\n" "Kembali ke menu utama"
bot
read -rp "Pilih pengaturan [0-4] : " menu
case "$menu" in
  1|01) chngedomain ;; 2|02) chngeport ;; 3|03) vnstat ;; 4|04) certxray ;;
  0|00) menu ;; *) echo "Pilihan tidak tersedia."; sleep 1; msettings ;;
esac
