#!/bin/bash
# 放弃本地git所有的修改， 并且进行更新git仓库
git checkout . && git clean -xdf
git pull
chmod +x ./*.sh
