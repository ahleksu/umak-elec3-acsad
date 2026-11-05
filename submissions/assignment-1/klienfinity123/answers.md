ANSWER_1: The Course Materials Portal failed to start because a permission was denied when reading the /etc/course-portal/portal.conf as shown in the app.log.
ANSWER_2: The file is owned by root and has full mode of 600 that gives the owner read and write access while the group and others have no access because the course-portal account belongs to the file's group rather than being its owner, so it cannot read the file.
ANSWER_3: 640
ANSWER_3_WHY: Because 400 grants access to the owner only and the group keeps no read access still, while 755 gives read and execute access on the group then others but 777 have more permissions than necessary for both.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Using chmod 777 gives all users a read, write and execute access to the configuration file that can lead to a possible unauthorized modification.
ANSWER_6: The Course Materials Portal successfully loads a page or serves the request without producing permission denied error again.
ANSWER_7_BRIDGE: component=configuration access and file, detect=log monitoring on errors, recover=automated remediation, proof=continuous health checks or end-to-end tests to responses.
