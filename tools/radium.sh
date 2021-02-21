#!/bin/bash

# 如有需要可在此处 rad 执行命令中指定 chrome 或 chromium 浏览器执行文件所在位置
for line in `cat tasks.txt`; do
    tools/rad_linux_amd64 -t $line --http-proxy 127.0.0.1:7777
done

exit 0
