# Seatwork 5 Submission

## About us

- Group number: 5
- Section: IV-ACSAD
- Group IAM user: acsad-g05
- Table name: umak-elec3-acsad-g05-messages
- Bucket name: umak-elec3-acsad-g05-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deployment would fail. The reason is that `aws cloudformation deploy` creates a new stack, and a new stack tries to make new resources. It does not take over resources that already exist in the account. Our template asks for a table named `umak-elec3-acsad-g05-messages` and a bucket named `umak-elec3-acsad-g05-linktree`, but our group already made both of them in the console in Lab 4 and Seatwork 3.

Because of this, CloudFormation cannot create them again. A DynamoDB table name must be unique within an account and a Region, and an S3 bucket name must be unique across all of AWS, so both names are already taken by our existing resources. As a result, the stack does not finish creating, and CloudFormation rolls back anything it had started. Our existing table and bucket stay unchanged.

To manage these resources with the template, we would first have to import the existing table and bucket into a stack, or use different names in the template.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A change written in a template and reviewed in a Pull Request is safer because a second person checks it before it reaches AWS. In a template, the change is plain text, so a reviewer can see exactly which lines were added or removed. For example, a reviewer can notice that a bucket policy allows more than `s3:GetObject` and ask for a fix before anything is deployed. In contrast, a change made in the console takes effect immediately, and nobody reviews it beforehand, so a wrong click can break a setting right away.

This practice serves the **Operational Excellence** pillar of the AWS Well-Architected Framework. This pillar encourages performing operations as code, so changes are written down, reviewed, and made in a controlled way.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| MrBep | Wrote the DynamoDB table in `template.yaml` (name, on-demand billing, key `id`, tags, Description). Reviewed `main.tf` against `template.yaml`. |
| Rengokunn | Wrote `SiteBucket` (website hosting, Block Public Access off, tags) and `SiteBucketPolicy` in `template.yaml`. Checked the YAML spacing. |
| stratterium | Wrote `main.tf` (table, bucket, website configuration, public access block, bucket policy with `depends_on`). Ran `terraform fmt` and `terraform validate` if available. |
| klienfinity123 | Made the branch and folder, wrote and filled in `submission.md`, opened the Pull Request, and submitted its link in the Google Form. |
