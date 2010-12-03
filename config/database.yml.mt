development:
  adapter: mysql
  encoding: utf8
  reconnect: false
  database: orbis_development
  pool: 5
  username: root
  password:
  host: localhost

test: &TEST
  adapter: mysql
  encoding: utf8
  reconnect: false
  database: orbis_test
  pool: 5
  username: root
  password:
  host: localhost

production:
  adapter: mysql
  encoding: utf8
  database: db21636_orbis_prod
  username: db21636_orbis
  password: Orgone654
  socket: /var/run/mysqld/mysqld.sock
  #host: internal-db.s21636.gridserver.com
host: localhost


cucumber:
  <<: *TEST
