#!/bin/bash

# 检查脚本是否在子目录中执行
directory="${1:-.}"

# 遍历当前目录及其所有子目录
find "$directory" -type d | while read -r dir; do
  # 获取目录名
  dirname=$(basename "$dir")

  # 创建与目录同名的.md文件
  md_file="$dir/$dirname.md"

  # 检查文件是否存在
  if [ ! -f "$md_file" ]; then
    # 创建一个新的.md文件
    touch "$md_file"
    echo "Created: $md_file"
  else
    echo "Skipped (already exists): $md_file"
  fi
done
