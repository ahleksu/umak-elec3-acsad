#!/usr/bin/env bash

# ==========================================================
# Seatwork 1 — Linux CLI Fundamentals
# ELEC3 Cloud Computing — ACSAD
# ==========================================================

# ---------- Part 1 — Navigation & File Operations ----------

# 1. Display the current working directory
pwd

# 2. List all files (including hidden ones) in long format
ls -la

# 3. Create a directory named practice_cli
mkdir practice_cli

# 4. Move into the practice_cli directory
cd practice_cli

# 5. Create an empty file named notes.txt
touch notes.txt

# 6. Write "Hello Linux" into notes.txt
echo "Hello Linux" > notes.txt

# 7. Append "Learning CLI is fun!" to notes.txt
echo "Learning CLI is fun!" >> notes.txt

# 8. Display the contents of notes.txt
cat notes.txt

# ---------- Part 2 — File & Directory Management ----------

# 9. Copy notes.txt to backup_notes.txt
cp notes.txt backup_notes.txt

# 10. Rename backup_notes.txt to notes_backup.txt
mv backup_notes.txt notes_backup.txt

# 11. Create a subdirectory named docs and move notes_backup.txt into it
mkdir docs
mv notes_backup.txt docs/

# ---------- Part 3 — Permissions ----------

# 12. View file permissions for notes.txt
ls -l notes.txt

# 13. Give the owner execute permission for notes.txt
chmod u+x notes.txt

# 14. Remove write permission for others on notes.txt
chmod o-w notes.txt

# 15. Checkpoint — show it worked
ls -l notes.txt

# ---------- Part 4 — Process & System Info ----------

# 16. Display the current logged-in user
whoami

# 17. Show the current date and time
date

# 18. Display running processes
ps aux

# 19. Find the process ID (PID) of bash
pgrep bash || echo $$

# ---------- Part 5 — Cleanup ----------

# 20. Go back to the directory you started from, then remove practice_cli
cd ~
rm -r practice_cli
