#!/bin/bash
###
 # @Author: zjzjzjzj1874 zjzjzjzj1874@gmail.com
 # @Date: 2025-02-05 15:06:27
 # @LastEditors: zjzjzjzj1874 zjzjzjzj1874@gmail.com
 # @LastEditTime: 2025-02-05 15:39:15
 # @FilePath: /shell/examples/chapter1/read.sh
 # @Description: read变量读取及整行数据读取
### 

printf "what is your name?\n"
read NAME # 输入，并且空格分隔，多个的话，输出多行
printf "hello, %s!\n" ${NAME}


printf "Tell me a story.\n"
read -r STORY # 使用-r参数读取整行文本，包括空格
printf "fine, below is my story:\n\t%s\n" "${STORY}"

