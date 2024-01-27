# Clipboard Tool for Windows

This Clipboard Tool is a command-line utility for Windows that allows users to manage and copy predefined text snippets to their clipboard with ease. It's designed for users who frequently need to paste specific pieces of text and seek to streamline their workflow.

## Features

- **Copy Predefined Text**: Easily copy predefined text snippets to your clipboard.
- **Add Custom Text Snippets**: Dynamically add new text snippets from the command line.
- **List Available Commands**: View a list of all predefined text commands.
- **Delete Text Snippets**: Remove existing text snippets.

## Getting Started

### Prerequisites

- A Windows system
- Basic knowledge of command-line operations

### Installation

1. **Clone the Repository**:

   - Clone this repository to your local machine using:
     ```bat
     git clone https://github.com/PDRX91/clipboard_tool.git
     ```

2. **Navigate to the Repository Directory**:

   - Change directory to the cloned repository:
     ```bat
     cd path\to\clipboard_tool
     ```

3. **Configuration File Setup**:

   - Ensure `copy_content.txt` is present in the directory. If not, create it:
     ```bat
     echo.> copy_content.txt
     ```

4. **Add to PATH**:

   - Add the script to your PATH for easy access.
   - Search for "Environment Variables" in the Start menu.
   - Click on "Edit the system environment variables".
   - In the System Properties window, under the "Advanced" tab, click on "Environment Variables".
   - Under "User variables", find and select the PATH variable, then click "Edit".
   - Click "New" and add the path to the `clipboard_tool` directory.
   - Click "OK" to close each window.

### Usage

- **Adding a New Text Snippet**:

  ```bat
  copy.bat add <trigger> <text>
  ```

  Example: `copy.bat add greet Hello, world!`

- **Copying Text to Clipboard**:

  ```bat
  copy.bat <trigger>
  ```

  Example: `copy.bat greet`

- **Listing All Commands**:

  ```bat
  copy.bat --list
  ```

- **Deleting a Text Snippet**:
  ```bat
  copy.bat delete <trigger>
  ```
  Example: `copy.bat delete greet`

## Contributing

Feel free to fork this repository and submit pull requests. You can also open an issue for bugs, features, or general questions.
