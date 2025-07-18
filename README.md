# Git Project User Info Checker (Bash)

This simple Bash script helps you check the Git user name and email configured locally for projects in a specified base directory.

## Features

- Lists all subdirectories (projects) inside a given base directory
- Lets you interactively select a project
- Checks if the selected project is a Git repository
- Displays the Git `user.name` and `user.email` configured in that project
- Allows you to repeat the check for other projects without restarting the script

---

## Usage

1. Make sure you have Bash and Git installed on your system (Linux/macOS).

2. Save the script as `check-git-user.sh`.

3. Make it executable:

    ```bash
   chmod +x check-git-user.sh

4. Run the script with an optional base directory argument.
If no argument is provided, it defaults to `~/Projects`.
    ```bash
    ./check-git-user.sh /path/to/your/projects

> `example: ./check-git-user.sh /home/john/projects`
  
5. The script will:

    List the subdirectories inside the base directory as possible projects
    
    Prompt you to select a project (or enter `0` to exit)
    
    Show the Git user name and email for the selected project (if it’s a Git repo)
    
    Ask if you want to check another project
   
# Example
$ ./check-git-user.sh ~/Projects

Select a project (or type 0 to exit):
1) projectA
2) projectB
3) projectC

Which?: 2

You selected: projectB

Git user for project 'projectB':

Name:  John Doe

Email: JohnDoe@example.com

Do you want to check another project? (y/n): y

Select a project (or type 0 to exit):
...
