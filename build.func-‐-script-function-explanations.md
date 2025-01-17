
# Script Function Explanations

## 1. `variables()`
**Purpose**: This function sets up various global variables that will be used throughout the script.

### Details:
- `NSAPP`: Converts the string value in the `APP` variable to lowercase and removes any spaces.
- `var_install`: Appends `-install` to the `NSAPP` value, representing the installation script name.
- `INTEGER`: A regular expression used to validate integer values (with or without decimals).
- `PVEHOST_NAME`: Sets the variable to the current hostname of the Proxmox server.

### Example:
```bash
APP="MyApp"
variables
echo $NSAPP        # Output: "myapp"
echo $var_install  # Output: "myapp-install"
```

---

## 2. `color()`
**Purpose**: Defines various color and formatting variables for terminal output.

### Details:
- Defines colors like yellow (`YW`), green (`GN`), and red (`RD`) using ANSI escape codes for text formatting.
- Also defines icons for different types of output, such as checkmarks (`CM`), error crosses (`CROSS`), and information (`INFO`).

### Example:
```bash
color
echo -e "${GN}Success${CL}"   # Output: Green colored "Success"
echo -e "${INFO}Info${CL}"     # Output: Info icon followed by text "Info"
```

---

## 3. `catch_errors()`
**Purpose**: Sets up error handling for the script.

### Details:
- `set -Eeuo pipefail`: Ensures the script exits immediately if a command fails, an undefined variable is accessed, or if any command in a pipeline fails.
- `trap`: Defines a trap to call `error_handler()` when an error occurs, passing the line number and command that failed.

### Example:
```bash
catch_errors
ls non_existent_file   # This will cause an error and call the error_handler
```

---

## 4. `error_handler()`
**Purpose**: Handles errors by displaying the error details.

### Details:
- If a spinner is running, it is stopped.
- The function prints the error details, including the line number and the command that caused the error.

### Example:
```bash
error_handler 42 "ls non_existent_file"
# Output: [ERROR] in line 42: exit code 2: while executing command "ls non_existent_file"
```

---

## 5. `spinner()`
**Purpose**: Displays a rotating spinner animation.

### Details:
- The spinner uses a set of frames (`⠋`, `⠙`, `⠹`, etc.) to simulate a spinning animation in the terminal.
- The spinner runs until the process it is indicating is completed.

### Example:
```bash
spinner  # Call this function to start the spinner
```

---

## 6. `msg_info()`, `msg_ok()`, `msg_error()`
**Purpose**: Functions for displaying different types of messages.

### Details:
- `msg_info()`: Displays an informational message with a spinner animation.
- `msg_ok()`: Displays a success message.
- `msg_error()`: Displays an error message.

### Example:
```bash
msg_info "This is an informational message"
msg_ok "Success!"
msg_error "An error occurred"
```

---

## 7. `shell_check()`
**Purpose**: Verifies if the script is running in the Bash shell.

### Details:
- If the script is not running in Bash, it exits with a message indicating that Bash is required.

### Example:
```bash
shell_check  # Exits if the shell is not Bash
```

---

## 8. `root_check()`
**Purpose**: Ensures the script is being run as root.

### Details:
- If the script is not run as root, it exits with a message asking the user to run the script as root.

### Example:
```bash
root_check  # Exits if not run as root
```

---

## 9. `pve_check()`
**Purpose**: Verifies the Proxmox Virtual Environment (PVE) version.

### Details:
- Ensures the Proxmox version is in the range 8.1 to 8.3, exiting with an error if not.

### Example:
```bash
pve_check  # Exits if Proxmox version is not 8.1-8.3
```

---

## 10. `arch_check()`
**Purpose**: Verifies if the system architecture is `amd64`.

### Details:
- If the system architecture is not `amd64`, it exits with a message indicating that the script will not work on ARM architectures (e.g., PiMox).

### Example:
```bash
arch_check  # Exits if the architecture is not amd64
```

---

## 11. `get_current_ip()`
**Purpose**: Retrieves the current IP address based on the operating system.

### Details:
- For Debian/Ubuntu systems, it uses `hostname -I`.
- For Alpine systems, it uses `ip addr show`.

### Example:
```bash
get_current_ip  # Outputs the system's current IP address
```

---

## 12. `update_motd_ip()`
**Purpose**: Updates the `/etc/motd` file with the current IP address.

### Details:
- Removes any existing IP address entries from the file and adds the new IP address.

### Example:
```bash
update_motd_ip  # Updates the IP address in /etc/motd
```

---

## 13. `header_info()`
**Purpose**: Displays an ASCII art header with the application name.

### Details:
- If `figlet` is not installed, it will install it, download the slant font, and generate the ASCII header.

### Example:
```bash
header_info  # Displays the ASCII header with the app name
```

---

## 14. `ssh_check()`
**Purpose**: Detects if the script is running over SSH.

### Details:
- Prompts the user for confirmation to proceed if SSH is detected, as SSH might cause complications with certain commands.

### Example:
```bash
ssh_check  # Exits if SSH is used, or prompts to proceed
```

---

## 15. `base_settings()`
**Purpose**: Sets up default values for container configuration.

### Details:
- Sets default values for container type, disk size, CPU count, RAM, and other settings.
- Can be overridden with user inputs.

### Example:
```bash
base_settings  # Sets up default settings for the container
```

---

## 16. `echo_default()`
**Purpose**: Outputs the default values for the container configuration.

### Details:
- Displays the configured settings with corresponding icons.

### Example:
```bash
echo_default  # Displays the default configuration values
```

---

## 17. `exit_script()`
**Purpose**: Exits the script with a message.

### Details:
- Clears the screen and prints a message indicating that the script has exited.

### Example:
```bash
exit_script  # Exits the script
```

---

## 18. `advanced_settings()`
**Purpose**: Allows the user to configure advanced settings for the container.

### Details:
- Provides an interactive interface using `whiptail` to set advanced options, such as operating system, version, disk size, network configuration, and more.

### Example:
```bash
advanced_settings  # Displays an interactive configuration menu
```

---

## 19. `install_script()`
**Purpose**: Installs the container according to the selected settings.

### Details:
- Checks system requirements and starts the installation process.

### Example:
```bash
install_script  # Starts the container installation process
```

---

## 20. `check_container_resources()`
**Purpose**: Verifies the system has sufficient resources for the container.

### Details:
- Ensures that the system has enough RAM and CPU cores for the container.

### Example:
```bash
check_container_resources  # Verifies if enough resources are available
```

---

## 21. `check_container_storage()`
**Purpose**: Verifies if the `/boot` partition has sufficient space.

### Details:
- Warns the user if storage is more than 80% full.

### Example:
```bash
check_container_storage  # Warns if /boot partition is over 80% full
```

---

## 22. `start()`
**Purpose**: Initializes the installation or update process based on user choice.

### Details:
- Prompts the user to confirm before proceeding with container creation or updates.

### Example:
```bash
start  # Starts the container creation or update process
```

---

## 23. `build_container()`
**Purpose**: Builds the container using the defined settings.

### Details:
- Collects user inputs, configures the container, and creates it using `pct` commands.

### Example:
```bash
build_container  # Builds the container with the selected settings
```

---

## 24. `description()`
**Purpose**: Sets the description for the created container.

### Details:
- Generates an HTML description for the container and adds it to the container configuration.

### Example:
```bash
description  # Sets the container description
```
