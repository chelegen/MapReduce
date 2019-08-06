HADOOP_CMD="/home/master/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/home/master/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH="/aaa.txt"
OUTPUT_PATH="/output_sort_3"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

#Step 1.
$HADOOP_CMD jar $STREAM_JAR_PATH \
	-input $INPUT_FILE_PATH \
	-output $OUTPUT_PATH \
	-mapper "cat" \
	-reducer "cat" \
	-jobconf stream.num.map.output.key.fields=3 \
	-jobconf stream.num.output.field.separator=. \
	-jobconf map.output.key.field.separator=. \
	-jobconf mapred.text.key.partitioner.option=-k2,3 \
	-jobconf mapred.reduce.tasks=3
