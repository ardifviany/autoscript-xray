#!/bin/bash
NC='\033[0m'; PINK='\033[1;35m'; CYAN='\033[1;36m'; GREEN='\033[1;32m'; WHITE='\033[1;37m'; YELLOW='\033[1;33m'
top() { echo -e "${PINK}╭──────────────────────────────────────────────────────╮${NC}"; }
sep() { echo -e "${PINK}├──────────────────────────────────────────────────────┤${NC}"; }
bot() { echo -e "${PINK}╰──────────────────────────────────────────────────────╯${NC}"; }
row() { printf "${PINK}│${WHITE} %-52s ${PINK}│${NC}\n" "$1"; }
item() { printf "${PINK}│ ${GREEN}[%02d]${WHITE} %-48s${PINK}│${NC}\n" "$1" "$2"; }
clear
top
row "JEVLAYER XRAY MANAGER"
sep
printf "${PINK}│ ${CYAN}VMESS WS / gRPC${WHITE}                                      ${PINK}│${NC}\n"
item 1 "Buat akun VMess"
item 2 "Hapus akun VMess"
item 3 "Perpanjang akun VMess"
sep
printf "${PINK}│ ${CYAN}VLESS WS / gRPC${WHITE}                                      ${PINK}│${NC}\n"
item 4 "Buat akun VLESS"
item 5 "Hapus akun VLESS"
item 6 "Perpanjang akun VLESS"
sep
printf "${PINK}│ ${CYAN}TROJAN WS / gRPC${WHITE}                                     ${PINK}│${NC}\n"
item 7 "Buat akun Trojan"
item 8 "Hapus akun Trojan"
item 9 "Perpanjang akun Trojan"
sep
printf "${PINK}│ ${CYAN}SHADOWSOCKS WS / gRPC${WHITE}                                ${PINK}│${NC}\n"
item 10 "Buat akun Shadowsocks"
item 11 "Hapus akun Shadowsocks"
item 12 "Perpanjang akun Shadowsocks"
sep
printf "${PINK}│ ${YELLOW}[00]${WHITE} %-48s${PINK}│${NC}\n" "Kembali ke menu utama"
bot
read -rp "Pilih layanan [0-12] : " menu
case "$menu" in
  1|01) addvmess ;; 2|02) dellvmess ;; 3|03) rennewvmess ;;
  4|04) addvless ;; 5|05) dellvless ;; 6|06) rennewvless ;;
  7|07) addtrojan ;; 8|08) delltrojan ;; 9|09) rennewtrojan ;;
  10) addss ;; 11) dellss ;; 12) rennewss ;;
  0|00) menu ;;
  *) echo "Pilihan tidak tersedia."; sleep 1; maddxray ;;
esac
