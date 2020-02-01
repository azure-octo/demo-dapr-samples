
echo "Starting Fortran Server"
spawn-fcgi -a 127.0.0.1 -p 9000 ./fortran_fcgi
echo "Starting NGINX Server"
service nginx start