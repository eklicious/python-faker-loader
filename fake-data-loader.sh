# Param 1: which model, e.g. member_sample.csv
# Param 2: how many threads in parallel, e.g. # of cores * 2
# Param 3: # of bulk insert loops
# Param 4: # of inserts per bulk insert
# Param 5: non-srv url to cluster
# Param 6: db name
# Param 7: collection name
#
# This will calculate the starting id based on parallel threads and bulk insert loops and # of objects to insert per bulk and spin off parallel threads
# Example: ./fake-data-loader.sh <csv model without the models dir path> <# of parallel threads> <# of loops per thread> <# of bulk inserts per thread loop> "mongodb://<user>:<pwd>@<shard0>:27017,<shard1>:27017,<shard2>:27017/test?replicaSet=<repsetnm>&ssl=true&authSource=admin" <db> <collection> 

startCount=1

# Make a loop based on number of threads
echo "Number of threads: $2"
for i in $(seq 1 $2)
do
   echo "Start Count: $startCount"
   startCount=$( expr $3 '*' $4 + $startCount )
   python3 fake-data.py models/$1 $3 $4 $startCount "$5" $6 $7 &
done
