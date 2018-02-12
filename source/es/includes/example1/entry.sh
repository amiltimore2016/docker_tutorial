#!/bin/bash

export APACHE_RUN_USER=www-data
export APACHE_RUN_GROUP=www-data
export APACHE_LOG_DIR=/var/log/apache2
export APACHE_LOCK_DIR=/var/run
export APACHE_PID_FILE=/var/tmp/apache.pid

/usr/sbin/apache2 -D "FOREGROUND"
