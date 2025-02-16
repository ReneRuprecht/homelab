#!/bin/bash
id=$1
name=$2
storage="internal-storage"
image=$3

if [ -z $id ] || [[ $id == *"-h" ]]
then
	echo "usage: id name image"
	exit 0
fi

if [ -z $name ] 
then
	echo "name must not be empty"
       	exit 1
fi

if [ -z $image ] 
then
	echo "image must not be empty"
       	exit 1
fi


qm create $id --memory 2048 --core 2 --name $name --net0 virtio,bridge=vmbr0
qm disk import $id $image $storage
qm set $id --scsihw virtio-scsi-pci --scsi0 $storage:$id/vm-$id-disk-0.raw
qm set $id --ide2 $storage:cloudinit
qm set $id --boot c --bootdisk scsi0
qm set $id --ipconfig0 ip=dhcp
qm set $id --agent enabled=1
qm set $id --serial0 socket --vga serial0
qm set $id --cpu cputype=host


# Set ubuntu2404 to 4GB disk 
if [[ $name == *"2404"* ]]; then
	qm resize $id scsi0 +100M 
	qm resize $id scsi0 +316M 
fi
qm template $id

