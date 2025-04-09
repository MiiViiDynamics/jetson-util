拷贝SSD到移动硬盘-操作步骤

准备一个移动硬盘（或U盘），空间需要超过设备中SSD已使用的空间
拷贝ssd_backup.sh到这个移动硬盘中，挂载移动硬盘到设备上
sudo mount /dev/sda1 /media
执行备份脚本，成功后会在移动硬盘中生成一个ssd_backup.tar的文件，这个文件就是我们需要的镜像
cd /media
chmod +x ssd_backup.sh
./ssd_backup.sh
执行以下命令后拔下移动硬盘
cd
sudo umount /media

恢复到SSD-操作步骤

在设备上插入一个全新的SSD，启动设备
拷贝ssd_restore.sh到这个移动硬盘中，挂载移动硬盘到设备上
sudo mount /dev/sda1 /media
执行恢复脚本
cd /media
chmod +x ssd_restore.sh
./ssd_restore.sh

设置从SSD启动

如果设备没有从SSD启动
需拷贝镜像由SSD启动中的nvme_config.sh文件到设备中，执行以下命令并重启

chmod +x nvme_config.sh
sudo ./nvme_config.sh