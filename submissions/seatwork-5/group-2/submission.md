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

- Group number: 2
- Section: 4-ACSAD
- Group IAM user: acsad-g02
- Table name: umak-elec3-acsad-g02-messages
- Bucket name: umak-elec3-acsad-g02-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deployment will fail since our current cloud formation yaml or configuration uses our current existing s3 bucket and dynamoDB name making a conflict in naming so it will not overwrite those existing resources and AWS rejects it.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

Since making a Pull Request enables peer or group code review, version control, and validation before deployment, it allows the team to check for typos, misconfigurations, and accidental deletions before anything is deployed. This PR method also provides an audit trail and makes it easy to roll back to previous versions.

The Well-Architected pillar it serves is Operational Excellence, since it supports the design principles of performing operations as code (through the infrastructure configuration committed in the PR), making frequent, small, reversible changes, and reviewing those changes via version control.

Additionally, it also supports the Security pillar, since reviewing the configuration allows any misconfigured IAM or bucket policies to be spotted and fixed before deployment.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| carlcawas | answered the questions |
| eyakmwamwa | assistend in answering the questions |
| shinu-syr | written in submission.md and pr |
| mik4rin | double checked the process, and answers |
