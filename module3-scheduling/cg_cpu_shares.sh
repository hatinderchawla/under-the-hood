CG_DIR=/sys/fs/cgroup

echo "# Example 3 - With cpu shares set"
mkdir -p $CG_DIR/cpu/cg1
mkdir -p $CG_DIR/cpu/cg2
# Now set cpu shares, default 1024
echo ${2:-1024} > $CG_DIR/cpu/cg1/cpu.shares
echo ${3:-1024} > $CG_DIR/cpu/cg2/cpu.shares
echo "# cpu.shares cg1"
cat $CG_DIR/cpu/cg1/cpu.shares
echo "# cpu.shares cg2"
cat $CG_DIR/cpu/cg2/cpu.shares

echo "# Execution Time Data"
# start 4 processes in cg1 and cg2 cgroups
NUM_PARALLEL=${1:-4}
for ((i=0; i<$NUM_PARALLEL; i++))
do
  /usr/bin/time -f "%E real cg1" ./loop &
  echo $! > $CG_DIR/cpu/cg1/cgroup.procs
  /usr/bin/time -f "%E real cg2" ./loop &
  echo $! > $CG_DIR/cpu/cg2/cgroup.procs
done
wait

echo "# cg1/cpuacct.usage file"
cat $CG_DIR/cpu/cg1/cpuacct.usage
echo "# cg2/cpuacct.usage file"
cat $CG_DIR/cpu/cg2/cpuacct.usage

echo "# cg1/cpuacct.usage_percpu file"
cat $CG_DIR/cpu/cg1/cpuacct.usage_percpu
echo "# cg2/cpuacct.usage_percpu file"
cat $CG_DIR/cpu/cg2/cpuacct.usage_percpu

rmdir $CG_DIR/cpu/cg1
rmdir $CG_DIR/cpu/cg2


