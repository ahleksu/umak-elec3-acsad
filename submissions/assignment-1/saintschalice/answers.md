```markdown
ANSWER_1: The course-portal application failed to start because it could not read its config file, /etc/course-portal/portal.conf, due to a permission denied error.

ANSWER_2: The file's permissions are -rw------- which is octal 600: the owner (root) has read/write, but both the group and others have no permissions at all (---). The course-portal account is not the file's owner — root is — it's only a member of the course-portal group. Since the group's permission bits are 000, group membership grants no access, so the account is blocked from reading the file.

ANSWER_3: 640
ANSWER_3_WHY: 400 gives no group access, so course-portal (a group member, not the owner) still can't read it. 755 and 777 both add execute permission to a config file that never needs to be executed, and 777 additionally makes the file world-writable, which is unnecessary and unsafe. 640 gives exactly what's needed: owner read/write, group read-only, others nothing.

ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H

ANSWER_5: chmod 777 would make the config file writable by every user on the system, not just the intended service account, creating a serious risk that any local user or compromised process could tamper with sensitive configuration.

ANSWER_6: Beyond the chmod command succeeding, real evidence of recovery is the application log showing no further "Permission denied" errors and the service actually responding correctly — e.g., the portal loading successfully or a health-check endpoint returning success — since a successful command doesn't by itself prove the application is functioning.

ANSWER_7_BRIDGE: component=file permissions/access control, detect=monitoring and alerting, recover=automated recovery or rollback, proof=health checks and observability
```
