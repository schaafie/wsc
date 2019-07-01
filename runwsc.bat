set REPLACE_OS_VARS=true
set PORT=4000
set HOST=localhost
set SECRET_KEY_BASE=someverysecretelement
set DB_HOSTNAME=localhost
set DB_NAME=service_manager_dev
set DB_USERNAME=postgres
set DB_PASSWORD=postgres

_build/prod/rel/wsc/bin/wsc.bat foreground
