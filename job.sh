#!/bin/sh

/Users/daniel/.rvm/bin/rvm install "ruby-2.4.5"

wait

set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately

bash -l -c "bundle exec rake db:load[9999,'incremental',true]"

wait

/usr/local/bin/pg_restore -c -j 5 -v -h ec2-63-34-116-123.eu-west-1.compute.amazonaws.com -p 5432 -U udgs31kp3vobc0 -d d8hhcuqipa3bmp --no-owner --schema=ctgov ~/aact-files/postgres.dmp

# ERROR psql: could not connect to server: No such file or directory (Mac OS X)
# https://stackoverflow.com/questions/13573204/psql-could-not-connect-to-server-no-such-file-or-directory-mac-os-x
# rm /usr/local/var/postgres/postmaster.pid
