# utility to exec a process in background and print the memory maps
$1 &
sleep 1
cat /proc/$!/maps
cat /proc/$!/smaps
cat /proc/$!/status
