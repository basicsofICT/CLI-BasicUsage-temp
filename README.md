# 🐧 Linux CLI Practical Task (15 Points)

- Start by **forking this repository** to your own GitHub account.

- **GitHub Classroom is not required** for this assignment.

- Work **in a GitHub Codespace created from your fork**. This repo is pinned to **Ubuntu 24.04 (Noble)** so everyone uses the same environment.

- First study [Command Line Basics](01-command-line-basics.md) properly. I recommend completing all the tasks from the learning materials in the same environment to become familiar with the command line before attempting the practical exercises below.

- Follow each section in order. (This is not strictly required, but some tasks are easier if done in sequence.)

- You can check your score yourself. You will earn 13 points from the tasks, plus 2 points for running the score-checking script and pushing your changes to your repository.

- To make the workload heavier, complete the optional extended tasks at the end after Task 15.

- Remember to frequently commit and push the changes [15. 🚀 Commit and push](#15--commit-and-push)

---

***Do not edit or modify check.sh file.***

## Before You Begin

1. Fork this repository to your GitHub account.
2. Open your **forked repository** on GitHub.
3. Create a new Codespace from the fork.
4. Complete all tasks inside that Codespace.

Use only your fork for all work and submissions.

***Good luck 🚀***

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

In the project/docs folder, create a file named report.txt using redirection.

> Hint: Use the `ls -1 /usr/bin | head -n 10` command to get the first 10 file names from `/usr/bin`.

> Hint: Use `echo "Task completed"` with `>>` to append text.

```bash
ls -1 /usr/bin | head -n 10 > project/docs/report.txt

echo "Task completed" >> project/docs/report.txt

```

---

## 6. Back up the `src` folder to `src_backup`
```bash
mkdir -p project/src_backup
cp -r project/src project/src_backup/
```

---

## 7. Remove any `project/bin` folder if it exists

```bash
rm -rf project/bin
```

---

## 8. Create a hidden file `.secret` in `project/` folder.

```bash
touch project/.secret
```


---

## 9. Record permissions of `hello.sh` into `mode.txt`
```bash
stat -c "%a" project/src/hello.sh > project/docs/mode.txt
```

---

## 10. Wildcards: create sample files and list matches to `wild.txt`
```bash
touch project/src/a1.txt project/src/a2.txt project/src/b1.log project/src/ab.txt
ls project/src/a*.txt > project/docs/wild.txt
```

---

## 11. Download a text file and count exact “Linux” occurrences
```bash
wget -q -O project/src/hello.txt https://raw.githubusercontent.com/dipaish/cimages/main/hello.txt
grep -o 'Linux' project/src/hello.txt | wc -l > project/docs/linux_count.txt
```

---

## 12. Pipes: save the first 5 lines of the `/etc` long listing into project/docs/etc_head.txt
```bash
ls -l /etc | head -n 5 > project/docs/etc_head.txt
```

---

## 13. Help output: capture the first line of `date --help`
```bash
date --help | head -n 1 > project/docs/date_help.txt
```

---

## 14. Run the check.sh script and know your score
```bash
.github/classroom/check.sh > result.txt

# After you run the above command, check your score by typing:

cat result.txt 

```

Expected score lines in `result.txt`:

```text
Core Score: <value>/13
Extended Score: <value>/5
Total Score: <value>/18
```

>> Note

- If you’re not satisfied with your score, you may correct any mistakes you’ve made. You can try as many times as you like before the deadline. The score you have at the deadline will be your final score. I will check it from your repository and post it in Canvas.
- After making corrections, **re-run Task 14** and check your score.
- **Always remember to commit and push the changes you have made by doing Task 15 before closing the GitHub Codespace on your fork. You need to do this frequently every time you work on the tasks.**


## 15. 🚀 Commit and push
```bash
git add .
git commit -m "Complete 15 CLI tasks"
git push
```

---

## 16. Optional Extended Workload (Not part of the 15-point score)

Complete the following extra tasks to deepen your CLI skills. These are recommended for extra practice.

The `check.sh` script now also reports these extended checks separately as an extended score.

### 16.1 Search recursively for shell scripts
```bash
find project -type f -name "*.sh" > project/docs/shell_files.txt
```

### 16.2 Sort and deduplicate output
```bash
cat project/docs/report.txt | sort | uniq > project/docs/report_unique.txt
```

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

If you also completed the Ubuntu 24.04 mini exercise from [01-command-line-basics.md](01-command-line-basics.md), verify these files too:

```bash
ls -l ubuntu_version.txt
ls -l command_check.txt
ls -l listening_ports.txt
ls -l storage_report.txt
ls -l package_search.txt
```

### 16.7 One-line pass/fail check (missing files report)

```bash
for f in project/docs/shell_files.txt project/docs/report_unique.txt project/docs/hello_stats.txt project/docs/cli_lines.txt project_backup.tar.gz project_restore/project ubuntu_version.txt command_check.txt listening_ports.txt storage_report.txt package_search.txt; do [ -e "$f" ] && echo "PASS $f" || echo "MISSING $f"; done
```
