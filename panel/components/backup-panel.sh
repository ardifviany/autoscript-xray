#!/bin/bash
NC='\033[0m'; PURPLE='\033[1;35m'; GREEN='\033[1;32m'; RED='\033[1;31m'; WHITE='\033[1;37m'; YELLOW='\033[1;33m'
top() { echo -e "${PURPLE}╭──────────────────────────────────────────────────────╮${NC}"; }
sep() { echo -e "${PURPLE}├──────────────────────────────────────────────────────┤${NC}"; }
bot() { echo -e "${PURPLE}╰──────────────────────────────────────────────────────╯${NC}"; }
row() { printf "${PURPLE}│${WHITE} %-52s ${PURPLE}│${NC}\n" "$1"; }
item() { printf "${PURPLE}│ ${GREEN}[%02d]${WHITE} %-48s${PURPLE}│${NC}\n" "$1" "$2"; }
cek=$(grep -c -E '^# BEGIN_Backup' /etc/crontab 2>/dev/null)
[[ "$cek" == "1" ]] && status="AKTIF" || status="NONAKTIF"
clear
top
row "BACKUP CENTER - JEVLAYER VPN"
sep
item 1 "Atur email penerima"
item 2 "Atur email pengirim"
item 3 "Aktifkan backup otomatis"
item 4 "Nonaktifkan backup otomatis"
item 5 "Jalankan backup manual"
item 6 "Tes pengiriman email"
item 7 "Restore data"
printf "${PURPLE}│ ${YELLOW}[00]${WHITE} %-48s${PURPLE}│${NC}\n" "Kembali ke menu utama"
sep
row "Status backup otomatis: ${status}"
bot
read -rp "Pilih menu [0-7] : " menu
case "$menu" in
  1|01) addemail ;; 2|02) changesend ;; 3|03) startbackup ;; 4|04) stopbackup ;;
  5|05) backup ;; 6|06) testsend ;; 7|07) restore ;; 0|00) menu ;;
  *) echo "Pilihan tidak tersedia."; sleep 1; mbackup ;;
esac
