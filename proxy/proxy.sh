#!/bin/bash
# set -x
AUTO_PROXY_URL=http://127.0.0.1:4411

disable_proxy(){
    sudo networksetup -setautoproxystate Wi-Fi off
    echo "Auto proxy disabled."
}

enable_proxy(){
	sudo networksetup -setautoproxyurl Wi-Fi $AUTO_PROXY_URL
	sudo networksetup -setautoproxystate Wi-Fi on
	echo "Auto proxy enabled."
}

# ref: http://www.cnblogs.com/include/archive/2011/12/09/2307905.html

if [ "$1" == "on" ]; then
	enable_proxy
elif [ "$1" == "off" ]; then
	disable_proxy
else
	echo "use 'on' or 'off' option"
	exit
fi

# ref: https://www.ibm.com/developerworks/cn/aix/library/au-usingtraps/
# trap disable_proxy INT
# trap enable_proxy INT
