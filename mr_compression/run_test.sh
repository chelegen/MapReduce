HADOOP_CMD="/home/master/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/home/master/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_PATH="/output_compression"
OUTPUT_PATH="/output_compression_uncompress"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

#Step 1.
$HADOOP_CMD jar $STREAM_JAR_PATH \
	-input $INPUT_FILE_PATH \
	-output $OUTPUT_PATH \
	-mapper "cat" \
	-jobconf "mapred.reduce.tasks=0"

