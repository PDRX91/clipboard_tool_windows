@echo off
setlocal enabledelayedexpansion

set CONFIG_FILE=e:\Projects\utils\copy_content.txt

REM This batch script is used as a clipboard tool to manage and manipulate text snippets.

REM Check if the command-line argument is "--list"
if "%1" == "--list" (
  REM Display the contents of the CONFIG_FILE
  type "!CONFIG_FILE!"
  goto :eof
)

REM Check if the command-line argument is "add"
if "%1" == "add" (
  REM Store the trigger and text values from the command-line arguments
  set "trigger=%2"
  set "text=%~3"
  shift

  :loop
  shift
  REM Concatenate the remaining command-line arguments to the text value
  if "%~1" == "" goto endloop
  set "text=!text! %~1"
  goto loop

  :endloop
  REM Append the trigger and text to the CONFIG_FILE
  echo !trigger!-!text! >> "!CONFIG_FILE!"
  echo Added command: !trigger!
  goto :eof
)

REM Check if the command-line argument is "delete"
if "%1" == "delete" (
  REM Store the trigger value from the command-line argument
  set "trigger=%2"
  REM Remove the line with the specified trigger from the CONFIG_FILE
  findstr /v /b "!trigger! -" "!CONFIG_FILE!" > temp_file.txt
  move /Y temp_file.txt "!CONFIG_FILE!"
  echo Deleted command: !trigger!
  goto :eof
)

REM Iterate through each line in the CONFIG_FILE
for /f "tokens=1,* delims=-" %%a in ('type "!CONFIG_FILE!" ^| findstr /R /C:".*-.*"') do (
  set "trigger=%%a"
  set "text=%%b"
  echo Trigger: '!trigger!', Text: '!text!', Command: %1
  REM Extract the trigger and text from the current line
  REM The line format is "trigger - text"
  REM The "set" command is used to assign values to variables
  REM The "!" syntax is used for delayed variable expansion
  REM The "echo" command is used to display the extracted trigger and text
  REM The single quotes around the variables are for visual clarity
  REM Check if the trigger matches the command-line argument
  if /I "!trigger!" == "%~1" (
    REM Copy the text to the clipboard using PowerShell
    echo !text! | powershell -command "$input | Set-Clipboard"
    REM The "echo" command is used to pass the text to PowerShell
    REM The "|" symbol is used to pipe the output of the "echo" command to the "Set-Clipboard" command in PowerShell
    REM The "powershell -command" syntax is used to execute a PowerShell command from the batch script
    REM The "!text!" variable contains the text to be copied to the clipboard
    REM The "goto :eof" command is used to exit the loop and the batch script
    echo "!text!" copied to clipboard
    REM Display a message indicating that the text has been copied to the clipboard
    goto :eof
  )
)

REM Display an error message if the command is unknown
echo Unknown command: %1

