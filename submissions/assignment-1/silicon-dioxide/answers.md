ANSWER_1: The Course Portal application failed due to not having permission to read portal.conf.
ANSWER_2: Converting -rw------- to octal gives 600, 6 gives read and write permission for the owner root, while the two 0's provide no permission to both the group and others respectively. The reason why the course-portal account can't read the file is due to its group course-portal's permissions to read the file are 0, preventing from reading the file.
ANSWER_3: 640
ANSWER_3_WHY: 400 would not work as it only changed the permissions for the owner. 755 provides read and execute access for the group and others giving more access than what is needed. 777 is also wrong as it provides read, write, and execute access for all users in the system, giving more access than what is needed.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Primary security issue, chmod 777 gives full access of the file to everyone including people unaffiliated to the group allowing bad actors to hijack the application or read sensitive information within the configuration file  
ANSWER_6: The service responds successfully when accessed, such as a working request or health check, showing it's actually serving users again.
ANSWER_7_BRIDGE: component=application, detect=application monitoring, recover=rollback, proof=uptime monitoring