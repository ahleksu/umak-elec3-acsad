ANSWER_1: The Course Materials Portal cannot read /etc/course-portal/portal.conf because permission was denied.
ANSWER_2: The file is owned by root and has 600 permissions. The owner has read and write access, while the group and others have no access. Although course-portal belongs to the course-portal group, that group has no read permission.
ANSWER_3: 640
ANSWER_3_WHY: 400 does not give the group read access, while 755 and 777 give more permissions than necessary, including unnecessary write or execute access.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: chmod 777 gives everyone write and execute access, creating an unnecessary security risk.
ANSWER_6: A successful request to the Course Materials Portal showing that users can access the course materials again.
ANSWER_7_BRIDGE: component=configuration permissions, detect=monitoring, recover=automation, proof=validation
