#!/bin/bash
set -e
BASE="https://raw.githubusercontent.com/ardifviany/autoscript-xray/main/panel/components"
cd /usr/bin
wget -qO menu "${BASE}/main-panel.sh"
wget -qO maddssh "${BASE}/ssh-panel.sh"
wget -qO mbackup "${BASE}/backup-panel.sh"
wget -qO maddxray "${BASE}/xray-accounts-panel.sh"
wget -qO msettings "${BASE}/settings-panel.sh"
wget -qO start-menu "${BASE}/server-status.sh"
chmod +x menu maddssh mbackup maddxray msettings start-menu
clear
echo "Komponen panel JevLayer berhasil diperbarui."
