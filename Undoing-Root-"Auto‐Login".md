This has been asked several times so I'll list the steps to undo autologin.
If you don't set a root password first, you will not be able to login to the container again, ever.

## 1. set the root password 
```bash
sudo passwd root
```

## 2. Remove Autologin
**remove** ```bash--autologin root``` **from** ```bash/etc/systemd/system/container-getty@1.service.d/override.conf```

## 3. Reboot Machine
```bash 
reboot