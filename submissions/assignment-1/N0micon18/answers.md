ANSWER_1: it failed because the permission has been denied 
ANSWER_2: the file has 600 permissions — only the owner (root) has any access; group and others both have none. 
Since course-portal isn't the owner, owner permissions don't apply to it.
It does belong to the file's group, but the group slot is 000, granting no rights. With every relevant slot at zero, there's no permission bit letting course-portal read the file — hence "Permission denied."
ANSWER_3: 640
ANSWER_3_WHY:640 is the best fix because it gives the group the read permission that was missing without adding unnecessary permissions.
400 doesn’t let the group read the file, while 755 and 777 give extra permissions that aren’t needed.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: one risk of chmod 777 it can give everyone full access like everyone can write and execute
ANSWER_6: <evidence that proves recovery- Checking the app log after applying the fix and repeating the action that
 caused the problem. 
If the log shows that the service started or read the file successfully without any more “Permission denied” errors,
 it confirms that the service is actually working again, not just that the file permissions were changed.
ANSWER_7_BRIDGE: component=file permissions, detect=log monitoring, recover=apply, proof=succesfull log.
