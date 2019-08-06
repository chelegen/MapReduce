
# map阶段产生的输出是否压缩？
-jobconf "mapred.compress.map.output=true" \
# 通过什么样的压缩算法对数据进行压缩？
-jobconf "mapred.map.output.compression.codec=org.apache.hadoop.io.compress.GzipCodec" \


# MapReduce 最终的输出是否压缩？
-jobconf "mapred.output.compress=true" \
# 指定压缩格式
-jobconf "mapred.output.compression.codec=org.apache.hadoop.io.compress.GzipCodec" \
