- 发布或更新步骤
  - 拉取最新分支的代码
    `git checkout out {branch}`
  - 打包压缩服务
  - 将压缩包上传到服务器 
  `scp -r kms_api_v2.zip ubuntu@{your-ip}:/home/ubuntu`
  - 到服务器上执行脚本
  `sudo bash /data/golang_project/start.sh`
  - 然后即可查看启动命令
  `docker ps -a`
- 注意:
  - `dockerfile`文件在`/data/golang_project/dockerfile`下面,新的服务需要添加`dockerfile`至此