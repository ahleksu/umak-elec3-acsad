#!/usr/bin/env bash
# Seatwork 1 — checker
# Runs a submitted seatwork.sh in an isolated sandbox (your real files are never
# touched) and checks both that the required commands are present and that running
# them actually produces the right results. Works locally and is the same script
# GitHub Actions runs against a submitted PR.
#
# Usage: check.sh <path-to-your-submission-folder>
#   (the folder must contain seatwork.sh — this is the standard interface every
#   activity's checker follows: one argument, your submission folder)
set -uo pipefail

SUBMISSION_DIR="${1:-}"
if [ -z "$SUBMISSION_DIR" ] || [ ! -d "$SUBMISSION_DIR" ]; then
  echo "Usage: $0 <path-to-your-submission-folder>" >&2
  exit 1
fi
SCRIPT="$SUBMISSION_DIR/seatwork.sh"
if [ ! -f "$SCRIPT" ]; then
  echo "FAIL — $SCRIPT not found. Your submission folder must contain seatwork.sh." >&2
  exit 1
fi
SCRIPT="$(cd "$(dirname "$SCRIPT")" && pwd)/$(basename "$SCRIPT")"

# Strip carriage returns (CRLF to LF) for Windows compatibility
if command -v sed >/dev/null 2>&1; then
  sed -i.bak 's/\r$//' "$SCRIPT" 2>/dev/null || true
  rm -f "${SCRIPT}.bak" 2>/dev/null || true
fi

fail=0
note() { echo "  - $1"; }

echo "== Seatwork 1 — checking $(basename "$SCRIPT") =="
echo

# --- Static check: required commands are actually present ---------------
echo "-- Part A: required commands present --"
declare -a required_patterns=(
  "pwd"
  "ls -la|ls -al"
  "mkdir practice_cli"
  "cd practice_cli"
  "touch notes.txt"
  "Hello Linux"
  "Learning CLI is fun"
  "cat notes.txt"
  "cp notes.txt backup_notes.txt"
  "mv backup_notes.txt notes_backup.txt"
  "mkdir docs"
  "mv notes_backup.txt docs"
  "ls -l notes.txt"
  "chmod u\\+x notes.txt"
  "chmod o-w notes.txt"
  "whoami"
  "^[^#]*date"
  "ps aux"
  "pgrep bash"
  "rm -r practice_cli|rm -rf practice_cli"
)
declare -a required_labels=(
  "pwd (Part 1.1)"
  "ls -la (Part 1.2)"
  "mkdir practice_cli (Part 1.3)"
  "cd practice_cli (Part 1.4)"
  "touch notes.txt (Part 1.5)"
  "echo \"Hello Linux\" (Part 1.6)"
  "echo \"Learning CLI is fun!\" (Part 1.7)"
  "cat notes.txt (Part 1.8)"
  "cp notes.txt backup_notes.txt (Part 2.9)"
  "mv backup_notes.txt notes_backup.txt (Part 2.10)"
  "mkdir docs (Part 2.11)"
  "mv notes_backup.txt docs/ (Part 2.11)"
  "ls -l notes.txt (Part 3.12)"
  "chmod u+x notes.txt (Part 3.13)"
  "chmod o-w notes.txt (Part 3.14)"
  "whoami (Part 4.16)"
  "date (Part 4.17)"
  "ps aux (Part 4.18)"
  "pgrep bash (Part 4.19)"
  "rm -r practice_cli (Part 5.20)"
)

for idx in "${!required_patterns[@]}"; do
  pattern="${required_patterns[$idx]}"
  label="${required_labels[$idx]}"
  if grep -qE "$pattern" "$SCRIPT"; then
    echo "PASS — found: $label"
  else
    echo "FAIL — missing: $label"
    fail=1
  fi
done

echo
echo "-- Part B: actually running it produces the right results --"

SANDBOX="$(mktemp -d)"
trap 'rm -rf "$SANDBOX"' EXIT

if command -v timeout >/dev/null 2>&1; then
  RUNNER=(timeout 30)
else
  RUNNER=()
fi

output="$(cd "$SANDBOX" && HOME="$SANDBOX" ${RUNNER[@]+"${RUNNER[@]}"} bash "$SCRIPT" 2>&1)"
exit_code=$?

if [ "$exit_code" -ne 0 ]; then
  echo "FAIL — script exited with code $exit_code instead of 0."
  note "Full output:"
  echo "$output" | sed 's/^/    /'
  fail=1
else
  echo "PASS — script ran to completion (exit 0)."
fi

if grep -q "Hello Linux" <<< "$output" && grep -q "Learning CLI is fun" <<< "$output"; then
  echo "PASS — cat notes.txt printed both lines you wrote into it."
else
  echo "FAIL — output never showed both 'Hello Linux' and 'Learning CLI is fun!' —"
  note "check that echo/cat actually ran and notes.txt has both lines."
  fail=1
fi

# last permission-string-looking line should show owner-execute set (chmod u+x)
perm_line="$(grep -E '^[-dl][-rwxsSt]{9}' <<< "$output" | tail -n1)"
if [ -n "$perm_line" ] && [ "${perm_line:3:1}" = "x" ]; then
  echo "PASS — the checkpoint 'ls -l notes.txt' after Part 3 shows owner-execute set."
else
  echo "FAIL — couldn't confirm chmod u+x took effect from the checkpoint ls -l output."
  note "Make sure Part 3's checkpoint (ls -l notes.txt, after both chmod commands) runs and prints."
  fail=1
fi

if grep -qE 'PID' <<< "$output"; then
  echo "PASS — ps aux output (or similar) appeared."
else
  echo "FAIL — no ps aux-style output found (expected a header containing PID)."
  fail=1
fi

if grep -qE '^[0-9]+$' <<< "$output"; then
  echo "PASS — pgrep bash printed a numeric PID."
else
  echo "FAIL — no bare numeric line found — pgrep bash may not have run or found nothing."
  fail=1
fi

if [ -d "$SANDBOX/practice_cli" ]; then
  echo "FAIL — practice_cli/ still exists after the script ran; Part 5 cleanup didn't happen."
  fail=1
else
  echo "PASS — practice_cli/ was removed (Part 5 cleanup ran)."
fi

echo
if [ "$fail" -eq 0 ]; then
  echo "=================================="
  echo "PASS — all checks passed."
  echo "=================================="
  exit 0
else
  echo "=================================="
  echo "FAIL — see messages above."
  echo "=================================="
  exit 1
fi
