# Lab 1 Submission: Write and Attach an IAM Policy

**Team IAM user:** acsad-g06
**Region:** ap-southeast-1 (Singapore)

## Part B. Launch denial (before any policy)

Error text:

> TODO: paste the full Part B error here. Bold the action name after "not authorized to perform".

Screenshot #1 (Part B launch error, user name visible):

<img width="907" height="943" alt="Screenshot 2026-09-24 224020" src="https://github.com/user-attachments/assets/923eaace-16e7-41db-b3de-a44d3da2e66e" />


## Part C. The three blanks in `RunOnlyT3MicroInstances`

| Blank | Value |
| --- | --- |
| `"Action"` | `ec2:RunInstances` |
| `"Resource"` (resource type) | `instance` (ARN ends in `:instance/*`) |
| `"ec2:InstanceType"` | `t3.micro` |

Policy name: `acsad-g06-launch`

## Part D. Attach the policy and launch

Screenshot #2 (Permissions tab listing `acsad-g06-launch`):

<img width="768" height="291" alt="image" src="https://github.com/user-attachments/assets/68fcf5bd-ec6e-45d0-ac25-67e4f56cc460" />


Security group creation without the `team` tag (denied):

> You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/acsad-g06 is not authorized to perform: ec2:CreateSecurityGroup on resource: arn:aws:ec2:ap-southeast-1:548387266019:security-group/* because no identity-based policy allows the ec2:CreateSecurityGroup action.

Security group `acsad-g06-web` created successfully with tag `team=acsad-g06` (`sg-07981d47808069dd1`).

Instance Running at: TODO (time)

Screenshot #3 (instance in Running state):

<img width="973" height="544" alt="Screenshot 2026-09-24 225633" src="https://github.com/user-attachments/assets/ff32f605-3985-4048-b3f3-d82dfffc2474" />


## Part E. Boundary test

`t3.small` launch error:

> You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/acsad-g06 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary.

After attaching `acsad-g06-too-wide`, the `t3.small` launch: TODO (still denied, paste error if different)

Tokyo Region error markers (AMI and VPC selectors):

> TODO: paste the red error marker text here

Screenshot #4 (`t3.small` or Tokyo denial):

![Denial](screenshots/04-denial.png)

CloudTrail `errorMessage` (`RunInstances`, `Client.UnauthorizedOperation`):

> TODO: paste the errorMessage here

Screenshot #5 (CloudTrail event with `errorMessage`):

<img width="1228" height="946" alt="Screenshot 2026-09-24 225534" src="https://github.com/user-attachments/assets/2b780aa1-e786-4de1-928b-09b95def7909" />


## Part F. Questions

1. **Which action did the Part B error name?**
   `ec2:RunInstances`.

2. **In your policy, which condition limits `ec2:RunInstances`?**
   A `StringEquals` condition on `ec2:InstanceType` with the value `t3.micro`, in the `RunOnlyT3MicroInstances` statement. It allows only `t3.micro` instances to be launched.

3. **After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.**
   The boundary statement `DenyAnyInstanceTypeButT3Micro` in `umak-lab-boundary` is an explicit deny. An explicit deny always overrides any allow, so the broader policy cannot lift it.

4. **Why is `ec2:*` on `*` a poor policy even with a boundary?**
   It grants every EC2 action on every resource, which breaks least privilege. The user gets far more power than the task needs, and if the boundary were loosened or removed, the user could cause serious damage or cost.

5. **In two sentences: what does the boundary control that your policy cannot?**
   The boundary sets the maximum permissions the user can ever have, and the admin controls it, not the user. The user's own policies can only grant permissions inside that limit and can never go beyond it.
