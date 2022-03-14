#!/bin/bash
# 临时文件

# 创建临时文件
create_tmp() {
    # 创建一个临时文件
    # tmp=`mktemp`
    # echo ${tmp}

    # # 创建一个临时文件，失败后退出
    # tmp=`mktemp || exit 1`
    # echo ${tmp}

    # # 创建一个临时文件夹
    # mktemp -d 

    # 指定目录
    # mktemp -p /Users/rock/ # 有些操作系统没有-p的命令，可以man mktemp查看

    # 指定临时文件名模板，至少连续3个XXX，表示随机字符，建议至少使用6个
    mktemp -t mytemp.XXXXXX
}

trap_sig() {
    # trap用来响应系统信号
    # 最常见的信号就是SIGINT(中断)，即Ctrl+C所产生的信号。
    trap -l
    # 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL
    # 5) SIGTRAP      6) SIGABRT      7) SIGEMT       8) SIGFPE
    # 9) SIGKILL     10) SIGBUS      11) SIGSEGV     12) SIGSYS
    # 13) SIGPIPE     14) SIGALRM     15) SIGTERM     16) SIGURG
    # 17) SIGSTOP     18) SIGTSTP     19) SIGCONT     20) SIGCHLD
    # 21) SIGTTIN     22) SIGTTOU     23) SIGIO       24) SIGXCPU
    # 25) SIGXFSZ     26) SIGVTALRM   27) SIGPROF     28) SIGWINCH
    # 29) SIGINFO     30) SIGUSR1     31) SIGUSR2

    # trap命令格式 =》 trap [动作] [信号1] [信号2]...
    # HUP：编号1，脚本与所在的终端脱离联系。
    # INT：编号2，用户按下 Ctrl + C，意图让脚本终止运行。
    # QUIT：编号3，用户按下 Ctrl + 斜杠，意图退出脚本。
    # KILL：编号9，该信号用于杀死进程。
    # TERM：编号15，这是kill命令发出的默认信号。
    # EXIT：编号0，这不是系统信号，而是 Bash 脚本特有的信号，不管什么情况，只要退出脚本就会产生。
}

# create_tmp

trap 'echo "我要退出了"' EXIT  # 主要用在需要退出时清理临时文件和文件夹
trap_sig
