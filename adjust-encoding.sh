/etc/init.d/postgresql start

psql -c "UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';"
psql -c "DROP DATABASE template1;"
psql -c "CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';"
psql -c "UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';"
psql -d template1 -c "VACUUM FREEZE;"
psql -c "UPDATE pg_database SET datallowconn = FALSE WHERE datname = 'template1';"
