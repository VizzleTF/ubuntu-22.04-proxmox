rm jammy-server-cloudimg-amd64.img
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
qm create 9009 --name "template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk 9009 jammy-server-cloudimg-amd64.img SSD_appollo
qm set 9009 --scsihw virtio-scsi-pci --scsi0 SSD_appollo:vm-9009-disk-0
qm set 9009 --boot c --bootdisk scsi0
qm set 9009 --scsi1 SSD_appollo:cloudinit
qm set 9009 --agent enabled=1
rm jammy-server-cloudimg-amd64.img
