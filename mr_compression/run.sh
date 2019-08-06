HADOOP_CMD="/home/master/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/home/master/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH="/The_Man_of_Property.txt"
OUTPUT_PATH="/output_compression"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

#Step 1.
$HADOOP_CMD jar $STREAM_JAR_PATH \
	-input $INPUT_FILE_PATH \
	-output $OUTPUT_PATH \
	-mapper "python map.py" \
	-reducer "python red.py" \
	-jobconf "mapred.reduce.tasks=2" \
	-jobconf "mapred.job.name=mr_compression" \
	-jobconf "mapred.compress.map.output=true" \
	-jobconf "mapred.map.output.compression.codec=org.apache.hadoop.io.compress.GzipCodec" \
	-jobconf "mapred.output.compress=true" \
	-jobconf "mapred.output.compression.codec=org.apache.hadoop.io.compress.GzipCodec" \
	-file "./map.py" \
	-file "./red.py"
