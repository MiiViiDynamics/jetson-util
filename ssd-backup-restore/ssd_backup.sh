#!/bin/bash

sudo tar -cpvf ssd_backup.tar --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/tmp --exclude=/run --exclude=/mnt --exclude=/media/* --exclude=/lost+found /