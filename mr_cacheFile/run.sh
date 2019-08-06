HADOOP_CMD="/home/master/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/home/master/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH="/The_Man_of_Property.txt"
OUTPUT_PATH="/output_cachefile_broadcast"
$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH
#Step 1.
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH \
    -output $OUTPUT_PATH \
    -mapper "python map.py mapper_func AA" \
    -reducer "python red.py reducer_func" \
    -jobconf "mapred.reduce.tasks=3" \
    -jobconf "mapred.job.name=cachefileDemo" \
    -cacheFile "hdfs://master:9000/white_list#AA" \
    -file "./map.py" \
    -file "./red.py"
