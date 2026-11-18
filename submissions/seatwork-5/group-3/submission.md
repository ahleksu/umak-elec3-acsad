# Seatwork 5 Submission

## About us

- Group number: 3
- Section: IV-ACSAD
- Group IAM user: acsad-g03
- Table name: umak-elec3-acsad-g03-messages
- Bucket name: umak-elec3-acsad-g03-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deployment would fail and CloudFormation would roll back the stack. Because the DynamoDB table (`umak-elec3-acsad-g03-messages`) and S3 bucket (`umak-elec3-acsad-g03-linktree`) already exist in AWS from Lab 4 and Seatwork 3, CloudFormation cannot create new resources with the same physical names and throws an `AlreadyExists` error.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

Writing changes in a template and reviewing them in a Pull Request allows teammates to inspect and verify the exact configuration changes before they are applied, prevents manual clicking mistakes, and keeps a version history in Git so changes can be easily rolled back. This serves the **Operational Excellence** pillar of the AWS Well-Architected Framework (performing operations as code and making reversible changes).

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| johnclefordricafranca | Created the branch, wrote the CloudFormation template, and uploaded the files to GitHub. |
| edjjff | Wrote the Terraform configuration for the DynamoDB table and S3 bucket. |
| LUZADA-SARAH | Added the resource tags, bucket policy, and public access settings. |
| reymarttskrt | Checked the templates and wrote the answers for the questions. |
