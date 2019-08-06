HADOOP_CMD="/home/master/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/home/master/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH_A="/a.txt"
INPUT_FILE_PATH_B="/b.txt"
OUTPUT_PATH="/output_sort_2"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

#Step 1.
$HADOOP_CMD jar $STREAM_JAR_PATH \
	-input $INPUT_FILE_PATH_A,$INPUT_FILE_PATH_B \
	-output $OUTPUT_PATH \
	-mapper "python map.py" \
	-reducer "python red.py" \
	-file ./map.py \
	-file ./red.py \
	-jobconf "mapred.reduce.tasks=2" \
	-jobconf "stream.num.map.output.key.fields=2" \
	-jobconf "num.key.fields.for.partition=1" \
	-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner
