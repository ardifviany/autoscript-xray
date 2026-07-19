#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# =========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);
clear
mkdir /var/lib/jevlayer;
mkdir /var/lib/crot;
mkdir /etc/xray;
echo "IP=" >> /var/lib/crot/ipvps.conf
echo "IP=" >> /var/lib/jevlayer/ipvps.conf
cd
#
# Add Domain
wget https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/actions/domain-add.sh && chmod +x domain-add.sh && ./domain-add.sh
#
#install tools/alat
wget https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/system-bootstrap.sh && chmod +x system-bootstrap.sh && ./system-bootstrap.sh
#
#Instal Xray
wget https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/xray-deploy.sh && chmod +x xray-deploy.sh && ./xray-deploy.sh
#install xmenu
wget https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/panel-installer.sh && chmod +x panel-installer.sh && ./panel-installer.sh
#
#SELESAI
# collor status
error1="${RED} [ERROR] ${NC}"
success="${GREEN} [OK] ${NC}"
# Cek Domain
source /var/lib/jevlayer/ipvps.conf
if [[ "$IP" = "" ]]; then
	clear
    echo -e " ${error1}Installation Failed!!"
	rm -rf panel-installer.sh install.sh xray-deploy.sh system-bootstrap.sh domain-add.sh
	echo " Reboot 15 Sec"
	sleep 15
	reboot
else
	clear
	echo "${success}Installation has been completed!!"
	sleep 3
	clear
	echo " "
	echo "============================================================================" | tee -a log-install.txt
	echo "" | tee -a log-install.txt
	echo "----------------------------------------------------------------------------" | tee -a log-install.txt
	echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  | tee -a log-install.txt
	echo -e "    JEVLAYER XRAY MULTI-PROTOCOL"  | tee -a log-install.txt
	echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  | tee -a log-install.txt
	echo ""  | tee -a log-install.txt
	echo "   >>> Service & Port"  | tee -a log-install.txt
	echo "   - Nginx                      : 89"  | tee -a log-install.txt
	echo "   - XRAYS TROJAN WS TLS        : 443"  | tee -a log-install.txt
	echo "   - XRAYS SHADOWSOCKS WS TLS   : 443"  | tee -a log-install.txt
	echo "   - XRAYS VLESS WS TLS         : 443"  | tee -a log-install.txt
	echo "   - XRAYS VMESS WS TLS         : 443"  | tee -a log-install.txt
	echo "   - XRAYS TROJAN WS HTTP       : 80"  | tee -a log-install.txt
	echo "   - XRAYS SHADOWSOCKS WS HTTP  : 80"  | tee -a log-install.txt
	echo "   - XRAYS VLESS WS HTTP        : 80"  | tee -a log-install.txt
	echo "   - XRAYS VMESS WS HTTP        : 80"  | tee -a log-install.txt
	echo "   - XRAYS TROJAN GRPC          : 443"  | tee -a log-install.txt
	echo "   - XRAYS SHADOWSOCKS GRPC     : 443"  | tee -a log-install.txt
	echo "   - XRAYS VMESS GRPC           : 443"  | tee -a log-install.txt
	echo "   - XRAYS VLESS GRPC           : 443"  | tee -a log-install.txt
	echo ""  | tee -a log-install.txt
	echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
	echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
	echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
	echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
	echo "   - IPtables                : [ON]"  | tee -a log-install.txt
	echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
	echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
	echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
	echo "   - Autobackup Data" | tee -a log-install.txt
	echo "   - Restore Data" | tee -a log-install.txt
	echo "   - Auto Delete Expired Account" | tee -a log-install.txt
	echo "   - Full Orders For Various Services" | tee -a log-install.txt
	echo "   - White Label" | tee -a log-install.txt
	echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
	echo " Reboot 15 Sec"
	sleep 15
	cd
	rm -rf panel-installer.sh install.sh xray-deploy.sh system-bootstrap.sh domain-add.sh
	sleep 1
	reboot
fi
