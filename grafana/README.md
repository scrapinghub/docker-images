``
# check GRAFANA_VERSION variable
cat .env
docker-compose build
docker-compose up -d
docker-compose logs -f
# wait for 1 minute until mysql is ready

`

now you can go to `http://localhost:3000` and login as `admin:admin`


If you put a mysqldump into `testdata/grafana.sql` and then start mysql it will automatically import the dump
