# Seatwork 5 Submission — Group 8

**Group number:** 8  
**Group IAM username:** `acsad-g08`  
**Course:** ELEC3

## Group members and contributions

Please fill in each contribution with the work that the member actually completed.

- Barro, Paolo Jacob — GitHub username: `silverperson` — Contribution: **Prepared the CloudFormation configuration (template.yaml) and organized the submission files. coordinated the group's final submission, and handled the Pull Request.**
- Canlas, Jan Rod — GitHub username: `JanRodCanlas` — Contribution: **Reviewed the Terraform configuration (main.tf) and checked whether the resources and settings matched the assignment requirements.**
- Zapata, Samuel Edrian — GitHub username: `szapatak12153026-hash` — Contribution: **Reviewed the written answers in submission.md**

## Question 1

**Your table and your bucket already exist, because your group made them in the console. Suppose that your group user could create stacks, and you ran `aws cloudformation deploy` with your template today. What happens, and why?**

CloudFormation would try to create the resources described in the template as part of a new stack. However, the DynamoDB table and S3 bucket already exist from the earlier lab activities. CloudFormation does not automatically take ownership of existing resources just because their names appear in a new template. The creation would therefore encounter existing-resource/name conflicts and the stack operation could fail and roll back. To manage existing resources with CloudFormation, they would need to be brought under stack management using the resource import process rather than simply creating them again.

## Question 2

**A change written in a template and reviewed in a Pull Request is safer than the same change made in the console. Give one reason, and name the Well-Architected pillar that it serves.**

A change reviewed in a Pull Request is safer because groupmates can inspect the proposed configuration and catch mistakes before the change is applied. The Pull Request also leaves a record of what changed and who reviewed it. This supports the **Operational Excellence** pillar because it encourages controlled, reviewable operations and managing infrastructure as code.
