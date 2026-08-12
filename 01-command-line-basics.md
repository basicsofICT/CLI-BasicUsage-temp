# 🐧 Learn Command Line Basics

This guide introduces you to essential Linux commands in an Ubuntu environment using **GitHub Codespaces**. You will learn the basics of Linux Command Line Interface (CLI) in Ubuntu directly from your **GitHub Codespaces terminal** or a local Ubuntu machine.

***You’ll learn how to:***

- Navigate the file system

- Create, rename, delete files and folders

- Use redirection, pipes, wildcards

- Work with command history and help

- Use the nano text editor

- Understand file permissions and ownership

- Understand Linux file system hierarchy

---


## 📚 Additional Materials to Learn

### 🎥 Video Tutorials
- [Linux Command Line for Beginners](https://www.youtube.com/watch?v=xc5sj1yeaMA)  
  *Basic Linux commands explained clearly.*
- [Linux File Systems](https://www.youtube.com/watch?v=0Dx953jDAUM)  
  *Understanding how files are stored and structured in Linux.*
- [File Permissions in Linux](https://www.youtube.com/watch?v=otIz0AO_BYI)  
  *Detailed guide on Linux file permissions and how to manage them.*

---

### 📖 Official Documentation and Guides
- [Ubuntu Linux Documentation](https://help.ubuntu.com/)  
  *Official manuals and tutorials from Ubuntu.*

- [Ubuntu Server Guide](https://documentation.ubuntu.com/server/)  
  *Official Ubuntu Server documentation, including storage, networking, users, and system administration.*

- [Ubuntu Community Help Wiki](https://help.ubuntu.com/community)  
  *Community-maintained Ubuntu how-to guides for common CLI and system tasks.*

- [Ubuntu Manpage Repository](https://manpages.ubuntu.com/)  
  *Search Ubuntu manual pages online when you are not in a terminal.*

- [Ubuntu Package Search](https://packages.ubuntu.com/)  
  *Find which package provides a command and check package versions across Ubuntu releases.*

- [APT User Guide (Ubuntu)](https://help.ubuntu.com/community/AptGet/Howto)  
  *Practical package management guide for installing, updating, and removing software from CLI.*

- [Linux Command Library](https://linuxcommandlibrary.com/)  
  *Search and browse hundreds of commands with examples.*

- [TLDR Pages](https://tldr.sh/)  
  *Simplified and community-maintained command cheat sheets.*

- [Linux Handbook](https://linuxhandbook.com/)  
  *Step-by-step tutorials, tips, and news for Linux learners.*

- [GNU Coreutils Manual](https://www.gnu.org/software/coreutils/manual/coreutils.html)
  *Official reference for commands like ls, cp, mv, rm, cat, sort, and more.*

- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
  *Official Bash shell documentation for scripting and shell behavior.*

- [Explainshell](https://explainshell.com/)
  *Break down a Linux command and understand each option quickly.*

Quick Ubuntu doc workflow:

1. Use `man <command>` first in your terminal.
2. If you need Ubuntu-specific behavior, check the Ubuntu docs links above.
3. If a command is missing, use Ubuntu Package Search to find which package provides it.

### 🧭 Ubuntu 24.04 Quick Tips (Optional Tasks)

Use these commands often when working in Ubuntu 24.04:

```bash
lsb_release -a              # Confirm Ubuntu release details
cat /etc/os-release         # Show distro metadata
```

```bash
sudo apt update             # Refresh package index
sudo apt install <package>  # Install a package
apt list --installed | head # Preview installed packages
```

```bash
command -v <command>        # Check if a command exists
dpkg -S /usr/bin/ls         # Find which package owns a binary/file
apt-cache search <keyword>  # Search package names/descriptions
```

```bash
ip -br a                    # Quick network interface summary
ss -tuln                    # Show listening TCP/UDP ports
curl -I https://ubuntu.com  # Test outbound network access
```

```bash
df -h                       # Disk usage by filesystem
du -sh *                    # Folder sizes in current directory
```

Codespaces note:

- In containerized environments, `systemctl` may be unavailable. If so, run tools directly and inspect processes with `ps aux`.

### 🧪 Mini Exercise: Ubuntu 24.04 Troubleshooting

Complete these 5 tasks in your terminal:

1. Confirm your distro and release, then save output to `ubuntu_version.txt`.
2. Check whether `curl` and `wget` are installed, then save results to `command_check.txt`.
3. List listening ports and save the output to `listening_ports.txt`.
4. Save a summary of disk usage and current folder sizes to `storage_report.txt`.
5. Search for a package related to `net-tools` and save top 10 lines to `package_search.txt`.

Example solution pattern:

```bash
lsb_release -a > ubuntu_version.txt
command -v curl wget > command_check.txt
ss -tuln > listening_ports.txt
{ df -h; du -sh *; } > storage_report.txt
apt-cache search net-tools | head -n 10 > package_search.txt
```

---

### 💻 Free Online Linux Emulators

Try out Linux in your browser — no installation needed:

- [JSLinux](https://bellard.org/jslinux/)  
  *Run Linux or other OSes directly in the browser (by Fabrice Bellard).*

- [Copy.sh Linux Emulator](https://copy.sh/v86/)  
  *Boot a full Linux system in your browser — fast and lightweight.*

- [Webminal](https://www.webminal.org/)  
  *Online Linux terminal for practice + tutorials and collaboration.*

- [OverTheWire: Bandit](https://overthewire.org/wargames/bandit/)  
  *A hands-on Linux game that teaches CLI through hacking-style challenges.*

---

## 📘 Basic Commands

| Command   | Purpose                                  |
| --------- | ---------------------------------------- |
| `ls`      | List directory contents                  |
| `cd`      | Change directories                       |
| `cp`      | Copy files and folders                   |
| `mv`      | Move or rename files and folders         |
| `rm`      | Remove files or directories              |
| `mkdir`   | Create a new directory                   |
| `rmdir`   | Remove an empty directory                |
| `man`     | View manual (help) for commands          |
| `echo`    | Output text or variables                 |
| `cat`     | Display file content                     |
| `nano`    | Simple terminal-based text editor        |
| `wc`      | Count words, lines, characters in a file |
| `history` | Show previous commands                   |
| `bc`      | Launch calculator in CLI                 |
| `chmod`   | Change file permissions                  |
| `chown`   | Change file owner                        |

---

## 1. 📂 Navigating Directories

Understanding where you are in the file system is essential to managing files and folders.

```bash
pwd           # Show current directory
ls            # List files/folders
ls -l         # Long listing (permissions, size, dates)
ls -a         # Include hidden files
ls -lh        # Human-readable file sizes
```

Use `cd` to change your current directory:

```bash
cd ~          # Go to your home directory
cd Documents  # Enter the Documents folder
cd ..         # Move up one directory
cd /          # Go to the root of the filesystem
```

---

## 2. 🧱 Creating and Removing Directories

Use `mkdir` to create folders:

```bash
mkdir folder1            # Create a folder named folder1
mkdir one two three      # Create multiple folders at once
```

To delete folders:

```bash
rmdir folder1            # Remove an empty folder
rm -r folder1            # Remove a folder and its contents
```

---

## 3. 📄 Creating and Editing Files

You can create and edit files using redirection or editors like nano:

```bash
echo "Hello world" > file1.txt    # Create file with content
touch empty.txt                  # Create an empty file
nano notes.txt                   # Open file in nano editor
```

In Nano:

* `Ctrl + O` saves the file
* `Ctrl + X` exits the editor

---

## 4. 📜 Viewing File Content

Display the contents of a file in the terminal:

```bash
cat file1.txt              # Show entire file
head -n 5 file1.txt        # First 5 lines
tail -n 3 file1.txt        # Last 3 lines
less file1.txt             # Scrollable viewer (press 'q' to quit)
```

---

## 5. 🔁 Copying, Moving, and Renaming

These commands help organize and manage your files:

```bash
cp file1.txt copy.txt                 # Copy a file
cp -r folder1 backup/                # Copy a directory
mv file1.txt renamed.txt             # Rename a file
mv file1.txt folder2/                # Move a file to another folder
```

---

## 6. 🗑️ Deleting Files

Be careful with these! Deleted files do not go to the Trash.

```bash
rm file1.txt                 # Delete a file
rm -r folder1                # Delete a folder and contents
rm -i file1.txt              # Prompt before deleting
```

---

## 7. 🎴 Wildcards

Use wildcards to match file patterns:

| Wildcard | Matches                  |
| -------- | ------------------------ |
| `*`      | Any number of characters |
| `?`      | A single character       |

Examples:

```bash
ls *.txt                   # All .txt files
ls file?.txt               # file1.txt, fileA.txt, etc.
rm junk*                  # Delete files starting with 'junk'
```

---

## 8. 🔠 Tab Completion

Speed up your typing by pressing `Tab` to auto-complete file or folder names.

```bash
cd o<Tab>     # Auto-completes to: one
cd t<Tab>     # Shows: two  three
```

---

## 9. ⛲ Pipes and Redirection

* `|` sends output from one command to another
* `>` writes output to a file (overwrite)
* `>>` appends output to a file

Examples:

```bash
ls -l | less                         # Paginate output
cat file.txt | wc -l                # Count lines
echo "Hello" > hello.txt            # Write to file
echo "Again" >> hello.txt           # Append to file
```

---

## 10. 🧮 Command-Line Calculator

Launch a calculator inside the terminal:

```bash
bc
```

Inside bc:

```text
34+45
12*3
quit
```

---

## 11. 📖 Getting Help

Most commands have built-in help:

```bash
command --help     # Quick summary
man command        # Detailed manual
whatis command     # One-line description
```

Examples:

```bash
man ls
cat --help
whatis sudo
```

---

## 12. 🕵️ Hidden Files

Files that begin with a dot `.` are hidden by default.

```bash
ls -a                       # Show all files
echo "top secret" > .secret # Create a hidden file
```

---

## 13. 🔁 Command History

Navigate your previous commands:

```bash
history               # List all past commands
!42                   # Run command number 42
```

Use the `↑` and `↓` arrows to scroll through your previous commands.

---


## 14. 🔧 Linux File System Hierarchy (FHS)

Linux uses a tree-like file system structure. Common directories include:

| Directory | Description                             |
| --------- | --------------------------------------- |
| `/`       | Root directory (everything starts here) |
| `/home`   | User home directories                   |
| `/etc`    | Configuration files                     |
| `/bin`    | Essential user binaries (commands)      |
| `/usr`    | Secondary system programs and libraries |
| `/var`    | Variable data like logs                 |
| `/tmp`    | Temporary files                         |

You can explore it using:

```bash
cd /
ls -l
```

---

## 15. 🔎 Searching and Filtering Text

Learn how to quickly locate text inside files:

```bash
grep "Linux" hello.txt                 # Case-sensitive match
grep -i "linux" hello.txt              # Case-insensitive match
grep -n "Linux" hello.txt              # Show line numbers
grep -R "TODO" .                       # Recursive search in current directory
```

---

## 16. 🧰 Working with Archives

Compress and extract folders with tar:

```bash
tar -czf backup.tar.gz project/         # Create compressed archive
tar -xzf backup.tar.gz                  # Extract archive in current directory
tar -tzf backup.tar.gz                  # List archive contents
```

---

## 17. 📊 Sorting, Uniqueness, and Counting

Process and summarize command output:

```bash
sort names.txt                          # Sort lines alphabetically
uniq names.txt                          # Remove consecutive duplicates
sort names.txt | uniq                   # Sort first, then remove duplicates
wc -l names.txt                         # Count lines
wc -w names.txt                         # Count words
```

---

## 18. 🧪 Practice Drills (Optional Tasks)

Try these mini-challenges in order:

1. Create a folder named practice with subfolders a, b, and c.
2. Create 5 text files in practice/a using touch.
3. Move 2 files from practice/a into practice/b.
4. Copy all .txt files from practice/b into practice/c.
5. Save a long listing of practice into practice/listing.txt.
6. Save only .txt file names from practice recursively into practice/txt_files.txt.
7. Count how many .txt files exist under practice and save the number to practice/count.txt.
8. Compress the practice folder into practice.tar.gz and then extract it into practice_restore.

Example command hints:

```bash
mkdir -p practice/{a,b,c}
touch practice/a/file{1..5}.txt
find practice -type f -name "*.txt"
find practice -type f -name "*.txt" | wc -l
tar -czf practice.tar.gz practice
tar -xzf practice.tar.gz -C practice_restore
```

---

## 19. 🔐 File Permissions and Ownership

Every file has an owner, a group, and permission settings:

Use `ls -l` to see them:

```bash
-rw-r--r-- 1 alice users  0 Aug 7 10:00 example.txt
```

Breakdown:

* `-rw-r--r--` → Permissions
* `1` → Number of links
* `alice` → Owner
* `users` → Group
* `0` → Size in bytes

### 🧑 Change Permissions

Use `chmod` to change permissions:

```bash
chmod 755 script.sh   # Owner can rwx, others can rx
chmod +x myscript.sh  # Add execute permission
```

### 👑 Change Ownership

Use `chown` to change owner:

```bash
sudo chown bob:bob file.txt
```

This sets the owner and group to `bob`.

You can combine both:

```bash
sudo chown :devs report.txt      # Only change group
sudo chown alice:admins report.txt  # Change both
```

To see the effect:

```bash
ls -l report.txt
```

---


## 20. 🧪 Practice Challenge

Try to complete these tasks using what you’ve learned: (No Submission required)

1. Create a directory `myFolder` and inside it, `src`, `bin`, and `docs`.
2. Create files like `main.py`, `readme.txt` in `src`.
3. Move `readme.txt` to `docs`.
4. Copy `src` to a new folder `src_backup`.
5. Delete the `bin` folder.
6. Write a short file using `nano` and count its lines with `wc -l`.

---


## ✅ Summary

You’ve now learned how to:

* Navigate and explore the Linux file system
* Create, move, rename, and delete files and folders
* Use redirection, wildcards, and pipes
* Use command history and help tools
* Use `nano` for editing text files
* Understand permissions and change file ownership
* Explore the Linux file system hierarchy
* Search and filter text efficiently with `grep`
* Create and extract archives with `tar`
* Sort, deduplicate, and count output data

Practice daily to become confident using the Linux terminal! 🚀
