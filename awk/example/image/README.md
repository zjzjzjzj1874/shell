## csv格式判断图片链接是否有效
```shell


cat image.csv | awk '{print $2}' | xargs curl -s -o /dev/null -w "%{http_code}\n" 

# file使用
./404.awk image.csv >>new.csv
```

## 测试数据图片链接有效性校验

```shell
#cat test.csv | awk -F ',' '{print $3}' | xargs curl -s -o /dev/null -w "%{http_code}\n"

awk -F',' '{              
    # 对 " 转义，使其可以嵌入在 curl 命令中
    gsub(/"/, "\\\"", $3)
    # 拼接 curl 命令
    cmd = "curl -s -o /dev/null -w \"%{http_code}\" \"" $3 "\""
    cmd | getline status_code
    close(cmd)
    if (status_code == 200) {
	print "成功", NR
        print $0 >> "new.csv"
    } else {
        print "failure",status_code, $3
        print "failure",status_code, $3 >> "failure.log"
    }
}' test.csv
```

```shell
./mt.awk test.csv >> mt.csv
```