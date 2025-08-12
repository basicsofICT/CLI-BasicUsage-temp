# 🐧 Linux CLI Practical Task (GitHub Classroom)

- Work **in a GitHub Codespace**. This repo is pinned to **Ubuntu 24.04 (Noble)** so everyone uses the same environment.

- Follow each section in order 

- The autograder checks **exact filenames and locations**, so type the commands as asked.

---

***Do not edit check.sh or .github/classroom/autograding.json.***

***Good luck 🚀***
## 📂 1. Create the project folders

```bash
# Make main project folder with two sub-folders: src & docs
# project/src project/docs
```

## 📝 2. Add main.py to project/src

```bash
cat > project/src/main.py <<'PY'
#!/usr/bin/env python3
print("Hello CLI")
PY
chmod +x project/src/main.py      # make it executable
```

## 📄 3. Create readme.txt inside project/src (Use Nano text editor)

```bash
Type any three (or more) lines in the file, e.g.:

Line 1
Line 2
Line 3
```
## 📦 4. Move readme.txt to project/docs

```bash
Move the readme.txt file from it current location to project/docs folder
```

## 📑 5. Build report.txt

In the project/docs folder create a file named report.txt using redirect. 

> Hint: Use ls -l and head command to get the first 10 file names from ```/usr/bin ls -1 /usr/bin | head -n 10``` 

```bash
Write the first 10 filenames from /usr/bin

Append the text: Task completed

```


## 📋 6. Back-up the src folder

In the project folder, create a new folder called src_backup and use cp command to create the copy of the src folder


## 🗑️ 7. Remove any old project/bin folder (if you accidentally made one)


## 🙈 8. Create a hidden file 

Inside the project directory create a hidden file called secret


## 🚀 9 · Commit and push

```bash
git add .
git commit -m "Finish CLI practical"
git push
```

>> **Done! Push triggers the autograder.**
You’ll see results in the Classroom dashboard within a minute or two.