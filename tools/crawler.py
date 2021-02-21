#!/usr/bin/python3
# coding: utf-8

import simplejson
import subprocess


def main(line):
    target = line
    # /browserpath 填写 chrome 或 chromium 浏览器执行文件所在路径
    cmd = ["tools/crawlergo", "-c", "/browserpath", "-t", "5", "-f", "smart", "--fuzz-path", "--robots-path", "--push-to-proxy", "http://127.0.0.1:7777", "--push-pool-max", "10", "-o", "json", target]
    rsp = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = rsp.communicate()
	#  "--[Mission Complete]--"  是任务结束的分隔字符串
    result = simplejson.loads(output.decode().split("--[Mission Complete]--")[1])
    req_list = result["req_list"]
    print(req_list[0])


if __name__ == '__main__':
    file = open("tasks.txt")
    for text in file.readlines():
        line = text.strip('\n')
        main(line)
