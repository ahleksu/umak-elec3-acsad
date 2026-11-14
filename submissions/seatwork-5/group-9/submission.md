# Seatwork 5 Submission

## About us

- Group number: 9
- Section: IV-ACSAD
- Group IAM user: acsad-g09
- Table name: umak-elec3-acsad-g09-messages
- Bucket name: umak-elec3-acsad-g09-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

   The deployment would fail because the DynamoDB table and S3 bucket already exist from our previous activities. CloudFormation would try to create these resources again, but it cannot automatically take ownership of existing resources that are not managed by its stack.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

   Writing changes in a template and reviewing them through a Pull Request is safer because the changes can be checked by team members before they are applied. It also provides a record of changes, making it easier to track errors and revert unwanted changes. This serves the **Operational Excellence** pillar of the AWS Well-Architected Framework because it promotes organized, consistent, and repeatable operations.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| Azores-Mea | Modified and prepared the content for file template.yaml |
| WayneyYsrrael | Modified and prepared the content for file main.tf |
| rdanlogA12345581 | Answered the questions |
| klomol-jo | Finalized the work, reviewed the completed output, and prepared the files for submission. |
