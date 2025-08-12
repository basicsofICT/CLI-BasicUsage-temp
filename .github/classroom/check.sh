#!/usr/bin/env bash
# check.sh — Grades 14 CLI tasks (1 point each)

score=0

ok() { echo "✅ $1"; score=$((score+1)); }
bad() { echo "❌ $1"; }

# -- Task 1: project/src and project/docs exist
if [ -d "project/src" ] && [ -d "project/docs" ]; then
  ok "Task 1: project folders exist"
else
  bad "Task 1: project/src and/or project/docs missing"
fi

# -- Task 2: hello.sh exists, executable, prints Hello CLI
if [ -x "project/src/hello.sh" ]; then
  out="$(project/src/hello.sh 2>/dev/null)"
  if [ "$out" = "Hello CLI" ]; then
    ok "Task 2: hello.sh executable and prints 'Hello CLI'"
  else
    bad "Task 2: hello.sh output incorrect"
  fi
else
  bad "Task 2: hello.sh missing or not executable"
fi

# -- Task 3: readme.txt initially created with >=3 lines (accept in src or docs)
readme=""
if [ -f "project/src/readme.txt" ]; then
  readme="project/src/readme.txt"
elif [ -f "project/docs/readme.txt" ]; then
  readme="project/docs/readme.txt"
fi
if [ -n "$readme" ] && [ "$(wc -l < "$readme")" -ge 3 ]; then
  ok "Task 3: readme.txt has at least 3 lines"
else
  bad "Task 3: readme.txt missing or too short (need ≥3 lines)"
fi

# -- Task 4: readme.txt moved to project/docs
if [ -f "project/docs/readme.txt" ]; then
  ok "Task 4: readme.txt present in project/docs"
else
  bad "Task 4: readme.txt not found in project/docs"
fi

# -- Task 5: report.txt (10 names from /usr/bin + 'Task completed' as last line)
if [ -f "project/docs/report.txt" ]; then
  total_lines="$(wc -l < project/docs/report.txt)"
  last_line="$(tail -n1 project/docs/report.txt)"
  # Validate first 10 lines refer to existing entries in /usr/bin
  mapfile -t first10 < <(head -n 10 project/docs/report.txt 2>/dev/null)
  valid_first10=true
  if [ "${#first10[@]}" -ne 10 ]; then
    valid_first10=false
  else
    for name in "${first10[@]}"; do
      # Trim spaces
      ntrim="$(printf "%s" "$name" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
      [ -e "/usr/bin/$ntrim" ] || { valid_first10=false; break; }
    done
  fi
  if [ "$total_lines" -eq 11 ] && [ "$last_line" = "Task completed" ] && $valid_first10; then
    ok "Task 5: report.txt format is correct"
  else
    bad "Task 5: report.txt wrong (need 11 lines, last='Task completed', first 10 exist in /usr/bin)"
  fi
else
  bad "Task 5: project/docs/report.txt missing"
fi

# -- Task 6: src_backup is a copy of src
if [ -d "project/src_backup" ] && diff -qr "project/src" "project/src_backup" >/dev/null 2>&1; then
  ok "Task 6: src_backup matches src"
else
  bad "Task 6: src_backup missing or differs from src"
fi

# -- Task 7: project/bin does not exist
if [ ! -d "project/bin" ]; then
  ok "Task 7: project/bin is absent"
else
  bad "Task 7: project/bin still exists"
fi

# -- Task 8: hidden file .secret in project/
if [ -f "project/.secret" ]; then
  ok "Task 8: hidden file .secret exists"
else
  bad "Task 8: project/.secret missing"
fi

# -- Task 9: permissions of hello.sh recorded in mode.txt
if [ -f "project/src/hello.sh" ] && [ -f "project/docs/mode.txt" ]; then
  actual_mode="$(stat -c '%a' project/src/hello.sh 2>/dev/null)"
  recorded_mode="$(sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' project/docs/mode.txt 2>/dev/null)"
  if [ -n "$actual_mode" ] && [ "$actual_mode" = "$recorded_mode" ]; then
    ok "Task 9: mode.txt records hello.sh permissions ($actual_mode)"
  else
    bad "Task 9: mode.txt does not match hello.sh permissions (got '$recorded_mode', expected '$actual_mode')"
  fi
else
  bad "Task 9: hello.sh or project/docs/mode.txt missing"
fi

# -- Task 10: wildcard list in wild.txt contains a1.txt, a2.txt, ab.txt (not b1.log)
if [ -f "project/docs/wild.txt" ]; then
  a1=$(grep -Fq "a1.txt" project/docs/wild.txt; echo $?)
  a2=$(grep -Fq "a2.txt" project/docs/wild.txt; echo $?)
  ab=$(grep -Fq "ab.txt" project/docs/wild.txt; echo $?)
  nb=$(grep -Fq "b1.log" project/docs/wild.txt; echo $?)
  if [ "$a1" -eq 0 ] && [ "$a2" -eq 0 ] && [ "$ab" -eq 0 ] && [ "$nb" -ne 0 ]; then
    ok "Task 10: wild.txt lists expected matches"
  else
    bad "Task 10: wild.txt missing expected entries (a1.txt, a2.txt, ab.txt) or includes b1.log"
  fi
else
  bad "Task 10: project/docs/wild.txt missing"
fi

# -- Task 11: linux_count.txt equals count of 'Linux' in downloaded hello.txt
if [ -f "project/src/hello.txt" ] && [ -f "project/docs/linux_count.txt" ]; then
  expected_cnt="$(grep -o 'Linux' project/src/hello.txt 2>/dev/null | wc -l | tr -d '[:space:]')"
  recorded_cnt="$(tr -d '[:space:]' < project/docs/linux_count.txt)"
  if [ -n "$expected_cnt" ] && [ "$expected_cnt" = "$recorded_cnt" ]; then
    ok "Task 11: linux_count.txt has correct count ($expected_cnt)"
  else
    bad "Task 11: linux_count mismatch (got '$recorded_cnt', expected '$expected_cnt')"
  fi
else
  bad "Task 11: project/src/hello.txt or project/docs/linux_count.txt missing"
fi

# -- Task 12: etc_head.txt has first 5 lines of ls -l /etc (check only line count = 5)
if [ -f "project/docs/etc_head.txt" ]; then
  lines12="$(wc -l < project/docs/etc_head.txt)"
  if [ "$lines12" -eq 5 ]; then
    ok "Task 12: etc_head.txt has 5 lines"
  else
    bad "Task 12: etc_head.txt should have exactly 5 lines (has $lines12)"
  fi
else
  bad "Task 12: project/docs/etc_head.txt missing"
fi

# -- Task 13: date_help.txt equals first line of 'date --help'
if [ -f "project/docs/date_help.txt" ]; then
  expected13="$(date --help | head -n 1 | sed -e 's/[[:space:]]*$//')"
  got13="$(sed -e 's/[[:space:]]*$//' project/docs/date_help.txt)"
  if [ "$got13" = "$expected13" ] && [ -n "$got13" ]; then
    ok "Task 13: date_help.txt captures the first help line"
  else
    bad "Task 13: date_help.txt does not match first line of 'date --help'"
  fi
else
  bad "Task 13: project/docs/date_help.txt missing"
fi

# -- Task 14: calc.txt contains result of 34+45 (79)
if [ -f "project/docs/calc.txt" ]; then
  got14="$(tr -d '[:space:]' < project/docs/calc.txt)"
  if [ "$got14" = "79" ]; then
    ok "Task 14: calc.txt contains 79"
  else
    bad "Task 14: calc.txt content incorrect (got '$got14', expected '79')"
  fi
else
  bad "Task 14: project/docs/calc.txt missing"
fi

echo "Score: $score/14"

exit 0
