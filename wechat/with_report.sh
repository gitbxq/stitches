#!/bin/bash

# 调用企业微信API进行消息推送
# userid 处填写要进行消息推送的联系人id，@all 为所有人
# agentid 处填写自建应用的 AgentId
# url 处可填写为云服务器的 web 服务地址
curl -i -X POST -H 'Content-type':'application/json' -d '{
       "touser" : "userid",
       "msgtype" : "textcard",
       "agentid" : agentid,
       "textcard" : {
                "title" : "联动扫描任务完成",
                "description" : "<div class=\"gray\">'$1'</div><br><div class=\"normal\">目标扫描结束，存在疑似敏感信息</div><div class=\"normal\">目标总数：'$2'</div><div class=\"highlight\">报告所在文件：'$3'.html</div>",
                "url" : "url/'$3'.html",
                            "btntxt":"更多"
       },
       "enable_id_trans": 0,
       "enable_duplicate_check": 0,
       "duplicate_check_interval": 1800
    }' $4

exit 0
