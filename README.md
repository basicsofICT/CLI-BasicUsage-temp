# 🐧 Linux CLI Practical Task (15 Points)

- First study [Command Line Basics](01-command-line-basics.md) properly. I recommend completing all the tasks from the learning materials in the same environment to become familiar with the command line before attempting the practical exercises below.

- Follow each section in order. (This is not strictly required, but some tasks are required to be done in sequence.)

- You can check your score yourself. You will earn 13 points from the tasks, plus 2 points if your changes are committed and pushed to your repository.

- Remember to frequently commit and push the changes [15. 🚀 Commit and push](#15--commit-and-push)
---

***Do not edit or modify check.sh file.***

## 1. Create the project folders

```bash
mkdir -p project/src project/docs
```

---

## 2. Create an executable shell script `hello.sh` in `project/src`
```bash
cat > project/src/hello.sh <<'SH'
#!/usr/bin/env bash
echo "Hello CLI"
SH
chmod +x project/src/hello.sh
```

---

## 3. Create readme.txt inside project/src (Use Nano text editor)

```bash
Type any three (or more) lines in the file, e.g.:

Line 1
Line 2
Line 3
```
---

## 4. Copy `readme.txt` to `project/docs`

```bash
cp project/src/readme.txt project/docs/
```
---

## 5. Build report.txt

In the `project/docs` folder, create a file named `report.txt` that contains exactly 11 lines: the first 10 lines must be real file names that exist in `/usr/bin`, and the last line must read exactly `Task completed`.

> Hint: List the contents of `/usr/bin` and limit the output to only the first 10 entries.
>
> Example: `ls /etc | head -n 5` prints only the first 5 lines from a listing of `/etc`. Adapt this idea to the right folder and line count for this task.

> Hint: Redirect (`>`) that limited output into `project/docs/report.txt` to create the file.

> Hint: Append (`>>`, not `>`) the text `Task completed` as a new line at the end of the same file, so you don't overwrite what you already saved.

---

## 6. Back up the `src` folder to `src_backup`

> Hint: Do **not** create the `project/src_backup` folder yourself beforehand. Let the copy command create it for you as a mirror of `project/src`. If a destination folder already exists, a recursive copy will nest the source *inside* it instead of matching its contents directly.

> Hint: Use the recursive copy option so the entire folder tree (not just one file) gets copied.

> Example: `cp -r folderA folderB` when `folderB` does not already exist. This creates `folderB` as an exact copy of everything inside `folderA`.

---

## 7. Remove any `project/bin` folder if it exists

> Hint: Use the remove command with options that delete a folder and its contents recursively, and that won't error out if the folder doesn't exist.

> Example: `rm -rf some_folder` deletes `some_folder` and everything inside it without asking for confirmation.

---

## 8. Create a hidden file `.secret` in `project/` folder.

> Hint: In Linux, files and folders whose name starts with a dot (`.`) are hidden.

> Hint: Use the command that creates an empty file (or updates its timestamp if it already exists).

> Example: `touch .env` creates an empty hidden file named `.env` in the current folder.


---

## 9. Record permissions of `hello.sh` into `mode.txt`

> Hint: Use `stat` with a format option so it prints only the numeric permission mode, not the full file listing.

> Hint: Redirect (`>`) that output into `project/docs/mode.txt`.

> Example: `stat -c "%a" somefile.txt` prints just the numeric permissions (e.g. `644`) of `somefile.txt`.

---

## 10. Wildcards: create sample files and list matches to `wild.txt`

Create four empty sample files inside `project/src`: `a1.txt`, `a2.txt`, `ab.txt`, and `b1.log`.

> Hint: `touch` can create several files at once if you list multiple names after it.

Then, using a wildcard pattern, list only the files in `project/src` that start with `a` and end in `.txt` — this should match `a1.txt`, `a2.txt`, and `ab.txt`, but must **not** match `b1.log`. Redirect that list into `project/docs/wild.txt`.

> Hint: The `*` wildcard matches any sequence of characters, so `a*.txt` matches any name starting with `a` and ending in `.txt`.

> Hint: Redirect (`>`) the matched list into `project/docs/wild.txt`.

> Example: `ls *.log` lists every file in the current folder that ends in `.log`.

---

## 11. Download a text file and count exact “Linux” occurrences

Download this file: `https://raw.githubusercontent.com/dipaish/cimages/main/hello.txt`, and save it as `project/src/hello.txt`.

> Hint: `wget` can fetch a file from a URL. Use its output option to control both the file name and the folder it's saved to, so it ends up at `project/src/hello.txt` instead of the current folder.

> Example: `wget -O somefolder/newname.txt https://example.com/somefile.txt` downloads `somefile.txt` and saves it as `somefolder/newname.txt`.

Then count how many times the exact word "Linux" appears inside `project/src/hello.txt`, and save that number in `project/docs/linux_count.txt`.

> Hint: `grep -o` prints each match on its own line instead of the whole line it was found in, piping that into `wc -l` turns "how many matches" into "how many lines", which is your count.

> Hint: Redirect (`>`) the final count into `project/docs/linux_count.txt`.

> Example: `grep -o 'cat' file.txt | wc -l` counts how many times "cat" appears in `file.txt`.

---

## 12. Pipes: save the first 5 lines of the `/etc` long listing into project/docs/etc_head.txt

> Hint: Combine the long-listing command with `head` using a pipe (`|`) to keep only a limited number of lines.

> Example: `ls -l /usr | head -n 3` shows a long listing of just the first 3 entries in `/usr`. Adjust the folder and line count for this task.

---

## 13. Help output: capture the first line of `date --help`

> Hint: Pipe a command's `--help` output into `head` to keep only its first line.

> Example: `ls --help | head -n 1` prints just the first line of `ls`'s help text.

---

## 14. Run the check.sh script and know your score
```bash
# If you get a "Permission denied" error, make the script executable first:
chmod +x .github/classroom/check.sh

.github/classroom/check.sh > result.txt

# After you run the above command, check your score by typing:

cat result.txt 

```

Expected score lines in `result.txt`:

```text
Core Score: <value>/13
Commit/Push Score: <value>/2
Total Score: <value>/15
```

>> Note

- If you’re not satisfied with your score, you may correct any mistakes you’ve made. You can try as many times as you like. 
- After making corrections, **re-run Task 14** and check your score.
- **Always remember to commit and push the changes you have made by doing Task 15 before closing the GitHub Codespace on your fork. You need to do this frequently every time you work on the tasks.**
- The Commit/Push Score checks that everything inside `project/` is committed and that your local commits are pushed to your remote repository. Run Task 15 (commit and push) before re-running Task 14 to earn these 2 points.


## 15. 🚀 Commit and push
```bash
git add .
git commit -m "Complete 15 CLI tasks"
git push
```

---

## 16. Optional Tasks 

Complete the following extra tasks to deepen your CLI skills. These are recommended for extra practice.

You can repeatedly do these tasks as many times as you want and can also attempt optional extended tasks for additional learning.

The `check.sh` script also reports these extended checks with a ✅/❌ for each task, but they are **pass/fail only and do not add any points** to your score.

### 16.1 Search recursively for shell scripts
```bash
find project -type f -name "*.sh" > project/docs/shell_files.txt
```

### 16.2 Sort and deduplicate output
```bash
cat project/docs/report.txt | sort | uniq > project/docs/report_unique.txt
```

`sort` arranges lines alphabetically so repeated lines sit next to each other, then `uniq` collapses those adjacent duplicates into a single copy, keeping only unique lines.

### 16.3 Count lines, words, and bytes in hello.txt
```bash
wc project/src/hello.txt > project/docs/hello_stats.txt
```

### 16.4 Extract only lines containing CLI from hello.txt
```bash
grep -i "CLI" project/src/hello.txt > project/docs/cli_lines.txt
```

### 16.5 Create and extract a tar archive
```bash
tar -czf project_backup.tar.gz project
mkdir -p project_restore
tar -xzf project_backup.tar.gz -C project_restore
```

### 16.6 Submission checklist for extended practice

Before running Task 14 again, quickly verify extended outputs:

```bash
ls -l project/docs/shell_files.txt
ls -l project/docs/report_unique.txt
ls -l project/docs/hello_stats.txt
ls -l project/docs/cli_lines.txt
ls -l project_backup.tar.gz
ls -ld project_restore/project
```
