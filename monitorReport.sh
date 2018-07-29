#!/bin/bash

lines=$(wc -l < /root/resUsage/report)
report=$(less /root/resUsage/report)

if (($lines > 2));then
curl -s -X POST https://api.telegram.org/bot625765153:AAE5T1o61klELqj4iqxtGb2gCEl21oi6C44/sendMessage -d chat_id=110374168 -d text=$'We have some problem! The report is:\n'"$report" &> /dev/null
topCpu=$(ps -Ao user,comm,pid,pcpu --sort=-pcpu | head -n 4)
topRam=$(ps -Ao user,comm,pid,pmem --sort=-pmem | head -n 4)
curl -s -X POST https://api.telegram.org/bot625765153:AAE5T1o61klELqj4iqxtGb2gCEl21oi6C44/sendMessage -d chat_id=110374168 -d text=$'Here are top 3 cpu consuming proccesses:\n'"$topCpu" &> /dev/null
curl -s -X POST https://api.telegram.org/bot625765153:AAE5T1o61klELqj4iqxtGb2gCEl21oi6C44/sendMessage -d chat_id=110374168 -d text=$'Here are top 3 memory consuming proccesses:\n'"$topRam" &> /dev/null
sed -i '2,$d' /root/resUsage/report
fi

