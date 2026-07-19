#!/bin/bash
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
#
cd
# collor status
error1="${RED} [ERROR] ${NC}"
success="${GREEN} [OK] ${NC}"
# Cek Domain
source /var/lib/jevlayer/ipvps.conf
if [[ "$IP" = "" ]]; then
    clear
    echo -e " ${error1}Gagal Install-Update.."
    sleep 2
    exit 0
else
    clear
    echo -e "${success}Installasi Update Menu..."
    sleep 2
fi
# ==========================================
# link hosting kalian
jevlayer_source="https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel"
jevlayer_repo_menu_updated="https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/components"
jevlayer_repo_updated="https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/actions"
cd
rm -r updatedll
wget -O updatedll "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/panel-installer.sh"
rm -rf updatedll

# hapus
cd /usr/bin
rm -rf xmenu
rm -rf updatedll
rm -r updatedll
# download
#
cd /usr/bin
# Update By JevLayer
wget -O xmenu "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/advanced-panel.sh"
wget -O add-akun "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/account-create-all.sh"
wget -O updatedll "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/panel-installer.sh"
wget -O add-akun "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/account-create-all.sh"
wget -O delete-akun "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/account-delete-all.sh"
wget -O certv2ray "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/xray/certv2ray.sh"
wget -O restart-xray "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/service-restart.sh"
wget -O xmenu "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/advanced-panel.sh"
wget -O auto-pointing "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/dns-auto-point.sh"
wget -O cek-port "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/service-ports.sh"
wget -O xmenu "https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/advanced-panel.sh"
# Update menu
wget -O menu "${jevlayer_repo_menu_updated}/main-panel.sh"
wget -O msettings "${jevlayer_repo_menu_updated}/settings-panel.sh"
wget -O maddxray "${jevlayer_repo_menu_updated}/xray-accounts-panel.sh"
wget -O start-menu "${jevlayer_repo_menu_updated}/server-status.sh"
# update xray menu
wget -O addvmess "${jevlayer_repo_updated}/vmess-create.sh"
wget -O dellvmess "${jevlayer_repo_updated}/vmess-delete.sh"
wget -O rennewvmess "${jevlayer_repo_updated}/vmess-renew.sh"
wget -O addvless "${jevlayer_repo_updated}/vless-create.sh"
wget -O dellvless "${jevlayer_repo_updated}/vless-delete.sh"
wget -O rennewvless "${jevlayer_repo_updated}/vless-renew.sh"
wget -O addtrojan "${jevlayer_repo_updated}/trojan-create.sh"
wget -O delltrojan "${jevlayer_repo_updated}/trojan-delete.sh"
wget -O rennewtrojan "${jevlayer_repo_updated}/trojan-renew.sh"
wget -O addss "${jevlayer_repo_updated}/shadowsocks-create.sh"
wget -O dellss "${jevlayer_repo_updated}/shadowsocks-delete.sh"
wget -O rennewss "${jevlayer_repo_updated}/shadowsocks-renew.sh"
wget -O adddomain "${jevlayer_repo_updated}/domain-add.sh"
wget -O chngedomain "${jevlayer_repo_updated}/domain-change.sh"
wget -O chngeport "${jevlayer_repo_updated}/port-change.sh"
wget -O certxray "${jevlayer_repo_updated}/certificate-renew.sh"
wget -O xp "${jevlayer_repo_updated}/account-expiry.sh"

#
chmod +x /usr/bin/updatedll
chmod +x /usr/bin/xmenu
chmod +x xmenu
chmod +x add-akun
chmod +x delete-akun
chmod +x updatedll
chmod +x add-akun
chmod +x certv2ray
chmod +x restart-xray
chmod +x auto-pointing
chmod +x cek-port
# update menu
chmod +x msettings
chmod +x maddxray
chmod +x start-menu
chmod +x menu
# update xray menu
chmod +x addvmess
chmod +x dellvmess
chmod +x rennewvmess
chmod +x addvless
chmod +x dellvless
chmod +x rennewvless
chmod +x addtrojan
chmod +x delltrojan
chmod +x rennewtrojan
chmod +x addss
chmod +x dellss
chmod +x rennewss
chmod +x certxray
chmod +x adddomain
chmod +x chngedomain
chmod +x chngeport
chmod +x xp

clear
echo -e "Update Selesai..."
cd
