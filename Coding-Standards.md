We maintain a set of coding standards to ensure consistency and readability across the scripts in this repository.

## Key Guidelines:
1. **Indentation**: Use **2 spaces** for indentation (no tabs).
2. **Variable Naming**: Use **uppercase** for global variables and **snake_case** for local variables.
3. **Quoting Variables**: Always quote variables to prevent issues with spaces or special characters:
    ```bash
    echo "$MY_VARIABLE"
    ```
4. **Functions**: Define functions using the following format:
    ```bash
    my_function() {
        # function code
    }
    ```

5. **Error Handling**: Always include error handling:
    ```bash
    catch_errors
    ```

6. **Comments**: Use comments to explain the purpose of complex code:
    ```bash
    # This section installs the required dependencies
    ```

7. **No Hardcoding**: Avoid hardcoding values like usernames or paths. Use variables and configuration files instead.
