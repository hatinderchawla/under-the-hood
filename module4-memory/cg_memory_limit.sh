CG_DIR=/sys/fs/cgroup
echo "# Example - Memory Throttling"
mkdir -p $CG_DIR/memory/cg1
echo 10M > $CG_DIR/memory/cg1/memory.limit_in_bytes
echo "# memory.limit_in_bytes"
cat $CG_DIR/memory/cg1/memory.limit_in_bytes
echo "# memory.max_usage_in_bytes"
cat $CG_DIR/memory/cg1/memory.max_usage_in_bytes
echo "# memory.usage_in_bytes" 
cat $CG_DIR/memory/cg1/memory.usage_in_bytes

echo $$ > $CG_DIR/memory/cg1/cgroup.procs
echo "stress --vm 1 --vm-bytes 10M --timeout 10"
stress --vm 1 --vm-bytes 10M --timeout 10

echo $$ > /sys/fs/cgroup/memory/cgroup.procs

echo "# memory.usage_in_bytes" 
cat $CG_DIR/memory/cg1/memory.usage_in_bytes

echo "# memory.max_usage_in_bytes" 
cat $CG_DIR/memory/cg1/memory.max_usage_in_bytes

echo "# memory.stat" 
cat $CG_DIR/memory/cg1/memory.stat

rmdir $CG_DIR/memory/cg1
