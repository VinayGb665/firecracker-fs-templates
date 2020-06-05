# do some minimal init
rc-service sysfs start
# rc-service networking start

# Set up interface
# source /usr/buildenv
# echo Setting up IP: $IP gateway: $GATEWAY
# ifconfig eth0 up && ip addr add dev eth0 $IP
# ip route add default via $GATEWAY

# run program. the firecracker compiler would place this here.
echo Running user program
python /usr/local/pyrun/*.py

# shutdown firecracker
echo User program is all done. rebooting.
reboot
