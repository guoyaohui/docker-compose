#!/bin/bash
# 放弃本地git所有的修改， 并且进行更新git仓库
git checkout . && git clean -xdf
git pull
# 修改当前同级目录和同级目录的子目录的sh文件的执行权限
chmod +x ./*.sh
chmod +x ./**/*.sh
echo "完成"
