HADOOP_CMD="/home/master/hadoop-2.6.5/bin/hadoop"
STREAM_JAR_PATH="/home/master/hadoop-2.6.5/share/hadoop/tools/lib/hadoop-streaming-2.6.5.jar"

INPUT_FILE_PATH_A="/a.txt"
INPUT_FILE_PATH_B="/b.txt"

OUTPUT_A_PATH="/output_join_a"
OUTPUT_B_PATH="/output_join_b"
OUTPUT_JOIN_PATH="/output_join"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_A_PATH $OUTPUT_B_PATH $OUTPUT_JOIN_PATH

# Step 1.
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH_A \
    -output $OUTPUT_A_PATH \
    -mapper "python map_a.py" \
    -file ./map_a.py \

# Step 2.
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH_B \
    -output $OUTPUT_B_PATH \
    -mapper "python map_b.py" \
    -file ./map_b.py \

# Step 3.
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $OUTPUT_A_PATH,$OUTPUT_B_PATH \
    -output $OUTPUT_JOIN_PATH \
    -mapper "cat" \
    -reducer "python red.py" \
    -file ./red.py \
    -jobconf stream.num.map.output.key.fields=2 \
    -jobconf num.key.fields.for.partition=1
