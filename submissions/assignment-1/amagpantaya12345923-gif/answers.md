ANSWER_1: The course-portal service failed because it doesn't have permission to read its config file, /etc/course-portal/portal.conf.
ANSWER_2: The file's permissions are 600 (owner: rw-, group: ---, others: ---). The course-portal account isn't the file's owner (root is), and although its group matches the file's group, the group permission bits are 0, so it still has no access.
ANSWER_3: 640
ANSWER_3_WHY: 400 leaves the group with no access, so course-portal still can't read it. 755 and 777 grant execute permission the config file doesn't need, and 777 also lets every user on the system write to it, which is unnecessary and risky.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: chmod 777 would let any user on the system, not just the intended group, read, write, and even execute the config file, risking unauthorized modification.
ANSWER_6: Checking that app.log shows no new "Permission denied" errors and that the portal actually serves requests successfully, not just that the chmod command ran without error.
ANSWER_7_BRIDGE: component=configuration/file permissions, detect=logging and monitoring/alerting, recover=an automated remediation step or on-call runbook, proof=health checks or end-to-end tests confirming users are actually being served


