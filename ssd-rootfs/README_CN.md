1. 把copy_rootfs_3_in_1.sh文件copy到设备中
2. chmod +x给脚本文件添加可执行权限
3. sudo mkfs -t ext4 /dev/xxx，格式化外部存储设备
4. ./copy_rootfs_3_in_1 /dev/xxx，xxx为外部存储设备
5. 把nvme_config.sh文件copy到设备中
6. chmod +x给脚本文件添加可执行权限
7. 执行sudo ./nvme_config.sh
8. 重启设备
9. 系统启动后后，执行df -h观察/目录是否在外部存储介质中