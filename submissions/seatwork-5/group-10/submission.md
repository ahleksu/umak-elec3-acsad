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

- Group number: 10
- Section: ACSAD
- Group IAM user: acsad-g10
- Table name: umak-elec3-acsad-g10-messages
- Bucket name: umak-elec3-acsad-g10-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deploy would fail and roll back. The template asks CloudFormation to create a table named umak-elec3-acsad-g10-messages and a bucket named umak-elec3-acsad-g10-linktree, but both are already made in Lab 4 and Seatwork 3. CloudFormation only manages resources it created itself, so it can’t take over existing ones. It would hit an “already exists” error on those names, and the stack would end in ROLLBACK_COMPLETE. Your existing table and bucket would be left untouched. It would only work if the old resources were deleted first or imported into the stack.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A change in a template is written as code, so teammates can review the diff before it goes live, Git keeps the history, and you can roll back by reverting the commit. A console change is a manual, unreviewed click with no record of who did what and why. It can also silently drift from what the template says. This serves the Operational Excellence pillar, which covers infrastructure as code, peer review, and making changes small, tracked, and reversible. It also helps Security and Reliability, since mistakes get caught before they reach production.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| silicon-dioxide | created the `template.yaml` and `main.tf` files, made the branch and the one who submitted the pr and filled the Google Form |
| Kwin-Talattad | created `submission.md` and answered the questions |
| santiagojohncarlop-blip | verified `template.yaml` |
| jmiranda12345681 | verified `main.tf` |
