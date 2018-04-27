#! /bin/bash 

if [ $# -ne 1 ]
then
        echo "Usage: $0 <# count>"
        echo "Usage: $0 <#number of containers>"
        echo "Usage: $0 Get the host IPs of all the running containers"
        exit 1
fi
tmp_dir="tmp/bin"
mkdir -p $tmp_dir
host_file="$tmp_dir/hosts.txt"
rm -f $host_file
count=$1
container_name="mycouchdb"
echo "Getting Host IPs for [$count] of CB containers..."
for i in `seq 1 $count`
do
    name=$container_name$i
    ip=`docker inspect $name | grep IPAddress\"\: | xargs | cut -d ":" -f 2 | sed -e 's/,//g' | awk {'print $1'}`
    echo "IP addr for [$name] is [$ip]"
    echo "$name $ip" >> $tmp_dir/hosts.txt
done
