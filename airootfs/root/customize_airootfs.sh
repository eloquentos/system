#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

rm -f /usr/share/applications/avahi-discover.desktop
rm -f /usr/share/applications/assistant.desktop
rm -f /usr/share/applications/assistant-qt4.desktop
rm -f /usr/share/applications/bssh.desktop
rm -f /usr/share/applications/bvnc.desktop
rm -f /usr/share/applications/cups.desktop
rm -f /usr/share/applications/designer.desktop
rm -f /usr/share/applications/designer-qt4.desktop
rm -f /usr/share/applications/elinks.desktop
rm -f /usr/share/applications/linguist.desktop
rm -f /usr/share/applications/linguist-qt4.desktop
rm -f /usr/share/applications/qdbusviewer.desktop
rm -f /usr/share/applications/qdbusviewer-qt4.desktop
rm -f /usr/share/applications/qtconfig-qt4.desktop
rm -f /usr/share/applications/qv4l2.desktop
rm -f /usr/share/applications/tracker-needle.desktop
rm -f /usr/share/applications/tracker-preferences.desktop
rm -f /usr/share/applications/zenmap.desktop
rm -f /usr/share/applications/zenmap-root.desktop

glib-compile-schemas /usr/share/glib-2.0/schemas/

chown -R 0:0 /etc/sudoers.d

systemctl enable pacman-init.service choose-mirror.service
systemctl enable sddm
systemctl enable NetworkManager.service
systemctl enable org.cups.cupsd.service
systemctl enable snapd.socket
systemctl enable snapd.refresh.timer
