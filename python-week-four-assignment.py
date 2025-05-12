def read_and_modify_file():
    filename = input("Enter the name of the file to read: ")

    try:
        with open(filename, 'r') as file:
            lines = file.readlines()

        # Modify the lines (example: convert to uppercase)
        modified_lines = [line.upper() for line in lines]

        # New file name
        new_filename = "modified_" + filename

        with open(new_filename, 'w') as new_file:
            new_file.writelines(modified_lines)

        print(f"Modified content written to '{new_filename}'.")

    except FileNotFoundError:
        print(f"Error: The file '{filename}' does not exist.")
    except PermissionError:
        print(f"Error: You don't have permission to read the file '{filename}'.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

# Run the function
read_and_modify_file()