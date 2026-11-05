# Lab 1 Submission

## Part B
**Error Action Name:** You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/acsad-g07 is not authorized to perform: ec2:CreateSecurityGroup on resource: arn:aws:ec2:ap-southeast-1:548387266019:security-group/* because no identity-based policy allows the ec2:CreateSecurityGroup action. Encoded authorization failure message: 6hgnuYqJ5CQayXBsXknkI67agacB6ZgQ-KgIcGFsxq0PNyFf36_WAYUUAyN_6QuC9pGyVFjpCMnOMNeL777xQafYCFEOeeQeXouFBFcBPafVyVjpBwcfY_Ru8ZiNtpyMy38KZpnqBm6NBD5PO0Cypv1G2YZoFfgugfJx3vHKqkk6CUWuzy25DUuCdIYiVsAOFNFfqefJXb8lKeXNkWfJnFtj22jjFOJHFhir8FTu2zYxTE1uOI5NRMwy82gWZ35F7jdrsLmQjLx1s_3nUawgzfMPQg9jHKilsYktTz9MC1V72Q2AETrVaJPCXr80vvxr00X7N8HP64jVzUaqBEtgSVabfCaovE0-UBn7jQMr7ss-FBozvper96mVEXWzNWuXXTay8N1eYP9J7gfd1CzeQZCIWgHeWmZlVkE1NhzKimVIb-Wot95SVULiFh8Us4MxqwAlIIipdUc62UGOQ0W9PxqeuAFoqKIQcFjIv10a-u_qBr62efpnt1JDYOSqostB9JFaSehx0F0iO_w23L2n_CFTsWwHiEpNBDUIcNsk 

**Screenshot (Part B launch denial with username visible):**
<img width="1271" height="681" alt="part_b" src="https://github.com/user-attachments/assets/493a7272-2b4c-4f0c-8622-e231e5cec86d" />


## Part C
**Policy Statement Blanks:**
- `"Action"`: ec2:RunInstances 
- `"Resource"`: arn:aws:ec2:ap-southeast-1:548387266019:instance/* 
- `"ec2:InstanceType"`: t3.micro 

## Part D
**Security Group Error Text:** You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/acsad-g07 is not authorized to perform: ec2:CreateSecurityGroup on resource: arn:aws:ec2:ap-southeast-1:548387266019:security-group/* because no identity-based policy allows the ec2:CreateSecurityGroup action. Encoded authorization failure message: 6hgnuYqJ5CQayXBsXknkI67agacB6ZgQ-KgIcGFsxq0PNyFf36_WAYUUAyN_6QuC9pGyVFjpCMnOMNeL777xQafYCFEOeeQeXouFBFcBPafVyVjpBwcfY_Ru8ZiNtpyMy38KZpnqBm6NBD5PO0Cypv1G2YZoFfgugfJx3vHKqkk6CUWuzy25DUuCdIYiVsAOFNFfqefJXb8lKeXNkWfJnFtj22jjFOJHFhir8FTu2zYxTE1uOI5NRMwy82gWZ35F7jdrsLmQjLx1s_3nUawgzfMPQg9jHKilsYktTz9MC1V72Q2AETrVaJPCXr80vvxr00X7N8HP64jVzUaqBEtgSVabfCaovE0-UBn7jQMr7ss-FBozvper96mVEXWzNWuXXTay8N1eYP9J7gfd1CzeQZCIWgHeWmZlVkE1NhzKimVIb-Wot95SVULiFh8Us4MxqwAlIIipdUc62UGOQ0W9PxqeuAFoqKIQcFjIv10a-u_qBr62efpnt1JDYOSqostB9JFaSehx0F0iO_w23L2n_CFTsWwHiEpNBDUIcNsk 


**Running Instance Time:** Thu Sep 24 2026 22:15:08 GMT+0800 (Singapore Standard Time) (10 minutes)

**Screenshot 1 (Permissions tab listing <user>-launch):**

<img width="1286" height="678" alt="part" src="https://github.com/user-attachments/assets/4537ef42-6cee-44c7-97a1-c54041c7603a" />


**Screenshot 2 (Instance in Running state):**
<img width="1289" height="653" alt="screenshot_2" src="https://github.com/user-attachments/assets/3aa7be4a-7521-4dc8-9529-636faafd405a" />

## Part E
**t3.small / Tokyo Denial Error:** The AMI ID (ami-06380d26ad7176f2c) is not valid. The AMI might no longer exist or may be specific to another account or Region.

**Screenshot 1 (t3.small or Tokyo denial):**
<img width="1288" height="663" alt="screenshot_part_e" src="https://github.com/user-attachments/assets/f6d82fc5-0e04-4b9a-9788-d41c2916bc33" />


**Screenshot 2 (CloudTrail event showing errorMessage):**
<img width="1290" height="278" alt="screenshot_cloudtrail" src="https://github.com/user-attachments/assets/8586bda1-f0f2-4fc5-a813-8f3cfad1594c" />


## Part F Questions
1. Which action did the Part B error name?
   ec2:RunInstances — the console denied it because no identity-based policy attached to your user allowed that action.
2. In your policy, which condition limits `ec2:RunInstances`?
   The Condition block in the RunOnlyT3MicroInstances statement: 

"Condition": { "StringEquals": { "ec2:InstanceType": "t3.micro" } }

This restricts the Allow on ec2:RunInstances so it only applies when the requested instance type is exactly t3.micro — any other instance type (like t3.small) falls outside this statement's grant.

3. After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.
   
   Even with ec2:* on * attached as an identity-based policy, the permissions boundary (umak-lab-boundary) caps what your identity-based policies can ever grant — a boundary acts as an upper limit, not an addition. The relevant boundary statement is DenyAnyInstanceTypeButT3Micro, which explicitly denies RunInstances for any instance type other than t3.micro, regardless of what your own policy allows. Since a boundary's explicit Deny always wins over any identity-based Allow, t3.small stayed blocked. 

4. Why is `ec2:*` on `*` a poor policy even with a boundary?
   
   Because it grants far more access than the task requires — full read/write/delete control over every EC2 action and resource in the account (terminating others' instances, modifying any security group, changing network settings, etc.) — violating the principle of least privilege. A boundary limits the worst-case blast radius in specific ways (like instance type here), but it doesn't cover every possible action, so an overly broad policy still creates unnecessary risk anywhere the boundary doesn't explicitly restrict it. 

5. In two sentences: what does the boundary control that your policy cannot?
   
   A permissions boundary sets the maximum permissions an identity can ever have, acting as a hard ceiling that identity-based policies (even ones as broad as ec2:* on *) cannot exceed. Your own policy can only grant permissions within that ceiling — it has no ability to expand access beyond what the boundary allows, no matter how permissive you write it. 


