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

| Command   | Purpose                                  | Example                          |
| --------- | ----------------------------------------- | --------------------------------- |
| `ls`      | List directory contents                  | `ls -la`                         |
| `cd`      | Change directories                       | `cd Documents`                   |
| `cp`      | Copy files and folders                   | `cp file.txt backup.txt`         |
| `mv`      | Move or rename files and folders         | `mv old.txt new.txt`             |
| `rm`      | Remove files or directories              | `rm -r old_folder`               |
| `mkdir`   | Create a new directory                   | `mkdir new_folder`               |
| `rmdir`   | Remove an empty directory                | `rmdir empty_folder`             |
| `man`     | View manual (help) for commands          | `man ls`                         |
| `echo`    | Output text or variables                 | `echo "Hello, World!"`           |
| `cat`     | Display file content                     | `cat file.txt`                   |
| `nano`    | Simple terminal-based text editor        | `nano file.txt`                  |
| `wc`      | Count words, lines, characters in a file | `wc -l file.txt`                 |
| `history` | Show previous commands                   | `history`                        |
| `bc`      | Launch calculator in CLI                 | `bc`                             |
| `chmod`   | Change file permissions                  | `chmod 755 script.sh`            |
| `chown`   | Change file owner                        | `chown user:group file.txt`      |

---

## 1. 📂 Navigating Directories

Unlike a graphical file explorer where you click through folders visually, in the command line you move around by **typing commands**. There is no mouse, everything happens by telling the terminal exactly where you want to go or what you want to see. This can feel unfamiliar at first, so let's break it down.

Think of the file system as a tree of folders (called **directories** in Linux), starting from a single root folder (`/`) and branching out into subfolders. At any moment, your terminal is "standing" inside one specific directory, this is called your **current working directory**. Every command you run (like listing files or creating a folder) happens relative to that location, so it's important to always know where you are.

### `pwd` — "Print Working Directory"

This is usually the first command beginners should try. It simply prints the full path of the folder you are currently in, so you always know your location.

```bash
pwd           # Show current directory, e.g. /home/student
```

### `ls` — "List" the contents of a directory

This shows you the files and folders inside your current directory, similar to opening a folder in a file explorer and seeing what's inside.

```bash
ls            # List files/folders in the current directory
ls -l         # Long listing: shows permissions, owner, size, and last modified date
ls -a         # Include hidden files (files/folders starting with a dot ".")
ls -lh        # Long listing with human-readable sizes (e.g. 4.0K, 1.2M instead of raw bytes)
```

💡 Tip: You can combine flags, e.g. `ls -la` shows a long listing **and** includes hidden files at the same time.

### `cd` — "Change Directory"

This is how you move between folders. Think of it as double-clicking a folder to open it (`cd foldername`) or clicking the "back" button to go up a level (`cd ..`).

```bash
cd ~          # Go to your home directory (your personal starting point)
cd Documents  # Enter the Documents folder (must exist inside your current directory)
cd ..         # Move up one directory (go to the parent folder)
cd /          # Go to the root of the filesystem (the very top of the tree)
```

⚠️ Common beginner mistakes:

- `cd` alone (no folder name) always takes you back to your home directory 
- Folder and file names in Linux are **case-sensitive**: `Documents` and `documents` are different.
- If a folder name has spaces, wrap it in quotes: `cd "My Folder"`.
- Typing `cd` into a folder that doesn't exist gives you an error like `No such file or directory`, this just means you mistyped the name or you're not where you think you are. Run `pwd` and `ls` to check.

A good habit as a beginner is to run `pwd` and `ls` often, so you build a mental map of where you are before running any other command.

---

## 2. 🧱 Creating and Removing Directories

`mkdir` creates new folders, just like right-click → "New Folder" in a file explorer.

```bash
mkdir folder1            # Create a folder named folder1
mkdir one two three      # Create multiple folders at once
```

To delete folders, `rmdir` only works on **empty** folders, while `rm -r` removes a folder and everything inside it (use with care!):

```bash
rmdir folder1            # Remove an empty folder
rm -r folder1            # Remove a folder and its contents
```

---

## 3. 📄 Creating and Editing Files

There's no "New File" button on the command line, you create files with a command instead. `echo ... >` writes text into a new file, `touch` creates an empty file, and `nano` opens a simple text editor to type content directly.

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

Instead of double-clicking to open a file, use these commands to read it right in the terminal. `cat` dumps the whole file, `head`/`tail` show just the start or end, and `less` lets you scroll through long files.

```bash
cat file1.txt              # Show entire file
head -n 5 file1.txt        # First 5 lines
tail -n 3 file1.txt        # Last 3 lines
less file1.txt             # Scrollable viewer (press 'q' to quit)
```

---

## 5. 🔁 Copying, Moving, and Renaming

These work like copy/paste and cut/paste in a file explorer. `cp` duplicates a file or folder, while `mv` both moves files between folders **and** renames them (Linux treats renaming as "moving to a new name").

```bash
cp file1.txt copy.txt                 # Copy a file
cp -r folder1 backup/                # Copy a directory
mv file1.txt renamed.txt             # Rename a file
mv file1.txt folder2/                # Move a file to another folder
```

---

## 6. 🗑️ Deleting Files

Be careful with these! Deleted files do not go to the Trash, they are gone immediately and permanently. When unsure, use `rm -i` so the terminal asks for confirmation before each delete.

```bash
rm file1.txt                 # Delete a file
rm -r folder1                # Delete a folder and contents
rm -i file1.txt              # Prompt before deleting
```

---

## 7. 🎴 Wildcards

Wildcards let you refer to many files at once instead of typing each name out. Think of `*` as "anything" and `?` as "any one character":

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

Speed up your typing (and avoid typos!) by pressing `Tab` to auto-complete file or folder names. If there's more than one match, pressing `Tab` twice lists the options.

```bash
cd o<Tab>     # Auto-completes to: one
cd t<Tab>     # Shows: two  three
```

---

## 9. ⛲ Pipes and Redirection

Normally a command's output just prints to your screen. Pipes and redirection let you send that output somewhere else instead:

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

`bc` opens a simple calculator right in the terminal, handy for quick math without opening another app.

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

Forgot how a command works? You don't need to search online, most commands document themselves: `--help` gives a quick summary, `man` opens the full manual, and `whatis` gives a one-line description.

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

Files that begin with a dot `.` are hidden by default (often used for config files), and `ls` skips them unless you ask to see everything.

```bash
ls -a                       # Show all files
echo "top secret" > .secret # Create a hidden file
```

---

## 13. 🔁 Command History

The terminal remembers every command you've typed, so you don't have to retype long commands. `history` lists them with numbers, and `!<number>` re-runs one instantly.

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

`grep` searches inside files for lines matching a word or pattern, much faster than opening each file and using Ctrl+F.

```bash
grep "Linux" hello.txt                 # Case-sensitive match
grep -i "linux" hello.txt              # Case-insensitive match
grep -n "Linux" hello.txt              # Show line numbers
grep -R "TODO" .                       # Recursive search in current directory
```

---

## 16. 🧰 Working with Archives

`tar` bundles a folder into a single compressed file (like a .zip) for easy sharing or backup, and can also extract them back.

```bash
tar -czf backup.tar.gz project/         # Create compressed archive
tar -xzf backup.tar.gz                  # Extract archive in current directory
tar -tzf backup.tar.gz                  # List archive contents
```

---

## 17. 📊 Sorting, Uniqueness, and Counting

These commands help you clean up and summarize text output: `sort` orders lines, `uniq` removes duplicate neighbors, and `wc` counts lines/words.

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

This is one of the most important Linux concepts to understand, permissions control **who can read, write, or run a file**, and getting them wrong can either lock you out of your own files or accidentally expose them to others.

Every file and folder in Linux has:

- An **owner** — the user who created it (usually you)
- A **group** — a set of users who can share access
- A set of **permissions** — what the owner, group, and everyone else are allowed to do with it

Use `ls -l` to see all of this at once:

```bash
-rw-r--r-- 1 alice users  0 Aug 7 10:00 example.txt
```

### Breaking down the permission string

The first 10 characters (`-rw-r--r--`) look confusing at first, but they follow a simple pattern. Read them as **1 type character + 3 groups of 3**:

```text
-   rw-   r--   r--
↑    ↑     ↑     ↑
type owner group others
```

- **Type** (`-`): `-` means a regular file, `d` means a directory.
- **Owner permissions** (`rw-`): what `alice` (the owner) can do.
- **Group permissions** (`r--`): what members of the `users` group can do.
- **Others permissions** (`r--`): what everyone else on the system can do.

Each group of 3 characters follows the same order every time: **r → w → x**

| Letter | Meaning | On a file                  | On a directory                        |
| ------ | ------- | --------------------------- | -------------------------------------- |
| `r`    | Read    | View the file's contents    | List the folder's contents (`ls`)      |
| `w`    | Write   | Modify or delete the file   | Add/remove files inside the folder     |
| `x`    | Execute | Run the file as a program   | Enter the folder (`cd`)                |
| `-`    | (none)  | Permission not granted      | Permission not granted                 |

So `-rw-r--r--` means: the owner can read and write, while the group and everyone else can only read.

The rest of the `ls -l` output tells you more:

* `1` → Number of links
* `alice` → Owner
* `users` → Group
* `0` → Size in bytes

### 🧑 Change Permissions with `chmod`

`chmod` ("change mode") lets you grant or remove `r`, `w`, `x` permissions. There are two common ways to write it:

**1. Numeric (octal) mode** — each permission has a value: `r=4`, `w=2`, `x=1`. Add them up for each of owner/group/others:

```bash
chmod 755 script.sh   # Owner: 7=rwx, Group: 5=r-x, Others: 5=r-x
chmod 644 notes.txt   # Owner: 6=rw-, Group: 4=r--, Others: 4=r--
```

💡 Quick reference: `7` = read+write+execute, `6` = read+write, `5` = read+execute, `4` = read only, `0` = nothing.

**2. Symbolic mode** — use `u` (user/owner), `g` (group), `o` (others), `a` (all), with `+`, `-`, or `=`:

```bash
chmod +x myscript.sh   # Add execute permission for everyone
chmod u+x myscript.sh  # Add execute permission for the owner only
chmod g-w report.txt   # Remove write permission from the group
```

⚠️ Common beginner mistake: getting a `Permission denied` error when running a script usually means it's missing the execute (`x`) permission, run `chmod +x filename` to fix it.

### 👑 Change Ownership with `chown`

`chown` ("change owner") lets you assign a new owner and/or group to a file. This usually requires `sudo` because you're changing something that affects other users.

```bash
sudo chown bob:bob file.txt
```

This sets both the owner and the group to `bob`.

You can also change just one part:

```bash
sudo chown :devs report.txt         # Only change the group (note the leading colon)
sudo chown alice:admins report.txt  # Change both owner and group at once
```

To confirm the change worked, check with `ls -l` again:

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
* View file content with `cat`, `head`, `tail`, and `less`
* Use redirection, wildcards, and pipes
* Speed up typing with tab completion
* Use command history and help tools
* Use `nano` for editing text files
* Work with hidden files and the `bc` calculator
* Understand permissions and change file ownership
* Explore the Linux file system hierarchy
* Search and filter text efficiently with `grep`
* Create and extract archives with `tar`
* Sort, deduplicate, and count output data

Practice daily to become confident using the Linux terminal! 🚀
