#! /bin/sh
### BEGIN INIT INFO
# Provides:        snapserver
# Required-Start:  $network
# Required-Stop:   $network
# Default-Start:   2 3 4 5
# Default-Stop: 
# Short-Description: Start Snapcast Server daemon
### END INIT INFO

CODEC="ogg"

case "$1" in
  start)
    echo "Starting snapcast server"
    snapserver --codec $CODEC -d
    ;;
  stop)
    echo "Stopping snapcast server"
    killall snapserver
    ;;
  *)
    echo "Usage: /etc/init.d/snapserver {start|stop}"
    exit 1
    ;;
esac

exit 0
