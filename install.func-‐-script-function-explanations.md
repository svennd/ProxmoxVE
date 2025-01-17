
# Debian/Ubuntu Container Setup Script Function Explanations

## 1. `color()`
**Purpose**: Sets up various color and formatting variables for terminal output.

### Details:
- Defines colors like yellow (`YW`), green (`GN`), and red (`RD`) using ANSI escape codes for text formatting.
- Also defines icons for different types of output, such as checkmarks (`CM`), error crosses (`CROSS`), and network-related icons (`NETWORK`, `GATEWAY`).

### Example:
```bash
color
echo -e "${GN}Success${CL}"   # Output: Green colored "Success"
echo -e "${NETWORK}Network${CL}"  # Network icon followed by text "Network"
```

---

## 2. `verb_ip6()`
**Purpose**: Enables or disables IPv6 based on the `DISABLEIPV6` variable and sets the verbose mode.

### Details:
- Disables IPv6 by adding a line to `/etc/sysctl.conf` if `DISABLEIPV6` is set to `yes`.
- Optionally suppresses output based on the `VERBOSE` variable.

### Example:
```bash
DISABLEIPV6="yes"
verb_ip6  # Disables IPv6 if the variable is set
```

---

## 3. `catch_errors()`
**Purpose**: Sets up error handling for the script.

### Details:
- Configures the script to exit immediately on errors using `set -Eeuo pipefail`.
- Defines a trap that calls `error_handler()` when an error occurs.

### Example:
```bash
catch_errors
ls non_existent_file  # This will trigger the error handler
```

---

## 4. `error_handler()`
**Purpose**: Handles errors that occur during script execution.

### Details:
- Stops the spinner if it's running.
- Prints the error message with details like the exit code, line number, and the command that failed.

### Example:
```bash
error_handler 42 "ls non_existent_file"
# Output: [ERROR] in line 42: exit code 2: while executing command "ls non_existent_file"
```

---

## 5. `spinner()`
**Purpose**: Displays a rotating spinner animation.

### Details:
- Uses a set of frames to create a spinning effect in the terminal.

### Example:
```bash
spinner  # Starts the spinner animation
```

---

## 6. `msg_info()`, `msg_ok()`, `msg_error()`
**Purpose**: Displays messages with different statuses.

### Details:
- `msg_info()`: Displays an informational message with a spinner animation.
- `msg_ok()`: Displays a success message and stops the spinner.
- `msg_error()`: Displays an error message and stops the spinner.

### Example:
```bash
msg_info "This is an informational message"
msg_ok "Success!"
msg_error "An error occurred"
```

---

## 7. `setting_up_container()`
**Purpose**: Sets up the container OS, configures locale, timezone, and network.

### Details:
- Modifies `/etc/locale.gen` to enable the correct locale.
- Configures timezone and network, retrying network configuration if necessary.

### Example:
```bash
setting_up_container  # Configures OS, locale, timezone, and network
```

---

## 8. `network_check()`
**Purpose**: Verifies internet connectivity via IPv4 and IPv6.

### Details:
- Checks IPv4 connectivity to Google, Cloudflare, and Quad9 DNS servers.
- Checks IPv6 connectivity and performs DNS lookup for `github.com`.

### Example:
```bash
network_check  # Verifies internet connectivity
```

---

## 9. `update_os()`
**Purpose**: Updates the container's OS using `apt-get update` and `apt-get dist-upgrade`.

### Details:
- If `CACHER` is enabled, it configures a proxy for package fetching.
- Runs system update and upgrades all installed packages.

### Example:
```bash
update_os  # Updates the container's OS
```

---

## 10. `motd_ssh()`
**Purpose**: Modifies the message of the day (MOTD) and SSH settings.

### Details:
- Sets terminal to 256-color mode and updates `/etc/motd` with system information.
- Configures SSH settings to allow root login if enabled.

### Example:
```bash
motd_ssh  # Modifies MOTD and SSH settings
```

---

## 11. `customize()`
**Purpose**: Customizes the container by enabling auto-login and setting up SSH keys.

### Details:
- If no password is provided, it enables auto-login for the root user.
- Optionally configures SSH by adding the provided public key to the root user.

### Example:
```bash
customize  # Customizes the container with auto-login and SSH key setup
```

