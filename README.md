# shell-study

shell语法学习

## 常见易错总结

### 数组

> + 数组的遍历：使用for来遍历是最佳的，while用角标来访问，不一定能够访问所有的数组；用下标申明函数，arr[10]=1；这个时候获取数组长度为1，但是0-9都是空，只有第十个元素为1；arr.sh中有demo，有兴趣的朋友可以自己尝试。

### 传参

> + 函数传参使用$*和$@区别：函数使用$*传参，其实只传入了一个参数，是所有参数的一个字符串集合，所以只有一个；要准确传参的话，还得使用$@;

### 运算符

> + 关系运算符：!=表示（不等于）；但是<、>、<=、>=这些需要用-lt、-gt、-le、-gt等替换；
> + 逻辑运算符：&& || 这两需要两个中括号[[]]

### 其他

> + expr index这个表达式在MacOS中执行会报错：expr:syntax error；但是Linux中没有问题。因为MacOS使用BSD expr，没有index指令，Linux通常使用GNU的expr，所以有这个命令。
> + -e命令是开启转义：echo "hello \n";echo -e "hello \n"；两个输出不一样。
> + [斗鱼学习shell地址](https://github.com/douyu/juno-install)
