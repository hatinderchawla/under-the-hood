CG_DIR=/sys/fs/cgroup

# Now set cpu shares of 512
echo "# Example 3 - With cpu shares set"
mkdir -p $CG_DIR/cpu/cg1
mkdir -p $CG_DIR/cpuset/cg1
echo ""
echo 512 > $CG_DIR/cpu/cg1/cpu.shares
echo "# cpu.shares"
cat $CG_DIR/cpu/cg1/cpu.shares
echo 0 > $CG_DIR/cpuset/cg1/cpuset.cpus
echo 0 > $CG_DIR/cpuset/cg1/cpuset.mems
echo "# cpuset.cpus"
cat $CG_DIR/cpuset/cg1/cpuset.cpus
echo "# cpuset.mems"
cat $CG_DIR/cpuset/cg1/cpuset.mems

echo "# Execution Time Data"
echo $$ > $CG_DIR/cpuset/cg1/cgroup.procs
echo $$ > $CG_DIR/cpu/cg1/cgroup.procs

NUM_PARALLEL=${1:-4}
for ((i=0; i<$NUM_PARALLEL; i++))
do
  /usr/bin/time -f "%E real" ./loop &
done
wait

echo $$ > /sys/fs/cgroup/cpu/cgroup.procs
echo $$ > /sys/fs/cgroup/cpuset/cgroup.procs

echo "# cpu.stat file"
cat $CG_DIR/cpu/cg1/cpu.stat
echo "# cpuacct.stat file"
cat $CG_DIR/cpu/cg1/cpuacct.stat
echo "# cpuacct.usage file"
cat $CG_DIR/cpu/cg1/cpuacct.usage
echo "# cpuacct.usage_percpu file"
cat $CG_DIR/cpu/cg1/cpuacct.usage_percpu


rmdir $CG_DIR/cpu/cg1
rmdir $CG_DIR/cpuset/cg1

