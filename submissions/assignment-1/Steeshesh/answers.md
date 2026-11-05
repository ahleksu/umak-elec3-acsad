ANSWER_1: The course portal application failed to read /etc/course-portal/portal.conf due to a permission denied error.
ANSWER_2: The file portal.conf is set to -rw------- (600), granting read and write permissions exclusively to the owner (root). The course-portal service runs under group course-portal, which has no permissions (---).
ANSWER_3: 640
ANSWER_3_WHY: Option 400 gives no access to the group. Options 755 and 777 grant unnecessary execute permissions to a non-executable config file and expose read/write access to everyone, violating the principle of least privilege.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Any local user or compromised service can alter, overwrite, or delete the configuration file, compromising service security and integrity.
ANSWER_6: The application starts up cleanly with no permission errors in /var/log/course-portal/app.log, and the web portal responds successfully to user requests.
ANSWER_7_BRIDGE: component=file permissions, detect=log monitoring, recover=adjusting group permissions with chmod, proof=successful health check responses
