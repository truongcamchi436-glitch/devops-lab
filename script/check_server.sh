#!/bin/bash

echo "===== DevOps 服务器巡检 ====="

echo
echo "[1] 当前用户"
whoami

echo
echo "[2] 系统运行时间"
uptime

echo
echo "[3] 磁盘使用情况"
df -h /

DISK_USAGE=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')
if [ "$DISK_USAGE" -ge 80 ]; then
    echo "WARN: 磁盘使用率 ${DISK_USAGE}%，请及时清理"
else
    echo "PASS: 磁盘使用率 ${DISK_USAGE}%，正常"
fi

echo
echo "[4] Nginx 服务状态"
if systemctl is-active --quiet nginx; then
    echo "PASS：Nginx 正常运行"
else
    echo "FAIL：Nginx 未运行"
fi

echo
echo "[5] 本机网页响应"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 http://127.0.0.1)

if [ "$HTTP_CODE" = "200" ]; then
    echo "PASS：网页响应正常，HTTP $HTTP_CODE"
else
    echo "FAIL：网页响应异常，HTTP $HTTP_CODE"
fi

echo
echo "===== 巡检结束 ====="
