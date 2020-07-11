# utility to exec a process in background and print the memory maps
$1 &
sleep 1
echo /proc/$!/maps
cat /proc/$!/maps
echo /proc/$!/task
ls /proc/$!/task
child_pid=$(ps --ppid $! --no-headers -o pid)
child_pid=$(echo $child_pid | tr -d ' ')
echo /proc/$child_pid/maps
cat /proc/$child_pid/maps
