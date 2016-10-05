#! /bin/sh
### BEGIN INIT INFO
# Provides:        snapclient
# Required-Start:  $network snapserver  # Remove snapserver dependency if running on other machine then server
# Required-Stop:   $network
# Default-Start:   2 3 4 5
# Default-Stop: 
# Short-Description: Start Snapcast Client daemon
### END INIT INFO

SERVER="127.0.0.1"

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting snapcast client"
    snapclient -d -i $SERVER
    ;;
  stop)
    echo "Stopping snapcast server"
    killall snapclient
    ;;
  *)
    echo "Usage: /etc/init.d/snapclient {start|stop}"
    exit 1
    ;;
esac

exit 0