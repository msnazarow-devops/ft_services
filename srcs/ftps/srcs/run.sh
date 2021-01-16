echo "pasv_max_port=$FTPPORT" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=$FTPPORT" >> /etc/vsftpd/vsftpd.conf
echo "pasv_address=$IP" >> /etc/vsftpd/vsftpd.conf
echo "local_root=/home/msnazarow" >> /etc/vsftpd/vsftpd.conf
sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd/vsftpd.conf
echo "force_local_data_ssl=NO" >> /etc/vsftpd/vsftpd.conf
echo "force_local_logins_ssl=NO" >> /etc/vsftpd/vsftpd.conf
echo "ssl_enable=YES" >> /etc/vsftpd/vsftpd.conf
sed -i "s/#local/local/" /etc/vsftpd/vsftpd.conf
sed -i "s/#write/write/" /etc/vsftpd/vsftpd.conf
echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf
echo 'rsa_cert_file=/etc/ssl/certs/selfsigned.crt' >> /etc/vsftpd/vsftpd.conf
echo 'rsa_private_key_file=/etc/ssl/private/selfsigned.key' >> /etc/vsftpd/vsftpd.conf
vsftpd "/etc/vsftpd/vsftpd.conf"