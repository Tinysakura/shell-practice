# !/bin/bash
# 测试shell函数的调用

# 导入声明了函数first的文件
source first_function.sh

echo "调用函数first"
first $1
