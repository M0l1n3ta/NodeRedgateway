#!/bin/bash

basedir=$(cd `dirname $0`/..; pwd)
redis_host=localhost
redis_port=6379
redis_password=abc123

RETVAL=0
PROG="redis-exporter"
EXEC="/usr/sbin/redis-exporter"
LOCKFILE="/var/lock/subsys/$PROG"
OPTIONS="-redis.addr $redis_host:$redis_port -redis.password $redis_password"

# Source function library.
if [ -f /etc/rc.d/init.d/functions ]; then
  . /etc/rc.d/init.d/functions
else
  echo "/etc/rc.d/init.d/functions is not exists"
  exit 0
fi

start() {
  if [ -f $LOCKFILE ]
  then
    echo "$PROG is already running!"
  else
    echo -n "Starting $PROG: "
    nohup $EXEC $OPTIONS >/dev/null 2>&1 &
    RETVAL=$?
    [ $RETVAL -eq 0 ] && touch $LOCKFILE && success || failure
    echo
    return $RETVAL
  fi
}

stop() {
  echo -n "Stopping $PROG: "
  killproc $EXEC
  RETVAL=$?
  [ $RETVAL -eq 0 ] && rm -r $LOCKFILE && success || failure
  echo
}

restart ()
{
  stop
  sleep 1
  start
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  status)
    status $PROG
    ;;
  restart)
    restart
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
esac
exit $RETVAL