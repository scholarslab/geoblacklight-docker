git pull
docker-compose down
n=0
until [ $n -ge 5 ]
do
    docker-compose up -d && break
    n=$[$n+1]
    sleep 20
done
if [ $n -ge 5 ]; then echo "Failed to restart. Notifying dev list..." && sendmail slab_devs@virginia.edu < failure-email; fi
