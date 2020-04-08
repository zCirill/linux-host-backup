mkdir /etc/rsnapshot.conf.d
mkdir /etc/rsnapshot.conf.d/available
mkdir /etc/rsnapshot.conf.d/enabled
mkdir -p /storage

cp os/rsnap.daily.sh os/rsnap.weekly.sh os/file-to-exclude os/rsnap.conf.create /usr/local/etc/
chmod +x /usr/local/etc/rsnap*

