ANSWER_1: The course portal failed because it was not allowed to read the portal.conf file.
ANSWER_2: The file has permission 600, so only root, the owner, can read and write it. The course-portal user is only in the group and the group has no permissions, so it cannot read the file.
ANSWER_3: 640
ANSWER_3_WHY: 400 does not give the group permission to read. 755 and 777 give more permissions than needed, especially to other users.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: It gives everyone permission to modify the file, which could allow unauthorized users to change the configuration.
ANSWER_6: The course portal can be accessed successfully and is able to serve its content again.
ANSWER_7_BRIDGE: component=server, detect=monitoring, recover=automation, proof=health check