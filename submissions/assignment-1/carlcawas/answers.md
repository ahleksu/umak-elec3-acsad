ANSWER_1: It runs as user course-portal and course-portal user cannot access the file "ERROR cannot read /etc/course-portal/portal.conf: Permission denied" 
ANSWER_2: course-portal cannot read the file since the file permission only allows the root to read and write (-rw-------). It checks the group of the course-portal and check its permission but since as indicated that it has 0 access based on the sequence of the notation owner, group, others it supports that the group cannot access it. 
ANSWER_3: 640 
ANSWER_3_WHY: since the 640 gives us (rw-r-----) this converts the access to read. 
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: It's because everyone will have the same access as the owner and the group. This can lead to untrackable changes and makes it easy for attacks or reads of sensitive data.
ANSWER_6: We can run the /var/log/ to check if error of permission denied is now gone.
ANSWER_7_BRIDGE: component=<configuration file permissions>, detect=<log alerting>, recover=<automated rollbacks to last good configuration>, proof=<HTTP Status code Monitoring>