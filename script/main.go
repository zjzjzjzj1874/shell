package main

import (
	"fmt"

	"github.com/bitfield/script"
)

const (
	TestFile            = "test.log"
	TestPath            = "__testdata__"
	NginxDeploymentFile = "https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/nginx/nginx-deployment.yaml"
)

func main() {
	//GetLogFromRemote()

	//CountLines()

	//MatchWithCounter("err")

	Dir(TestPath)
}

// NormalFile 普通文件测试
func NormalFile() {
	pipe := script.File(TestFile)
	defer func() { _ = pipe.Close() }()

	// 注意:管道只能使用一次,用了之后后面在使用这个管道,文件的内容将为空
	out, err := pipe.String()
	if err != nil {
		fmt.Println("err msg:", err)
		return
	}
	fmt.Println(out)

	// 管道二次读取将为空
	out, _ = pipe.String()
	fmt.Println(out)
}

func Dir(path string) {
	res, err := script.ListFiles(path).Slice()
	if err != nil {
		fmt.Println("err msg:", err)
		return
	}

	for _, re := range res {
		fmt.Println(re)
	}
	//fmt.Println(res)
}

// CountLines 文件行数统计
func CountLines() {
	pipe := script.File(TestFile)
	defer func() { _ = pipe.Close() }()

	line, _ := pipe.CountLines()
	fmt.Println("文件行数:", line)
}

// GetLogFromRemote 远程文件下载
func GetLogFromRemote() {
	out, err := script.Get(NginxDeploymentFile).String()
	if err != nil {
		fmt.Println("err msg:", err)
		return
	}
	fmt.Println(out)
}

// MatchWithCounter 按条件匹配
func MatchWithCounter(match string) {
	pipe := script.File(TestFile)
	defer func() { _ = pipe.Close() }()

	line, _ := pipe.Match(match).CountLines()
	fmt.Println("文件行数:", line)

}
