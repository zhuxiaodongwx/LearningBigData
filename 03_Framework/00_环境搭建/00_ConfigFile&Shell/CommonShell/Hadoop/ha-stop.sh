#!/bin/bash

# 关闭Hadoop集群(HDFS+Yarn+Zookeeper)

# 前提：
# 1、集群之间需要配置ssh免密登录
# 2、网络名称已经修改，并且配置好host解析

echo "==========     停止yarn     =========="
ssh hadoop103 "/opt/module/hadoop-3.1.3/sbin/stop-yarn.sh"

echo "==========     停止hdfs     =========="
ssh hadoop102 "/opt/module/hadoop-3.1.3/sbin/stop-dfs.sh"

echo "==========     停止timeLineServer     =========="
ssh hadoop103 "yarn --daemon stop timelineserver"

echo "==========     停止historyServer     =========="
ssh hadoop102 "mapred --daemon stop historyserver"

echo "==========     停止Zookper     =========="
ssh hadoop102 "zkServer.sh stop"
ssh hadoop103 "zkServer.sh stop"
ssh hadoop104 "zkServer.sh stop"

echo "==========     停止结果     =========="
ssh hadoop102 "jpsall"
