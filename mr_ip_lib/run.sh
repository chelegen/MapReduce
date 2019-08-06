HADOOP_CMD="/home/master/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/home/master/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH="/xxx.txt"

OUTPUT_PATH="/output_ip_lib"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

# Step 1.
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_PATH\
    -output $OUTPUT_PATH \
    -mapper "python map.py mapper_func IPLIB" \
    -reducer "cat" \
    -file ./map.py \
    -jobconf "mapred.reduce.tasks=2" \
    -jobconf "mapreduce.reduce.memory.mb=5000" \
    -jobconf "mapred.job.name=ip_lib_demo" \
    -cacheFile "hdfs://master:9000/ip.lib.txt#IPLIB" 
