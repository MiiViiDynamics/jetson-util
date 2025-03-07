1. Copy the copy_rootfs_3_in_1.sh file to the device.
2. Add executable permissions to the script file using chmod +x.
3. Format the external storage device using sudo mkfs -t ext4 /dev/xxx.
4. Run ./copy_rootfs_3_in_1.sh /dev/xxx, where xxx is the external storage device.
5. Copy the nvme_config.sh file to the device.
6. Add executable permissions to the script file using chmod +x.
7. Execute sudo ./nvme_config.sh.
8. Reboot the device.
9. After the system starts, execute df -h to observe if the / directory is on the external storage medium.
