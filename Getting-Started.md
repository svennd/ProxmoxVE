# Getting Started with Community Scripts

This guide will help you set up your local environment to use and contribute to the community-scripts project.

## Prerequisites:
Before getting started, make sure you have the following tools installed:
- **Git**: For cloning the repository and managing branches.
- **Bash**: Most scripts in this repository are written in Bash.
- **curl**: Required for some installation and update scripts.
- **Proxmox VE**: These scripts are intended for use in Proxmox environments.

## Setting Up the Repository:
1. Clone the repository to your local machine:
    ```bash
    git clone https://github.com/community-scripts/ProxmoxVE.git
    cd ProxmoxVE
    ```

2. Install any required dependencies (for local development):
    ```bash
    bash install_dependencies.sh
    ```

3. Review the structure of the repository. Pay particular attention to the following directories:
    - **/scripts**: Contains the main automation scripts.
    - **/docs**: Documentation for setup, contribution, and usage.
    - **/templates**: Template scripts for creating new scripts.

## Running a Sample Script:
To run a sample script, navigate to the `scripts` directory and execute one of the available installation scripts:
```bash
cd scripts
bash install_example_script.sh
