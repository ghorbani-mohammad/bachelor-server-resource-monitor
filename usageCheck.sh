#!/bin/bash
echo "Resource Monitoring has started in $(date +%Y-%m-%d_%H:%M:%S)" > /root/resUsage/report

while true
do
cpu=$(top -b -n2 | grep "Cpu(s)" | awk '{print $2+$4 }' | tail -n1)
cpu=$(printf "%.0f" $cpu)
if (($cpu > 90));then
echo "$(date +%Y-%m-%d_%H:%M:%S) CPU Warning - Usage is: $cpu" >> /root/resUsage/report
fi
memory=$(free|grep Mem|awk '{print $3/$2 * 100.0}')
memory=$(printf "%.0f" $memory)
if (($memory > 80));then
echo "$(date +%Y-%m-%d_%H:%M:%S) MEMORY Warning - Usage is: $memory" >> /root/resUsage/report
fi
done
