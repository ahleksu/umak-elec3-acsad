ANSWER_1: The file '/etc/course-portal/portal.conf' cannot be read because of a Permission Denied error.
ANSWER_2: It cannot read the file because it is neither the owner nor has any granted permissions. Owner has 'rw-' read/write permissions. Group 'course-portal' has '---' no permissions. Others also has '---' no permissions. 'course-portal' is a group member.
ANSWER_3: 640 is the smallest fix since it only gives read permission to the group 'r--'.
ANSWER_3_WHY: While 755 will also work, it also grants read/execute permissions which is not needed in reading the file. 777 grants permission to all, which is dangerous in user control. 400 gives only the root in permission to read
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: chmod 777 will grant the permissions: Read, Write, & Execute to Owner, Group, & Others. This will make all users modify and read all files in a directory, anyone can tamper, modify, or remove anything they want.
ANSWER_6: The portal health check or the webpage returns the expected response such as HTTP 200 OK.
ANSWER_7_BRIDGE: component=file-permission, detect=a monitor, recover=an immediate action, proof=multiple tests
