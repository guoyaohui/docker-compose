#!/bin/bash
git pull
# 修改当前同级目录和同级目录的子目录的sh文件的执行权限
find ./ -name "*.sh"|xargs chmod +x
echo "完成"