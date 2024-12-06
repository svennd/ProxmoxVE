This guide explains how to install and set up the community-scripts repository and its various scripts.

## Dependencies:
Ensure that the following dependencies are installed on your system:
- **Proxmox VE** (for managing virtual machines and containers)
- **Bash**
- **curl**
- **sudo**

## Installation Steps:
1. **Clone the Repository**:
    ```bash
    git clone https://github.com/community-scripts/ProxmoxVE.git
    cd ProxmoxVE
    ```

2. **Run the Setup Script**:
    To install the necessary dependencies and configure your system, run the setup script:
    ```bash
    bash setup.sh
    ```

3. **Run Installation Scripts**:
    After the setup is complete, navigate to the `scripts` folder and run the desired installation script:
    ```bash
    cd scripts
    bash install_lxc.sh
    ```

4. **Verify Installation**:
    Check that the installation has completed successfully by running the verification command:
    ```bash
    bash verify_installation.sh
    ```
