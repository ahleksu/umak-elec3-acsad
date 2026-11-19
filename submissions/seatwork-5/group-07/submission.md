# Seatwork 5 Submission

<!--
How to use this template:

1. Copy this file to submissions/seatwork-5/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save template.yaml and main.tf in the same folder.
4. Do not put an access key, a password, an invoke URL, or the AWS account number in any file.
5. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 07
- Section: IV - ACSAD
- Group IAM user: acsad-g07
- Table name: umak-elec3-acsad-g07-messages
- Bucket name: umak-elec3-acsad-g07-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deploy fails. CloudFormation makes a new stack and tries to create a new table and a new bucket with our names, but those names are already taken by the table and bucket that we made in the console. A DynamoDB table name must be unique in the account and Region, and an S3 bucket name must be unique in all of AWS. CloudFormation does not take over a resource that it did not create, so the create fails with "already exists", and the stack rolls back and deletes whatever it made. Our console table and bucket stay as they are. To manage them with CloudFormation, we would have to import them into a stack instead.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A groupmate reads the exact change in the Pull Request before anyone applies it, so a mistake such as a wrong bucket name or a policy that allows too much is caught before it reaches AWS. Git also keeps a history, so we can see who changed what and go back to the old version. This serves the Operational Excellence pillar, which asks us to perform operations as code and make small changes that we can reverse.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| Sdjada | Assigned the workloads and manage activities based on deadlines |
| yoonice0393 | Uploaded the files and did the PR |
| N0micon18 | Edited the submission.md  |
| JCKS003 | Designed and edited the website |
