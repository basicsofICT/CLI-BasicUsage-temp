# ===== check.sh =====
#!/usr/bin/env bash
score=0
fail() { echo "❌ $1"; }

# 1 project tree
[ -d project/src ] && [ -d project/docs ] && { echo "✅ project tree"; ((score+=1)); } || fail "project tree missing"

# 2 main.py exists & exec & prints
if [ -x project/src/main.py ]; then
  out=$(project/src/main.py 2>/dev/null)
  if [ "$out" = "Hello CLI" ]; then
    echo "✅ main.py executable and prints correctly"
    ((score+=3))
  else fail "main.py output incorrect"; fi
else fail "main.py not executable or missing"; fi

# 3 readme.txt
if [ -f project/docs/readme.txt ]; then
  lines=$(wc -l < project/docs/readme.txt)
  [ "$lines" -ge 3 ] && { echo "✅ readme.txt lines ok"; ((score+=2)); } || fail "readme.txt fewer than 3 lines"
else fail "readme.txt missing in docs"; fi

# 4 report.txt lines
if [ -f project/docs/report.txt ]; then
  lines=$(wc -l < project/docs/report.txt)
  tail_line=$(tail -n1 project/docs/report.txt)
  if [ "$lines" -eq 11 ] && [ "$tail_line" = "Task completed" ]; then
    echo "✅ report.txt format ok"; ((score+=2))
  else fail "report.txt wrong line count or tail"; fi
else fail "report.txt missing"; fi

# 5 src_backup copy
[ -d project/src_backup ] && diff -qr project/src project/src_backup >/dev/null && { echo "✅ src_backup matches"; ((score+=2)); } || fail "src_backup missing or mismatch"

# 6 bin removed
[ ! -d project/bin ] && { echo "✅ project/bin absent"; ((score+=1)); } || fail "project/bin still exists"

# 7 hidden .secret
if [ -f project/.secret ]; then
  grep -qx "top secret" project/.secret && { echo "✅ .secret correct"; ((score+=1)); } || fail ".secret content wrong"
else fail ".secret missing"; fi

echo "Score: $score/12"
exit $score
