# Seatwork 5 Submission

## About us

- Group number: 6
- Section: IV-ACSAD
- Group IAM user: acsad-g06
- Table name: umak-elec3-acsad-g06-messages
- Bucket name: umak-elec3-acsad-g06-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deploy fails, and CloudFormation rolls the stack back. CloudFormation makes a new stack and tries to create every resource in the template, but a table named `umak-elec3-acsad-g06-messages` and a bucket named `umak-elec3-acsad-g06-linktree` already exist, because we made them in the console. A table name must be unique in the account and Region, and a bucket name must be unique in all of AWS, so the creates fail with an "already exists" error. CloudFormation does not take over resources that it did not make. To manage them with this template, we would have to import them into the stack first, or delete them and let the stack make them again.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A groupmate reads the exact change in the Pull Request before anyone applies it, so a mistake, such as a policy that allows more than `s3:GetObject`, is caught before it reaches AWS. Git also keeps every version of the template, so we can see who changed what and roll back to the last good version, while a console click leaves no reviewable record. This serves the Operational Excellence pillar, which asks us to perform operations as code and to make small, reversible changes.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| tlswlgus | Wrote template.yaml and opened the Pull Request |
| yellowboeing120 | Wrote main.tf |
| amagpantaya12345923-gif | Checked both files against the brief and the Seatwork 3 bucket policy |
| Bewoop | Answered the two questions and filled in submission.md |
