ANSWER_1: The course-portal account can't read the file /etc/course-portal/portal.conf because permission is denied

ANSWER_2: Because the file's permissions are -rw------- which is 600 in octal. The owner, root, has rw-, the group has ---, and the others have --- as well. The course-portal isn't the owner, and it's only in the group which has no permissions meaning it cannot read the file

ANSWER_3: 640

ANSWER_3_WHY: 400 gives the group no permission (---) meaning course-portal cannot read the file. 755 and 777 give read access to others meaning it's more than needed

ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H

ANSWER_5: With 777, every user on the system gains write and execute access, so anyone could edit or delete the settings in portal.conf which could break or compromise the portal

ANSWER_6: The app log no longer shows the "Permission denied" error, and the Course Portal page loads normally for users

ANSWER_7_BRIDGE: component=application server, detect=monitoring and alerts, recover=automatic failover to a backup server, proof=health checks and successful user requests

