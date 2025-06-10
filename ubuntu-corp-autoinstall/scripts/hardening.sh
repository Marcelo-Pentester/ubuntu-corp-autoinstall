#!/bin/bash
# Hardening script for Ubuntu Desktop

echo "[+] Aplicando políticas de segurança com UFW..."
ufw default deny incoming
ufw default deny outgoing
ufw allow out 53
ufw allow out 80
ufw allow out 443
ufw allow in 80
ufw allow in 443
ufw enable

echo "[+] Ativando SELinux (requer reboot para aplicar totalmente)..."
apt install -y policycoreutils selinux-basics selinux-policy-default
selinux-activate
selinux-config-enforcing

echo "[+] Instalando e agendando chkrootkit..."
apt install -y chkrootkit
echo '0 3 * * 0 root /usr/sbin/chkrootkit | mail -s "Relatório chkrootkit" root' > /etc/cron.d/chkrootkit

echo "[+] Concluído."

echo "[+] Instalando e configurando rkhunter..."
apt install -y rkhunter
rkhunter --update
rkhunter --propupd -q
echo '0 4 * * 0 root /usr/bin/rkhunter --check --sk' > /etc/cron.d/rkhunter

echo "[+] Instalando AIDE e auditd..."
apt install -y aide auditd
aideinit
auditctl -e 1

echo "[+] Configurando postfix/mailutils para envio de relatórios..."
echo "postfix postfix/mailname string ubuntu-corp.local" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections
apt install -y postfix mailutils
