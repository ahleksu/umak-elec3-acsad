# Lab 1 Submission

## Part B
**Error Action Name:** Instance launch failed
You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/acsad-g03 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* because no identity-based policy allows the ec2:RunInstances action. Encoded authorization failure message: kTORnjWbAdMPcnZ4lDB3ywCpyGfyJZO1PaLsdhJ2Q7I1YRV92ZoixoqRConjruhRAUXH6RQsyw-4gvEDLDvgk_ka7y2MpzKx68DVeXDVHPzFLiudeytrUjk6-ZMEerq7UeioyIbvguFoDlnINQBFrNS1MFe9WsXtIAXVIbYEobriRm0jDG17NX2aGNgoZS_NtrZNugv78mkHOto19q-RgmbdQKEDkWcgi522w09i07JFtz2lX7BwR3WC9Y7crG1IPpOqq1z2ZZYq5UbgOqosHYQvAqX5jVR9RUbEKKieR4IJLXOFmMWRbExaADthVyfOtPkGBrJF0KsQSZsv6xypeKVOZ8ayJfHA-YF74kSKg3TqOg5e0Batu1y9VtWpakbZO8p48nP0yzXr_V6RftmaRljx1VQzbMc0oYdYU4HkHmCmVDGBCZyXKKvCbKWZN13NoZfER0p0soXkGO3TjNjdJDusfRVmxDKPmxH9eP_KnxtZFyzAlggkYsqV3Vvbype503l9dENG8d8ArR0qbp8PvmRVEnUdTJZv9tqDo-bnxO7o48p1re57O1EQuohp5MuWa0H6gI6H4YVMeTkqAQ8WqMV1U09s_NGOQORCIVgPS6o_XlBNifwBEPL6kGgFCH_bZZAWcsAGNPbI6Qlx52fM4wp1EneHK-sLfTJbfFTzXodRX0V42UYmXgUMrnDOtPFIp4AWmahsL2zaeDWmeBsDuKFwe8YhC-RUEn55imhC8b_WEzkK0Au82FqClezQoNYWA1ci9qUPTo-2ukuBhTDGM3KWm6FDSf6psaXgo4HBpMVSaBh0UUpbmlE


**Screenshot (Part B launch denial with username visible):**
<img width="1918" height="973" alt="image" src="https://github.com/user-attachments/assets/9af363e4-e3ea-4929-9da3-ce59d0fa8f47" />


## Part C
**Policy Statement Blanks:**
- `"Action"`: ec2:RunInstances
- `"Resource"`: instance
- `"ec2:InstanceType"`: t3.micro

## Part D
**Security Group Error Text:** Instance launch failed. You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/acsad-g03 is not authorized to perform: ec2:CreateSecurityGroup on resource: arn:aws:ec2:ap-southeast-1:548387266019:security-group/* because no identity-based policy allows the ec2:CreateSecurityGroup action.

**Running Instance Time:** 2026-09-24T14:02:32Z


**Screenshot 1 (Permissions tab listing <user>-launch):**
<img width="975" height="652" alt="image" src="https://github.com/user-attachments/assets/a4b28484-ca3f-4bda-a649-63a2edf2d83a" />


**Screenshot 2 (Instance in Running state):**
<img width="975" height="514" alt="image" src="https://github.com/user-attachments/assets/9366a224-8797-4b3a-998f-a3e8508e0721" />


## Part E
**t3.small / Tokyo Denial Error:** Instance launch failed. You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/acsad-g03 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary. Encoded authorization failure message: DrFq0YER0B2veqM_YcbXDP_kVNwg3ps-AnFoZRrvk1WEkSgNupV-n-Jq4GQ_6pHuInU74U_-mfOAZ2gESOkIELksblc81Xd0B_FBZ2kxV8_kfyyfK6S4cq7GCR8LT2TIAB1LwmbDRtuyXptUU4wGnGt2N4Gq9_D9DYuxMFtVsZ-Xg9_b4qMDTXPVt74uw8tw62LMakznulPFkTdu_54_Nrr8Io9WOYP2UnA3CjstgRFH_zkbbk52fQ2vl_yjQObSoW1qiXimomwPI2sXTJ-PuKK-qch77ReY8Oei-FYM2HsQ0ZvnvpIQa9EZW0NXqmbQe6mqFluV_OQxlv0t80pUMAwXOyGJ3-Y7IgNN0k7LWNdP0Z1tXqJ5dS2L8kbpimutykXURZftJNMa4ex3i_lEgsnxQeHS3b_kGcFM9-KsFJxr8twCgCauGPLiBaM5B4-dFWd18C-N8goQa1FQXljTnmKbg32kSPzjLNuzXbiZHbitufApOgTjhd4Vne0JEM-tzR1uMxQ9QDaECNt85Mntf5VHqCw8ubyEepf5_LX5diskfqQ0hvwOZOLjJ4A5M3dEwfSq1r4gLZSEnnwfVG3rNTrD8mBWJqUzLLUKVYUSVhns_rmGRESgUKTAb21v3giWyULMGbkvtnOgSBxwcQGAMV5ux59onedRfIVLDykkeE5V9TYmc9ckw8Uyf79ybmoeFn5jdmE-Ye2Sk_9eLNyb3DT4Yg9ldHxpJ39AzafwIAWM-43brdAOYSK3W4PjzrRJMWnacQ3liyheGSMOKQasyDYgYZMyBfaixPMkhcB5TWmIUEs5Qn33ZUNUpTEpVUdLopXAgVSDDO8E1uAzezwfm2Rvbs9u22mbU7opRAAK0IRlhMuTXE_mGFBeBqydOCuvzDJnXnmxGlRq786ANioEIRYHkk7vHHQSa1vKjEjT1BbRw3TE-FAviwx0QA

**Screenshot 1 (t3.small or Tokyo denial):**
<img width="975" height="435" alt="image" src="https://github.com/user-attachments/assets/7c4b316a-d7ec-418d-ae3f-fca9f6da0f26" />

**Screenshot 2 (CloudTrail event showing errorMessage):**
<img width="975" height="519" alt="image" src="https://github.com/user-attachments/assets/ff1090ad-b5ac-47dc-b803-e274e6ac8197" />

## Part F Questions
**1. Which action did the Part B error name?**

The error is named "ec2:RunInstances". The message said user acsad-g03 was not authorized to perform ec2:RunInstances on instance/ because no identity-based policy allowed it.
   
**2. In your policy, which condition limits `ec2:RunInstances`?**

   The StringEquals condition on ec2:InstanceType in the RunOnlyT3MicroInstances statement: "Condition": { "StringEquals": { "ec2:InstanceType": "t3.micro" } }. It only lets my user launch instances whose type is exactly t3.micro.
   
**3. After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.**

   The DenyAnyInstanceTypeButT3Micro statement in the umak-lab-boundary permissions boundary denied it. The error said "explicit deny in a permissions boundary," and an explicit Deny always beats any Allow, so ec2:* could not override it.
   
**4. Why is `ec2:*` on `*` a poor policy even with a boundary?**

   It violates least privilege, because it grants every EC2 action on every resource when the task only needs to launch one t3.micro. The boundary blocks only certain things, so any other EC2 action it doesn't cover would still be allowed. 
   
**5. In two sentences: what does the boundary control that your policy cannot?**

   The boundary sets the maximum permissions my user can ever have, no matter which policies are attached to it. The policy can only grant permissions inside that limit, and it cannot remove or override the boundary.
