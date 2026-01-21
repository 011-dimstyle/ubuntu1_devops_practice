# **Ubuntu Server Autoinstall using cloud-init**
This repository provides **Bash script** to automate Simple Ubuntu Server setup using Subiquity and cloud-init on **QEMU/KVM** with **libvirt**. This setup has been tested on **Ubuntu 24.04 LTS** and works with a proper libvirt setup.

---

## **Requirements**

### **Install Requirements Packages (Debian/Ubuntu)**
```bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst ovmf
```

### **Install Requirements Packages (Fedora)**
```bash
sudo dnf upgrade -y 
sudo dnf install @virtualization edk2-ovmf -y
```
Enable libvirt systemd to activate the service.
```bash
sudo systemctl enable --now systemd
sudo systemctl status systemd
```
Add `libvirt` and `kvm` groups to user, for non-root usage.
```bash
sudo usermod -aG kvm,libvirt $USER
```

---

## **Creating a Virtual Machine**
```bash
./bin/define_vm.sh -n ubuntu1 -m 8192 -vc 6 -cd /mnt/cdrom/ubuntu-24.04.3-live-server-amd64.iso -d /mnt/ubuntu1/ubuntu1.qcow2 
```
- **-n ubuntu1 -> Virtual Machine's name**
- **-m 8192 -> Memory (mb)**
- **-vc 6 -> Amount of vcpus**
- **-cd /mnt/cdrom/ubuntu-24.04.3-live-server-amd64.iso -> /path/to/your/ubuntu.iso**
- **-d /mnt/ubuntu1/ubuntu1.qcow2 -> /path/to/your/disk**

## **Deleting a Virtual Machine**
```bash
./bin/delete_vm.sh -n <VM_NAME>
```

---

## **Contributors**
- **dimstyle (Dimas Alexander)** – Testing.


