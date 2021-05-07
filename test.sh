#!/bin/bash

# rm pgdata/backup_label
# rm pgdata/backup_label.old
# rm pgdata/recovery.signal

# rm -r pgdata_archive

# cp postgresql.conf pgdata/postgresql.conf

# ./up.sh
# docker exec -it -w "/opt/host" hs-db psql -U postgres -q -c 'drop table table_a'
# docker exec -it -w "/opt/host" hs-db psql -U postgres -q -c 'create table table_a (id integer)'
# docker exec -it -w "/opt/host" hs-db psql -U postgres -q -c 'insert into table_a values (111) returning id'
# docker exec -it -w "/opt/host" hs-db pg_basebackup -U postgres -D /opt/host/pgdata_archive
# cat pgdata_archive/backup_label
# docker exec -it -w "/opt/host" hs-db psql -U postgres -q -c 'update table_a set id = 222 returning id'
# docker exec -it -w "/opt/host" hs-db psql -U postgres -q -c "select pg_create_restore_point('fix 222')"
# docker exec -it -w "/opt/host" hs-db psql -U postgres -q -c 'update table_a set id = 333 returning id'
# ./down.sh

# rm -r pgdata
# cp -r pgdata_archive pgdata
# mv pgdata/backup_label.old pgdata/backup_label
# cp postgresql.conf.1 pgdata/postgresql.conf
# touch pgdata/recovery.signal

# ./up.sh
# docker logs hs-db
# docker exec -it -w "/opt/host" hs-db pg_controldata
# docker exec -it -w "/opt/host" hs-db psql -U postgres -q -c 'select id from table_a'
# docker exec -it -w "/opt/host" hs-db psql -U postgres -q -c 'select pg_wal_replay_resume()'
# ls -1 pgdata/pg_wal
# ls -1 pg_wal_archive
# ./down.sh
