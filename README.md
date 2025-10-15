# 🐧 Linux CLI Practical Task (15 Points)

- Work **in a GitHub Codespace**. This repo is pinned to **Ubuntu 24.04 (Noble)** so everyone uses the same environment.

- First study [Command Line Basics](01-command-line-basics.md) properly. I recommend completing all the tasks from the learning materials in the same environment to become familiar with the command line before attempting the practical exercises below.

- Follow each section in order (Not necessary but there are some tasks which you might need to do in order)

- You can check your score yourself. You will earn 13 points from the tasks, plus 2 points for running the score-checking script and pushing your changes to your repository.

- Remember to frequently commit and push the changes [15. 🚀 Commit and push](#15--commit-and-push)

---

***Do not edit check.sh or .github/classroom/autograding.json.***

***Good luck 🚀***
## 1. Create the project folders

```bash
# Make main project folder with two sub-folders: src & docs
# project/src project/docs
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

##  3. Create readme.txt inside project/src (Use Nano text editor)

```bash
Type any three (or more) lines in the file, e.g.:

Line 1
Line 2
Line 3
```
---

## 4. Copy `readme.txt` to `project/docs`

```bash
Copy the readme.txt file from its current location to project/docs folder, use cp command
```
---

## 5. Build report.txt

In the project/docs folder create a file named report.txt using redirect. 

> Hint: Use ls and head command to get the first 10 file names from ```/usr/bin ls  /usr/bin | head -n 10```.
> Hint: Use echo "Task completed" and redirect for appending the text as asked below. 

```bash
Write the first 10 filenames from /usr/bin

Append the text: Task completed

```

---

## 6. Back up the `src` folder to `src_backup`
```bash
In the project folder, create a new folder called src_backup and use cp command to create the copy of the src folder
```

---

## 7. Remove any `project/bin` folder if it exists


---

## 8. Create a hidden file `.secret` in `project/` folder.


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

## 12. Pipes: save first 5 lines of `/etc` long listing into a file project/docs/etc_head.txt
```bash
# hint use ls-l and head with pipe and then redirect
```

---

## 13.  Help output: capture first line of `date --help` command in the file project/docs/date_help.txt
```bash
# similar approach to 12 but use help command for the help output & redirect the output to project/docs/date_help.txt
```

---

## 14. Run the check.sh script and know your score
```bash
.github/classroom/check.sh > result.txt

# After you have run the above command, you can check your score by typing 

cat result.txt 

```

>> Note 

- If you’re not satisfied with your score, you may correct any mistakes you’ve made. You can try as many times as you like before the deadline. The score you have at the deadline will be your final score. I will check it from your repository and post it in Canvas. 
- After making the corrections, **re-run Task 14** again and check your score. 
- **Always remember to commit and push the changes you have made by doing the Task no. 15 before closing the GitHub Codespace. You need to do this frequently that is every time you work on the tasks, remember to commit and push**


## 15. 🚀 Commit and push
```bash
git add .
git commit -m "Complete 15 CLI tasks"
git push
```
