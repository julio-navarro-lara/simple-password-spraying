# Simple Password Spraying
A PowerShell script to execute Password Spraying as simply as possible. Just provide a password to try and a list of users in the AD as a list in the file "users.txt", located in the same folder. If the domain name is printed next to the username, the password works for this account.

## Why this script?
Scripts for Password Spraying are often ridiculously complex. The simplicity of this script allows to quickly execute it even in environments without copy-and-paste, where we have to type every single line. Very useful for Red Team exercises.

## Generating the users.txt file
If we want to generate the file users.txt from the information directly provided by the AD, we can proceed as follows:

1. Obtention of usernames from the AD:
    ```
    Get-NetUser | select samaccountname > users1.txt
    ```
2. Removing the header:
    ```
    type users1.txt | Select-String -Pattern 'samaccountname' -NotMatch | Select-String -Pattern '--------------' -NotMatch > users2.txt
    ```
3. Removing whitespaces:
    ```
    (gc users2.txt) | ? {$_.trim() -ne ""} > users3.txt
    (gc users3.txt) | % {$_.trim()} > users.txt 
    ```
