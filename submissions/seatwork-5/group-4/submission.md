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

- Group number: 4
- Section: IV-ACSAD
- Group IAM user: acsad-g04
- Table name: umak-elec3-acsad-g04-messages
- Bucket name: umak-elec3-acsad-g04-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file
- [`terraform-validation.png`](terraform-validation.png): optional Terraform validation check (`terraform init`, `fmt`, `validate`)

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deployment fails and CloudFormation automatically triggers a stack rollback (`ROLLBACK_IN_PROGRESS` to `ROLLBACK_COMPLETE`), leaving no resources created or managed by the stack.

**Why:**
Both resources specified in the template -- the DynamoDB table (`umak-elec3-acsad-g04-messages`) and the S3 website bucket (`umak-elec3-acsad-g04-linktree`) -- already physically exist in our AWS account and Region from when our group created them previously via the AWS Management Console during Lab 4 and Seatwork 3.

When CloudFormation attempts to execute the stack creation, it attempts to provision each resource as a new asset:
- DynamoDB rejects the creation call with a `ResourceInUseException` / `Cannot create preexisting table` error because a table with that exact name already exists.
- Amazon S3 rejects the bucket creation call with a `BucketAlreadyOwnedByYou` / `BucketAlreadyExists` error because bucket names are globally unique.

CloudFormation cannot automatically take over, adopt, or overwrite pre-existing out-of-band resources during standard deployment without an explicit resource import operation (`cloudformation create-change-set --change-set-type IMPORT`). Consequently, the resource creation failure causes the entire CloudFormation stack creation to fail and roll back.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A change written in a template (Infrastructure as Code) and reviewed in a Pull Request is significantly safer than making changes via the AWS Console ("ClickOps") for the following reasons:
- **Peer Review & Verification:** Making changes via the console is prone to slips, missed clicks, typos, or forgotten parameters (such as tags or security settings). In contrast, a Pull Request allows team members to inspect the exact planned configuration changes line-by-line, test them against linters or validators, and identify potential bugs or security risks before deployment.
- **Traceability & Version Control:** Git maintains an immutable audit trail showing who authored the change, why it was introduced, who approved it, and the exact diff. If an unforeseen defect occurs, the team can immediately revert the commit to restore the previous known working state.
- **Repeatability & Consistency:** A template eliminates human configuration drift. The same template can reliably recreate the entire infrastructure across any environment or Region without manual intervention.

This practice primarily serves the **Operational Excellence** pillar of the AWS Well-Architected Framework, specifically adhering to the core design principles:
- **"Perform operations as code"**: Defining and managing all infrastructure through code ensures automated, standardized, and repeatable execution.
- **"Make frequent, small, reversible changes"**: Allows small incremental updates through PRs that can easily be rolled back if necessary.

*(It also reinforces the **Security** pillar by enabling automated policy checks and minimizing the need for manual administrative console access.)*

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| Steeshesh | Configured the DynamoDB messages table resource, on-demand billing mode, schema, and tags in `template.yaml` and `main.tf` |
| Note-Program | Structured the S3 bucket website configuration and public access block settings across CloudFormation and Terraform |
| EvapeGT | Wrote the public read S3 bucket policies in CloudFormation YAML syntax and Terraform HCL (`jsonencode`) with the required `depends_on` |
| chupapichuros | Answered the deployment collision and Well-Architected questions in `submission.md`, validated all files, and set up the branch and PR |
