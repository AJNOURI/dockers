VBoxManage guestproperty get "ubuntu-docker" "/VirtualBox/GuestInfo/Net/0/V4/IP" | awk -F " " '{print $2}'
