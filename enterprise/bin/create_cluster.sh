#! /bin/bash 

if [ $# -ne 1 ]
then
        echo "Usage: $0 <# count> Use address http://localhost:8091 to access the GUI"
        echo "Usage: $0 <#number of containers to create>"
        exit 1
fi

count=$1
echo "Creating [$count] CB containers..."
for i in `seq 1 $count`
do
    echo "Count = [$i]"
    if [ $i -eq 1 ]
    then
        echo "Expose ports here [$i]"
        docker run -d --name mycouchdb$i -p 8091-8094:8091-8094 -p 11210:11210 -h cb$i ramdocker:enterprise-5.1.0
    fi
    docker run -d --name mycouchdb$i -h cb$i ramdocker:enterprise-5.1.0
done
