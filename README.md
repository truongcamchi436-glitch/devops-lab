# DevOps Linux 运维实操项目

## 项目简介

本项目是在 Ubuntu Linux 环境下完成的基础运维实操，主要包括 Nginx Web 服务部署、Shell 服务器巡检、故障模拟、故障定位与恢复，以及 Git/GitHub 版本管理。

## 实操环境

- Ubuntu Linux
- Nginx
- Shell
- curl
- systemctl
- Git
- GitHub

## 项目结构

devops-lab/
- configs/app.conf
- logs/incident-report.txt
- script/check_server.sh
- script/hello.sh
- web/index.html
- .gitignore
- README.md

## 服务器巡检

通过 Shell 脚本实现基础服务器巡检：

- 当前用户检查
- 系统运行时间检查
- 磁盘使用情况检查
- Nginx 服务状态检查
- 本机网页 HTTP 响应检查

运行命令：

bash ~/devops-lab/script/check_server.sh

## Nginx 故障处理实操

模拟停止 Nginx 服务后，巡检脚本能够识别：

FAIL: Nginx 未运行
FAIL: 网页响应异常，HTTP 000

恢复服务：

sudo systemctl start nginx

验证服务：

systemctl is-active nginx
curl -I --max-time 5 http://127.0.0.1

恢复后：

active
HTTP/1.1 200 OK

## 实操总结

通过本项目完成了 Linux 基础文件管理、Nginx 服务管理、Shell 巡检脚本、HTTP 服务检测、简单故障排查恢复以及 Git/GitHub 基础版本管理实操。
