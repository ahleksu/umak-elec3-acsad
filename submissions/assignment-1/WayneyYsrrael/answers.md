ANSWER_1: The Course Materials Portal failed because it was denied permission to read /etc/course-portal/portal.conf.
ANSWER_2: the file is root, the group is course-portal, and the permissions are -rw------- or 600. Root can read and write the file, but the course-portal group has no permissions and others also have no permissions. Even though course-portal is a member of the group, it cannot read the file because the group does not have read permission.
ANSWER_3: 640
ANSWER_3_WHY:400 would not work since the group still cannot read the file and 755 gives more access than needed including execute permission and access. last is 777 gives everyone full permissions
ANSWER_4_ORDER:  B, G, E, D, F, A, I, C, H
ANSWER_5: chmod 777 gives everyone write access, so unauthorized users could change the configuration file.
ANSWER_6: The service can be tested by requesting course materials and confirming that they are successfully returned without the permission error.
ANSWER_7_BRIDGE:  component=permissions, detect=error logs, recover=correct the permissions, proof=portal successfully serves course materials
