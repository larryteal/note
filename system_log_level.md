


## log level file
```
/proc/sys/kernel/printk
```

## default level
```
6       6       1       7       4
```


sudo sh -c 'echo 3       6       1       7       4 > /proc/sys/kernel/printk'