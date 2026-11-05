ANSWER_1: The Course Materials Portal failed to start because it cannot read its configuration file at /etc/course-portal/portal.conf due to a permission denied error.
ANSWER_2: The portal.conf file has permissions 600 (-rw-------), giving read/write access to root only while group and others have 0 permissions. Since course-portal is in group 995(course-portal) and not owner root, it is denied read access.
ANSWER_3: 640
ANSWER_3_WHY: 400 denies group access; 755 gives unnecessary execute permissions to group and others; 777 gives write and execute permissions to everyone, violating least privilege.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: chmod 777 grants write and execute access to everyone, allowing unauthorized users or an attacker to tamper with or overwrite sensitive configuration files.
ANSWER_6: Checking that /var/log/course-portal/app.log shows clean startup logs and successful HTTP responses without permission errors.
ANSWER_7_BRIDGE: component=<operating system/file permissions>, detect=<log monitoring>, recover=<remediating file permissions>, proof=<verifying clean service status logs>
