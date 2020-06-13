CG_DIR=/sys/fs/cgroup

# Now set cpu shares of 512
echo "# Example 4 - With pid max limit set"
mkdir -p $CG_DIR/pids/cg1
echo ""
echo 5 > $CG_DIR/pids/cg1/pids.max
echo "# pids.max"
cat $CG_DIR/pids/cg1/pids.max

echo $$ > $CG_DIR/pids/cg1/cgroup.procs

echo "# Executing sleep in background"
NUM_PARALLEL=${1:-5}
for ((i=0; i<$NUM_PARALLEL; i++))
do
  echo "# pids.current file"
  cat $CG_DIR/pids/cg1/pids.current
  sleep 1 &
done

echo "# pids.current file"
cat $CG_DIR/pids/cg1/pids.current

wait

echo $$ > /sys/fs/cgroup/pids/cgroup.procs
rmdir $CG_DIR/pids/cg1

