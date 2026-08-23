#!/usr/bin/env bash
pwd
ls -la
mkdir practice_cli
cd practice_cli
touch notes.txt
echo "Hello Linux" > notes.txt
echo "Learning CLI is fun!" >> notes.txt
cat notes.txt
# pt 2
cp notes.txt backup_notes.txt
mv backup_notes.txt notes_backup.txt
mkdir docs
mv notes_backup.txt docs/
# pt 3
ls -l notes.txt
chmod u+x notes.txt
chmod o-w notes.txt
ls -l notes.txt
# pt 4
whoami
date
ps aux
pgrep bash
# pt 5 - replaced ~ with ..
cd ..
rm -r practice_cli

