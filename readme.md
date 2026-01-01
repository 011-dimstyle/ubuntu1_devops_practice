# **Ubuntu Server Autoinstall using cloud-init**
This repository provides **Bash script** to automate Simple Ubuntu Server setup using Subiquity and cloud-init on **QEMU/KVM** with **libvirt**. This setup has been tested on **Ubuntu 24.04 LTS** and works with a proper libvirt setup.

---

## **Requirements**

### **Install Requirements Packages (Debian/Ubuntu)**
```bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst
```

### **Install Requirements Packages (Fedora)**
```bash
sudo dnf upgrade -y 
sudo dnf install @virtualization -y
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

