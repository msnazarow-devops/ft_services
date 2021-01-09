ping -q -w 1 -c 1 192.168.99.103 > /dev/null
while [[ $? ]]
do
    echo "Waiting for mysql database to start up..."
	ping -q -w 1 -c 1 192.168.99.103 > /dev/null
    sleep 1s
done