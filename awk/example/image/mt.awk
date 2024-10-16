#!/usr/bin/awk -f

BEGIN {
    FS = ","
}

{
    # 对特殊的符号转义
    gsub(/"/, "\\\"", $3)
    # 拼接 curl 命令
    cmd = "curl -s -o /dev/null -w \"%{http_code}\" \"" $3 "\""
    cmd | getline status_code
    close(cmd)
    print "status_code ==== " status_code, $3
    if (status_code == 200) {
        print $0 >> "mt.csv"
    } else {
        print "请求失败，status_code=== " status_code " url == " $3 >> "fail.log"
    }
}