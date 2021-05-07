
docker run -it --rm --entrypoint bash -v "$(pwd):/opt/host" -v "$(pwd)/pgdata:/data" aidbox/db:12.1.1-PRO.RC1

docker build -t aidbox/db:yangand .

su postgres -c "PATH=$PATH pg_ctl -m i -w stop"
