#! /bin/bash 
##########################################################
# Find the running containers and delete them
##########################################################

cons=$(docker ps -q)
echo "Found running containers..."
echo $cons
echo "To stop and delete"
for i in `echo $cons | xargs`
do
    echo "Stop container [$i]"
    docker stop $i
    echo "Del container [$i]"
    docker rm $i
done
