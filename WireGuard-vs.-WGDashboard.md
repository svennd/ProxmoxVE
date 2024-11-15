# WGDashboard vs WireGuard

## Overview
WireGuard and WGDashboard are often used together, but they serve different purposes. This article highlights their differences and provides guidance for WGDashboard users who may need help with their WireGuard setup.

---

## What is WireGuard?
[WireGuard](https://www.wireguard.com/) is a simple, high-performance VPN protocol that aims to provide an efficient and secure alternative to traditional VPN protocols. **Key features** of WireGuard include:
- **Speed and Efficiency**: Designed for minimal configuration and high performance.
- **Modern Cryptography**: Utilizes state-of-the-art encryption for enhanced security.
- **Core VPN Functionality**: Provides the VPN tunnel but lacks a user interface or built-in peer management.

---

## What is WGDashboard?
[WGDashboard](https://donaldzou.github.io/WGDashboard-Documentation/) is a **web-based management tool** specifically designed to enhance WireGuard’s usability by providing a graphical user interface (GUI) for configuring and monitoring peers.

| **Feature**                       | **Description** |
|-----------------------------------|-----------------|
| **Auto Configuration Detection**  | Scans for existing WireGuard configurations under `/etc/wireguard` |
| **User-Friendly Interface**       | Credential-protected dashboard with **TOTP** (Two-Factor Authentication) |
| **Peer Management**               | Allows adding, editing, deleting, and restricting peers individually or in bulk |
| **Configuration Sharing**         | Generates **QR codes** and `.conf` files for peers, with options for public links |
| **Real-Time Monitoring**          | Displays live peer status for real-time tracking |
| **Testing Tools**                 | Provides **ping** and **traceroute** tools for peer diagnostics |

---

### Important Note for Users
> **WireGuard and WGDashboard are separate components**:
> - **WireGuard** is the VPN software itself.
> - **WGDashboard** is an optional tool for managing and monitoring WireGuard configurations.

If you encounter issues specifically with **WireGuard** (e.g., connectivity or tunnel errors), refer to WireGuard’s [official documentation](https://www.wireguard.com/) or support. **WGDashboard** issues related to the interface, peer management, or dashboard functionality can be reported [here.](https://github.com/donaldzou/WGDashboard).

---

# Default WireGuard Configuration

A default configuration file (`wg0.conf`) is already included in the standard installation. This configuration is designed to simplify the setup and enhance understanding for new users. You can view and edit it using:

```bash
nano /etc/wireguard/wg0.conf
```

The default configuration looks similar to the following:
```bash
[Interface]
PrivateKey = <your-private-key>
Address = 10.0.0.1/24
SaveConfig = true
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -A FORWARD -o wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE;
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -D FORWARD -o wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE;
ListenPort = 51820
