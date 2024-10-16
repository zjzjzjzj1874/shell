#!/usr/bin/awk -f

BEGIN {
    FS = ","
}

{
    cmd = "curl -s -L -o /dev/null -w '%{http_code}' " $3
    cmd | getline status_code
    close(cmd)
    print "Executing: " cmd
    if (status_code == 200) {
        print $0
    } else {
        print "failure", status_code
    }
}