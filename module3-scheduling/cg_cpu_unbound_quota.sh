CG_DIR=/sys/fs/cgroup
mkdir -p $CG_DIR/cpu/cg1
echo "# Example 1 - No throttling"
echo "# cpu.cfs_period_us"
cat $CG_DIR/cpu/cg1/cpu.cfs_period_us 
echo "# cpu.cfs_quota_us"
cat $CG_DIR/cpu/cg1/cpu.cfs_quota_us

echo "# Execution Time Data"
echo $$ > $CG_DIR/cpu/cg1/cgroup.procs
NUM_PARALLEL=${1:-4}
for ((i=0; i<$NUM_PARALLEL; i++))
do
  /usr/bin/time -f "%E real" ./loop &
done
wait
echo $$ > /sys/fs/cgroup/cpu/cgroup.procs

echo "# cpu.stat file"
cat $CG_DIR/cpu/cg1/cpu.stat 
echo "# cpuacct.stat file"
cat $CG_DIR/cpu/cg1/cpuacct.stat
echo "# cpuacct.usage file"
cat $CG_DIR/cpu/cg1/cpuacct.usage
echo "# cpuacct.usage_percpu file"
cat $CG_DIR/cpu/cg1/cpuacct.usage_percpu

rmdir $CG_DIR/cpu/cg1

