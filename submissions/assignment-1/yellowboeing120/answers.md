ANSWER_1: The user accessing the course-portal application is not allowed or have insufficient permissions to read the configuration file.
ANSWER_2: The file has 600 permissions: owner (root) has read and write, group (course-portal) has no permissions, and others have no permissions. Since the course-portal user is not the owner, it uses group permissions, which are empty, blocking read access.
ANSWER_3: 640
ANSWER_3_WHY: 400 only gives the owner (root) read access, not the group. 755 grants unnecessary execute permissions to everyone. 777 is dangerous because it allows anyone to read, write, and execute the file, creating a major security risk.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Unlike 640 which only gives group read access, 777 allows anyone on the system to read, write, and execute the file, letting unauthorized users tamper with or overwrite the configuration.
ANSWER_6: Checking application logs for successful startup messages or verifying the portal serves content correctly through an actual HTTP request.
ANSWER_7_BRIDGE: component=configuration management, detect=application monitoring, recover=automatic recovery, proof=service validation